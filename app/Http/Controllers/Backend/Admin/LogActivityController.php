<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DataTables;
use Spatie\Activitylog\Models\Activity;

class LogActivityController extends Controller
{
    public function index(Request $request)
    {
        $log = Activity::latest()->get(); // Retrieve all data without pagination
        return view('backend.admin.log.index', [
            'models' => $log,
            'title' => 'Log Activities',
        ]);
    }

    public function getAll(Request $request)
    {
        if ($request->ajax()) {
            $logs = Activity::orderBy('created_at', 'desc')->get();
            return Datatables::of($logs)
                ->addColumn('status', function ($log) {
                    return $log->status ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>';
                })
                ->addColumn('action', function ($log) {
                    $html = '<div class="btn-group">';
                    // $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-info mr-1 view" title="View" data-id="' . $log->id . '"><i class="fa fa-eye"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-warning mr-1 edit" title="Edit" data-id="' . $log->id . '"><i class="fa fa-edit"></i></button>';
                    $html .= '<button data-toggle="tooltip" class="btn btn-xs btn-danger delete" title="Delete" data-id="' . $log->id . '"><i class="fa fa-trash"></i></button>';
                    $html .= '</div>';
                    return $html;
                })
                ->rawColumns(['action', 'status'])
                ->addIndexColumn()
                ->make(true);
        } else {
            return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
        }
    }
}
