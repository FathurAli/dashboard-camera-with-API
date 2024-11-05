<?php


namespace App\Http\Controllers\Backend\Admin;

use App\Models\module;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
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
        // $modules = module::orderBy('created_at', 'desc')->get();
        // return $modules;
        return view('backend.admin.modul.index');
    }

    public function getAll(Request $request)
    {
        if ($request->ajax()) {
            $modules = module::orderBy('created_at', 'desc')->get();
            return Datatables::of($modules)
                ->addColumn('action', function ($module) {
                    $html = '<div class="btn-group">';
                    // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-info mr-1 view" title="View" data-id_module="' . $module->id_module . '"><i class="fa fa-eye"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-warning mr-1 edit" title="Edit" data-id_module="' . $module->id_module . '"><i class="fa fa-edit"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-danger delete" title="Delete" data-id_module="' . $module->id_module . '"><i class="fa fa-trash"></i></button>';
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
    public function create( Request $request)
    {
     
             $Modules = module::all();
             $view = View::make('backend.admin.modul.create', compact('Modules'))->render();
             return response()->json(['html' => $view]);
         
    }
 

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
//     public function store(Request $request)
//    {
//       if ($request->ajax()) {
//                   $Modules = new module();
//                   $Modules->parent = $request->input('parent');
//                   $Modules->modul = $request->input('module');
//                   $Modules->controller = $request->input('controller');
//                   $Modules->urutan = $request->input('urutan');
//                   $Modules->save(); //
//                   return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
//          // } else {
//          //    abort(403, 'Sorry, you are not authorized to access the page');
//          // }
//       } else {
//          return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
//       }
//    }
public function store(Request $request)
{
    if ($request->ajax()) {
    

        $module = new module();
        $module->id_parent = $request->input('id_parent');
        $module->name_module = $request->input('name_module');
        $module->name_controller = $request->input('name_controller');
        $module->sort = $request->input('sort');
        // Masukkan input lainnya sesuai kebutuhan
        $module->save();

        return response()->json(['type' => 'success', 'message' => 'Successfully Created']);
    } else {
        return response()->json(['status' => 'false', 'message' => 'Access only ajax request']);
    }
}


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\module  $modules
     * @return \Illuminate\Http\Response
     */
    public function show($id, Request $request)
    {
       if ($request->ajax()) {
          $Modules = module::findOrFail($id);
          $view = View::make('backend.admin.module.view', compact('module'))->render();
          return response()->json(['html' => $view]);
       } else {
          return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
       }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\module  $module
     * @return \Illuminate\Http\Response
     */
    // public function edit(Request $request, $id)
    // {
    //     if ($request->ajax()) {
          
    //         $Modules = module::find($id);
            
    //              $view = View::make('backend.admin.modul.edit', compact('module'))->render();
    //              return response()->json(['html' => $view]);
             
    //        } else {
    //           return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
    //        }
    // }
    public function edit(Request $request, module $module)
{
   if ($request->ajax()) {
    
         $view = View::make('backend.admin.modul.edit', compact('module'))->render();
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
         
 
         $rules = [
             'id_parent' => 'required',
             'name_module' => 'required',
            'name_controller' => 'required',
            'sort' => 'required',
           
             
         ];
 
         $validator = Validator::make($request->all(), $rules);
        
 
                 $module = module::findOrFail($module->id_module);
                 $module->id_parent = $request->input('id_parent');
                 $module->name_module = $request->input('name_module');
                 $module->name_controller=$request->input('name_controller');
                 $module->sort=$request->input('sort');
                   
                   $module->save();
                    return response()->json(['type' => 'success', 'message' => "Successfully Updated"]);
                 
              
           
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