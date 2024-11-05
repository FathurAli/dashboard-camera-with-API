<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use App\Models\EventWorker;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;

class EventworkersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      
        return view('backend.admin.report.activity.index');
    }
   //  public function getAll(Request $request)
   //  {
   //      if ($request->ajax()) {
   //          $can_edit = $can_delete = '';
   //          if (!auth()->user()->can('activity-edit')) {
   //              $can_edit = "style='display:none;'";
   //          }
   //          if (!auth()->user()->can('activity-delete')) {
   //              $can_delete = "style='display:none;'";
   //          }

   //          $activity = EventWorker::all();
   //          return Datatables::of($activity)
   //              ->addColumn('snapshot', function ($activity) {
   //                  return "<img src='" . asset($activity->snapshot) . "' width='60px'>";
   //              })
   //              ->addColumn('title', function ($activity) {
   //                  return Str::words($activity->activity_name, 10, '...');
   //              })
   //              ->addColumn('status', function ($activity) {
   //                  return $activity->status ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>';
   //              })
   //              ->addColumn('action', function ($activity) use ($can_edit, $can_delete) {
   //                  $html = '<div class="btn-group">';
   //                  $html .= '<a data-toggle="tooltip" ' . $can_edit . ' id="' . $activity->id . '" class="btn btn-xs btn-info mr-1 edit" title="Edit"><i class="fa fa-edit"></i> </a>';
   //                  $html .= '<a data-toggle="tooltip" ' . $can_delete . ' id="' . $activity->id . '" class="btn btn-xs btn-danger delete" title="Delete"><i class="fa fa-trash"></i> </a>';
   //                  $html .= '</div>';
   //                  return $html;
   //              })
   //              ->rawColumns(['action', 'status', 'snapshot'])
   //              ->addIndexColumn()
   //              ->make(true);
   //      } else {
   //          return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
   //      }
   //  }
   public function getAll(Request $request)
      {
         // if ($request->ajax()) {
            // Limit the number of records to 10,000
            $EventWorkers = EventWorker::orderBy('timestamp', 'desc')->take(10000)->get();
            
            return Datatables::of($EventWorkers)
                  ->addColumn('action', function ($EventWorker) {
                     $html = '<div class="btn-group">';
                     // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-info mr-1 view" title="View" data-id="' . $EventWorker->id . '"><i class="fa fa-eye"></i></button>';
                     $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-warning mr-1 edit" title="Edit" data-id="' . $EventWorker->id . '"><i class="fa fa-edit"></i></button>';
                     $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-danger delete" title="Delete" data-id="' . $EventWorker->id . '"><i class="fa fa-trash"></i></button>';
                     $html .= '</div>';
                     return $html;
                  })
                  ->rawColumns(['action'])
                  ->addIndexColumn()
                  ->make(true);
         // } else {
         //    return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
         // }
      }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-create');
        
            $view = View::make('backend.admin.report.activity.create')->render();
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
         
         

            $rules = [
              'snapshot' => 'max:20480|dimensions:max_width=20000,max_height=10000', // 20mb
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
               return response()->json([
                 'type' => 'error',
                 'errors' => $validator->getMessageBag()->toArray()
               ]);
            } else {

               $upload_ok = 1;
               $snapshot = 'event_workers/default.png';

               if ($request->hasFile('snapshot')) {
                  $extension = strtolower($request->file('snapshot')->getClientOriginalExtension());
                  if ($extension == "jpg" || $extension == "jpeg" || $extension == "png") {
                     if ($request->file('snapshot')->isValid()) {
                        $destinationPath = public_path('event_workers'); // upload path
                        $extension = $request->file('snapshot')->getClientOriginalExtension(); // getting image extension
                        $fileName = time() . '.' . $extension; // renameing image
                        $snapshot = 'event_workers/' . $fileName;
                        $request->file('snapshot')->move($destinationPath, $fileName); // uploading file to given path
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
                  $activity = new Eventworker;
                  $activity->worker_id = $request->input('worker_id');
                  $activity->activity_id = $request->input('activity_id');
                  $activity->activity_name = $request->input('activity_name');
                  $activity->event_scene_id = $request->input('event_scene_id');
                  $activity->snapshot = $snapshot;
                  $activity->save(); //
                  return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
               }
            }
        
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\activity  $activity
     * @return \Illuminate\Http\Response
     */
    public function show(EventWorker $eventWorker)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EventWorker  $EventWorker
     * @return \Illuminate\Http\Response
     */
    

    public function edit(Request $request, EventWorker $eventworkers)
    {
        if ($request->ajax()) {
            // Fetch the necessary data to populate the form fields
            $worker_id = $eventworkers->worker_id;
            $event_scene_id = $eventworkers->event_scene_id;
            $activity_id = $eventworkers->activity_id;
            $activity_name = $eventworkers->activity_name;
    
            // Render the view with the data
            $view = View::make('backend.admin.report.Activity.edit', compact('worker_id', 'event_scene_id', 'activity_id', 'activity_name'))->render();
            return response()->json(['html' => $view]);
        } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
    }
    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\activity  $activity
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EventWorker $eventworkers)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\activity  $activity
     * @return \Illuminate\Http\Response
     */
    public function destroy(activity $activity)
    {
        //
    }

    public function showEventWorkers()
    {
        $eventWorkers = EventWorker::all();
        return response()->json($eventWorkers);
    }
}
