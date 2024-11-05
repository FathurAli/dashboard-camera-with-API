<?php

namespace App\Http\Controllers\Backend\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Vendor;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;

class VendorController extends Controller
{
    public function index(Request $request)
    {
        return view('backend.admin.datamaster.vendor.index');
    }

    public function getAll(Request $request)
    {
        if ($request->ajax()) {
            $vendors = Vendor::orderBy('created_at', 'desc')->get();
            return Datatables::of($vendors)
                ->addColumn('action', function ($vendor) {
                    $html = '<div class="btn-group">';
                    // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-info mr-1 view" title="View" data-id="' . $vendor->id . '"><i class="fa fa-eye"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-warning mr-1 edit" title="Edit" data-id="' . $vendor->id . '"><i class="fa fa-edit"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-danger delete" title="Delete" data-id="' . $vendor->id . '"><i class="fa fa-trash"></i></button>';
                    $html .= '</div>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->addIndexColumn()
                ->make(true);
        } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
    }
    public function create(Request $request)
    {
        if ($request->ajax()) {
            $hasPermission = Auth::user()->can('notice-create');
          
            if ($hasPermission) {
                $view = View::make('backend.admin.datamaster.vendor.create')->render();
                return response()->json(['html' => $view]);
            } else {
                abort(403, 'Sorry, you are not authorized to access the page');
            }
        } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
    }

    public function store(Request $request)
    {
       if ($request->ajax()) {
          $haspermision = auth()->user()->can('vendor-create');
          if ($haspermision) {      
          

            $vendor = new Vendor;
            $vendor->code = $request->input('code');
            $vendor->supplier_name = $request->input('supplier_name'); 
            $vendor->address = $request->input('address');
            $vendor->npwp = $request->input('npwp');
            $vendor->pic_name = $request->input('pic_name');
            $vendor->pic_phone = $request->input('pic_phone');
            $vendor->pic_email = $request->input('pic_email');
            $vendor->description = $request->input('description');
            $vendor->created_by = auth()->user()->id;      
            $vendor->save(); //
            return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
                
             
          } else {
             abort(403, 'Sorry, you are not authorized to access the page');
          }
       } else {
          return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
       }
    }

    public function edit(Request $request, Vendor $vendor)
    {
        if ($request->ajax()) {
            $haspermision = auth()->user()->can('notice-edit');
            if ($haspermision) {
                $view = View::make('backend.admin.datamaster.vendor.edit', compact('vendor'))->render();
                return response()->json(['html' => $view]);
            } else {
               abort(403, 'Sorry, you are not authorized to access the page');
            }
        } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
    }

    public function update(Request $request,Vendor $vendor)
{
    if ($request->ajax()) {
        $haspermision = auth()->user()->can('ven$vendor-edit');
        if ($haspermision) {      
          

          
            $vendor->code = $request->input('code');
            $vendor->supplier_name = $request->input('supplier_name'); 
            $vendor->address = $request->input('address');
            $vendor->npwp = $request->input('npwp');
            $vendor->pic_name = $request->input('pic_name');
            $vendor->pic_phone = $request->input('pic_phone');
            $vendor->pic_email = $request->input('pic_email');
            $vendor->description = $request->input('description');
            $vendor->created_by = auth()->user()->id;      
            $vendor->save(); //
            return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
                
             
          } else {
             abort(403, 'Sorry, you are not authorized to access the page');
          }
     } else {
        return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
     }
} 
public function destroy(Request $request, Vendor $vendor)
{
    if ($request->ajax()) {
        $haspermision = auth()->user()->can('notice-delete');
        if ($haspermision) {
            $vendor->delete();
            
            // Tambahkan key "reload" dengan nilai true pada respon JSON
            return response()->json(['type' => 'success', 'message' => 'Successfully Deleted']);
        } else {
            abort(403, 'Sorry, you are not authorized to access the page');
        }
    } else {
        return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
    }
}
}
