<?php

namespace App\Http\Controllers\Backend\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\module;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;
class ModuleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.admin.module.index');
    }

    public function getAll(Request $request)
    {
        if ($request->ajax()) {
            $modules = module::orderBy('created_at', 'desc')->get();
            return Datatables::of($modules)
                ->addColumn('action', function ($module) {
                    $html = '<div class="btn-group">';
                    // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-info mr-1 view" title="View" data-id="' . $module->id . '"><i class="fa fa-eye"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-warning mr-1 edit" title="Edit" data-id="' . $module->id_module . '"><i class="fa fa-edit"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-danger delete" title="Delete" data-id="' . $module->id . '"><i class="fa fa-trash"></i></button>';
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
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if ($request->ajax()) {
           
                $view = View::make('backend.admin.module.create')->render();
                return response()->json(['html' => $view]);
           
        } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       if ($request->ajax()) {
             
          

            $client = new module;
            $client->id_parent = $request->input('id_parent');
            $client->save(); //
            return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
                
             
         
       } else {
          return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
       }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\module  $module
     * @return \Illuminate\Http\Response
     */
    public function show(module $module)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\module  $module
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request,module $module)
    {
        if ($request->ajax()) {
            
               $view = View::make('backend.admin.module.edit', compact('module'))->render();
               return response()->json(['html' => $view]);
            
         } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
         }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\module  $module
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, module $module)
    {
        if ($request->ajax()) {
           
                  
                    // $client = new Client;
                     $module->id_parent = $request->input('id_parent');
                     
                     
                     $module->save(); //
                     return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
                  
               

         } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
         }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\module  $module
     * @return \Illuminate\Http\Response
     */
    public function destroy(module $module)
    {
        //
    }
}
