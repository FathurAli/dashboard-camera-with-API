<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Models\Role;
use App\Models\User;
use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

use View;
use DB;

class UserController extends Controller
{
   /**
    * Display a listing of the resource.
    * @return \Illuminate\Http\Response
    */
   public function index()
   {
      $customNumber = config('app.custom_number');
        return view('backend.admin.user.index', ['customNumber' => $customNumber]);
    
   }

   public function getAll(Request $request)
   {
      if ($request->ajax()) {
         $users = Admin::orderBy('created_at', 'desc')->get();
         return Datatables::of($users)
         ->addColumn('status', function ($user) {
             return $user->status ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>';
          })
             ->addColumn('action', function ($user) {
                 $html = '<div class="btn-group">';
                 // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-info mr-1 view" title="View" data-id="' . $user->id . '"><i class="fa fa-eye"></i></button>';
                
                 $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-warning mr-1 edit" title="Edit" data-id="' . $user->id . '"><i class="fa fa-edit"></i></button>';
               //   $html .= '<a href="user/'. $user->id . '/cetakpdf" data-toggle="tooltip" data-id="' .$user->id . '" class="btn btn-xs btn-success mr-1 cetakpdf" title="PDF" target="_blank"><i class="fa fa-print"></i> </a>';
                 $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-danger delete" title="Delete" data-id="' . $user->id . '"><i class="fa fa-trash"></i></button>';
                 $html .= '</div>';
                 return $html;
             })
             ->rawColumns(['action','status'])
             ->addIndexColumn()
             ->make(true);
     } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
     }
   }
   // public function getAll(Request $request)
   // {
   //     if ($request->ajax()) {
   //         $admins = Admin::orderBy('created_at', 'desc')->get();
   //         return Datatables::of($admins)
   //         ->addColumn('status', function ($user) {
   //             return $user->status ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>';
   //          })
   //             ->addColumn('action', function ($user) {
   //                 $html = '<div class="btn-group">';
   //                 // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-info mr-1 view" title="View" data-id="' . $user->id . '"><i class="fa fa-eye"></i></button>';
                  
   //                 $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-warning mr-1 edit" title="Edit" data-id="' . $user->id . '"><i class="fa fa-edit"></i></button>';
   //                 $html .= '<a href="user/'. $user->id . '/cetakpdf" data-toggle="tooltip" data-id="' .$user->id . '" class="btn btn-xs btn-success mr-1 cetakpdf" title="PDF" target="_blank"><i class="fa fa-print"></i> </a>';
   //                 // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-danger delete" title="Delete" data-id="' . $admin->id . '"><i class="fa fa-trash"></i></button>';
   //                 $html .= '</div>';
   //                 return $html;
   //             })
   //             ->rawColumns(['action','status'])
   //             ->addIndexColumn()
   //             ->make(true);
   //     } else {
   //         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
   //     }
   // }


   /**
    * Show the form for creating a new resource.
    * @return \Illuminate\Http\Response
    */
   public function create(Request $request)
   {
    
            $roles = Role::all();
            $view = View::make('backend.admin.user.create', compact('roles'))->render();
            return response()->json(['html' => $view]);
        
   }

   /**
    * Store a newly created resource in storage.
    *
    * @param  \Illuminate\Http\Request $request
    *
    * @return \Illuminate\Http\Response
    */
   //  public function store(Request $request)
   //  {
   //      // Setup the validator
   //      $rules = [
   //          'name' => 'required',
   //          'email' => 'required|email|unique:users,email',
   //          'password' => 'required|same:confirm-password',
   //          'photo' => 'image|max:2024|mimes:jpeg,jpg,png'
   //      ];
    
   //      $validator = Validator::make($request->all(), $rules);
   //      if ($validator->fails()) {
   //          return response()->json([
   //              'type' => 'error',
   //              'errors' => $validator->getMessageBag()->toArray()
   //          ]);
   //      } else {
   //          $file_path = "assets/images/users/default.png";
    
   //          if ($request->hasFile('photo')) {
   //              if ($request->file('photo')->isValid()) {
   //                  $destinationPath = public_path('assets/images/users/');
   //                  $extension = $request->file('photo')->getClientOriginalExtension();
   //                  $fileName = time() . '.' . $extension;
   //                  $file_path = 'assets/images/users/' . $fileName;
   //                  $request->file('photo')->move($destinationPath, $fileName);
   //              } else {
   //                  return response()->json([
   //                      'type' => 'error',
   //                      'message' => "<div class='alert alert-warning'>Please! File is not valid</div>"
   //                  ]);
   //              }
   //          }
    
   //          DB::beginTransaction();
   //          try {
   //              $user = new User();
   //              $user->name = $request->input('name');
   //              $user->email = $request->input('email');
   //              $user->password = Hash::make($request->input('password'));
   //              $user->file_path = $file_path;
   //              $user->save();
    
   //              // Assign role
   //              $roles = $request->input('roles');
   //              if (isset($roles)) {
   //                  $user->assignRole($roles);
   //              }
    
   //              DB::commit();
   //              return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
   //          } catch (\Exception $e) {
   //              DB::rollback();
   //              return response()->json(['type' => 'error', 'message' => $e->getMessage()]);
   //          }
   //      }
   //  }
    
   public function store(Request $request)
   {
      if ($request->ajax()) {
         // $haspermision = auth()->user()->can('proyek-create');
         // if ($haspermision) {

                  // $delete_rp = str_replace("Rp","", $request->input('nilai_kontrak') ); $request->input('title');
                  // $delete_dot = str_replace(".","", $delete_rp);
                  // $delete_space = str_replace(" ","", $delete_dot);

                  $user = new Admin;
                  $user->name = $request->input('name');
                  $user->email = $request->input('email');
                  $user->password = password_hash($request->input('password'), PASSWORD_BCRYPT);
                  // $roles = $request->input('roles');
                  //              if (isset($roles)) {
                  //                  $user->assignRole($roles);
                  //              }
                  // $user->nama_pekerjaan = $request->input('nama_pekerjaan');
                  // $user->no_spk = $request->input('no_spk');
                  // $user->tgl_spk = $request->input('tgl_spk');
                  // $user->tgl_awal = $request->input('tgl_awal');
                  // $user->tgl_akhir = $request->input('tgl_akhir');
                  // $user->nilai_kontrak = $delete_space;
                  // $user->tgl_bast = $request->input('tgl_bast');
                  // $user->no_bast = $request->input('no_bast');
                  // $user->keterangan = $request->input('keterangan');
                  // $user->status_proyek = $request->input('status_proyek');
                  // $user->metode_pembayaran = $request->input('metode_pembayaran');
                  // $user->id_quotation = $request->input('id_quotation');
                  // $user->uploaded_by = auth()->user()->id;
                  $user->save(); //
                  return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
         // } else {
         //    abort(403, 'Sorry, you are not authorized to access the page');
         // }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }
   /**
    * Display the specified resource.
    *
    * @param  int $id
    *
    * @return \Illuminate\Http\Response
    */
   public function show($id, Request $request)
   {
      if ($request->ajax()) {
         $user = User::findOrFail($id);
         $view = View::make('backend.admin.user.view', compact('user'))->render();
         return response()->json(['html' => $view]);
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Show the form for editing the specified resource.
    *
    * @param  int $id
    *
    * @return \Illuminate\Http\Response
    */
    public function edit(Request $request, $id)
    {
      if ($request->ajax()) {
          
         $user = Admin::find($id);
         
              $view = View::make('backend.admin.user.edit', compact('user'))->render();
              return response()->json(['html' => $view]);
          
        } else {
           return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
    }

   /**
    * Update the specified resource in storage.
    *
    * @param  \Illuminate\Http\Request $request
    * @param  int $id
    *
    * @return \Illuminate\Http\Response
    */
   public function update(Request $request, Admin $user)
   {
      if ($request->ajax()) {
         
 
         $rules = [
             'name' => 'required',
             'email' => 'required',
            'password' => 'required',
            'status' => 'required',
           
             
         ];
 
         $validator = Validator::make($request->all(), $rules);
        
 
                 $user = Admin::findOrFail($user->id);
                 $user->name = $request->input('name');
                 $user->email = $request->input('email');
                 $user->password = password_hash($request->input('password'), PASSWORD_BCRYPT);
                 $user->status=$request->input('status');
                   
                   $user->save();
                    return response()->json(['type' => 'success', 'message' => "Successfully Updated"]);
                 
              
           
        } else {
           return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
   }

   /**
    * Remove the specified resource from storage.
    *
    * @param  int $id
    *
    * @return \Illuminate\Http\Response
    */
   public function destroy($id, Request $request)
   {
      if ($request->ajax()) {

         $user = Admin::findOrFail($id); //Get user with specified id
         $user->delete();
         return response()->json(['type' => 'success', 'message' => "Successfully Deleted"]);
   } else {
      return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
   }
   }
}






