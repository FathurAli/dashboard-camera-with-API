<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;
use App\Models\PrintSetting;
use View;
use DB;

class PrintSettingController extends Controller
{
   /**
    * Display a listing of the resource.
    * @return \Illuminate\Http\Response
    */
   public function index(Request $request)
   {
      return view('backend.admin.printsetting.index');
   }

   public function getAll(Request $request)
   {
      if ($request->ajax()) {
         $can_edit = $can_delete = '';
         if (!auth()->user()->can('printsetting-edit')) {
            $can_edit = "style='display:none;'";
         }
         if (!auth()->user()->can('printsetting-delete')) {
            $can_delete = "style='display:none;'";
         }

         $printsetting = PrintSetting::orderby('created_at', 'desc')->get();
         return Datatables::of($printsetting)
           ->addColumn('file_path', function ($printsetting) {
              return "<img src='" . asset($printsetting->file_path) . "' width='60px'>";
           })
           ->addColumn('title', function ($printsetting) {
              return Str::words($printsetting->title, 10, '...');
           })
           ->addColumn('status', function ($printsetting) {
              return $printsetting->status ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>';
           })
           ->addColumn('action', function ($printsetting) use ($can_edit, $can_delete) {
              $html = '<div class="btn-group">';
              $html .= '<a data-toggle="tooltip" ' . $can_edit . '  id="' . $printsetting->id . '" class="btn btn-xs btn-info mr-1 edit" title="Edit"><i class="fa fa-edit"></i> </a>';
              $html .= '<a data-toggle="tooltip" ' . $can_delete . ' id="' . $printsetting->id . '" class="btn btn-xs btn-danger delete" title="Delete"><i class="fa fa-trash"></i> </a>';
              $html .= '</div>';
              return $html;
           })
           ->rawColumns(['action', 'status', 'file_path'])
           ->addIndexColumn()
           ->make(true);
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Show the form for creating a new resource.
    * @return \Illuminate\Http\Response
    */
   public function create(Request $request)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-create');
         if ($haspermision) {
            $view = View::make('backend.admin.printsetting.create')->render();
            return response()->json(['html' => $view]);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Store a newly created resource in storage.
    *
    * @param  \Illuminate\Http\Request $request
    *
    * @return \Illuminate\Http\Response
    */
   public function store(Request $request)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('printsetting-create');
         if ($haspermision) {

            $rules = [
              'photo' => 'max:2048|dimensions:max_width=2000,max_height=1000', // 2mb
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
               return response()->json([
                 'type' => 'error',
                 'errors' => $validator->getMessageBag()->toArray()
               ]);
            } else {

               $upload_ok = 1;
               $file_path = 'assets/images/printsetting/default.png';

               if ($request->hasFile('photo')) {
                  $extension = strtolower($request->file('photo')->getClientOriginalExtension());
                  if ($extension == "jpg" || $extension == "jpeg" || $extension == "png") {
                     if ($request->file('photo')->isValid()) {
                        $destinationPath = public_path('assets/images/printsetting'); // upload path
                        $extension = $request->file('photo')->getClientOriginalExtension(); // getting image extension
                        $fileName = time() . '.' . $extension; // renameing image
                        $file_path = 'assets/images/printsetting/' . $fileName;
                        $request->file('photo')->move($destinationPath, $fileName); // uploading file to given path
                        $upload_ok = 1;

                     } else {
                        return response()->json([
                          'type' => 'error',
                          'message' => "<div class='alert alert-warning'>File is not valid</div>"
                        ]);
                     }
                  } else {
                     return response()->json([
                       'type' => 'error',
                       'message' => "<div class='alert alert-warning'>Error! File type is not valid</div>"
                     ]);
                  }
               }

               if ($upload_ok == 0) {
                  return response()->json([
                    'type' => 'error',
                    'message' => "<div class='alert alert-warning'>Sorry Failed</div>"
                  ]);
               } else {
                  $printsetting = new PrintSetting;
                  $printsetting->footer = $request->input('footer');
                  $printsetting->uploaded_by = auth()->user()->id;
                  $printsetting->file_path = $file_path;
                  $printsetting->save(); //
                  return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
               }
            }
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Display the specified resource.
    *
    * @param  \App\Models\PrintSetting $printsetting
    *
    * @return \Illuminate\Http\Response
    */
   public function show(Request $request, PrintSetting $printsetting)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-view');
         if ($haspermision) {
            $view = View::make('backend.admin.printsetting.view', compact('printsetting'))->render();
            return response()->json(['html' => $view]);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Show the form for editing the specified resource.
    *
    * @param  \App\Models\PrintSetting $printsetting
    *
    * @return \Illuminate\Http\Response
    */
   public function edit(Request $request, PrintSetting $printsetting)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-edit');
         if ($haspermision) {
            $view = View::make('backend.admin.printsetting.edit', compact('printsetting'))->render();
            return response()->json(['html' => $view]);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Update the specified resource in storage.
    *
    * @param  \Illuminate\Http\Request $request
    * @param  \App\Models\PrintSetting $printsetting
    *
    * @return \Illuminate\Http\Response
    */
   public function update(Request $request, PrintSetting $printsetting)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('printsetting-edit');
         if ($haspermision) {

            $rules = [
              'photo' => 'max:20480|dimensions:max_width=20000,max_height=10000', // 20mb
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
               return response()->json([
                 'type' => 'error',
                 'errors' => $validator->getMessageBag()->toArray()
               ]);
            } else {

               if ($request->hasFile('photo')) {
                  $extension = strtolower($request->file('photo')->getClientOriginalExtension());
                  if ($extension == "jpg" || $extension == "jpeg" || $extension == "png") {
                     if ($request->file('photo')->isValid()) {
                        $destinationPath = public_path('assets/images/printsetting'); // upload path
                        $extension = $request->file('photo')->getClientOriginalExtension(); // getting image extension
                        $fileName = time() . '.' . $extension; // renameing image
                        $file_path = 'assets/images/printsetting/' . $fileName;
                        $request->file('photo')->move($destinationPath, $fileName); // uploading file to given path
                        $upload_ok = 1;

                     } else {
                        return response()->json([
                          'type' => 'error',
                          'message' => "<div class='alert alert-warning'>File is not valid</div>"
                        ]);
                     }
                  } else {
                     return response()->json([
                       'type' => 'error',
                       'message' => "<div class='alert alert-warning'>Error! File type is not valid</div>"
                     ]);
                  }
               } else {
                  $upload_ok = 1;
                  $file_path = $request->input('SelectedFileName');
               }

               if ($upload_ok == 0) {
                  return response()->json([
                    'type' => 'error',
                    'message' => "<div class='alert alert-warning'>Sorry Failed</div>"
                  ]);
               } else {
                  $printsetting = PrintSetting::findOrFail($printsetting->id);
                  $printsetting->footer = $request->input('footer');
                  $printsetting->uploaded_by = auth()->user()->id;
                  $printsetting->file_path = $file_path;
                  $printsetting->save(); //
                  return response()->json(['type' => 'success', 'message' => "Successfully Updated"]);
               }
            }
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Remove the specified resource from storage.
    *
    * @param  \App\Models\PrintSetting $printsetting
    *
    * @return \Illuminate\Http\Response
    */
   public function destroy(Request $request, PrintSetting $printsetting)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-delete');
         if ($haspermision) {
            $printsetting->delete();
            return response()->json(['type' => 'success', 'message' => 'Successfully Deleted']);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

}
