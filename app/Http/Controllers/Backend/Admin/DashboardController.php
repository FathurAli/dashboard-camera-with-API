<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User; // Assuming your user model is named 'User'
use App\Models\EventWorker;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        // $level_scope = Operator_menu::join('menus', 'operator_menu.menu_id', '=', 'menus.id')
		// ->join('operator_level', 'operator_menu.operator_level_id', '=', 'operator_level.id')
		// ->where('operator_level_id', $level)
		// ->where('link', 'LIKE',  $newUrl . '%')
		// ->get();
        // return $level_scope;
        return view('backend.admin.home');
    }

    public function dashboardlajur(Request $request, $id_titiklajur)
    {

        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');
        $shiftstr = $request->input('shift');

        $shift = str_replace('%20', ' ', $shiftstr);

        $titlelajur = '';
        $deviceNumber = '';

        switch ($id_titiklajur) {
            case '1':
                $titlelajur = "Persiapan Rakitan Tulangan";
                $deviceNumber = '0';
                break;
            case '2':
                $titlelajur = "Stok Rakitan Tulangan";
                $deviceNumber = '1';
                break;
            case '3':
                $titlelajur = "Perakitan Tulangan";
                $deviceNumber = '2';
                break;
            case '4':
                $titlelajur = "Pengecoran";
                $deviceNumber = '3';
                break;
            case '5':
                $titlelajur = "Perenggangan Tulangan";
                $deviceNumber = '4';
                break;
            case '6':
                $titlelajur = "Pemutaran Cetakan & UAP";
                $deviceNumber = '5';
                break;
            case '7':
                $titlelajur = "Pembukaan Cetakan";
                $deviceNumber = '6';
                break;
        }

        $eventWorkers = DB::table('view_report')
                            ->where('device_number', $deviceNumber)
                            ->orderBy('timestamp', 'desc')
                            ->paginate(12);

        return view('backend.admin.dashboard.lajurdetail', compact('id_titiklajur', 'titlelajur', 'eventWorkers' ,'startDate', 'endDate', 'shift'));
    }

    public function filterdashboardlajur(Request $request)
    {
        $id_titiklajur = $request->input('id_titiklajur');
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');
        $shiftstr = $request->input('shift');

        $shift = str_replace('%20', ' ', $shiftstr);

        $titlelajur = '';
        $deviceNumber = '';

        switch ($id_titiklajur) {
            case '1':
                $titlelajur = "Persiapan Rakitan Tulangan";
                $deviceNumber = '0';
                break;
            case '2':
                $titlelajur = "Stok Rakitan Tulangan";
                $deviceNumber = '1';
                break;
            case '3':
                $titlelajur = "Perakitan Tulangan";
                $deviceNumber = '2';
                break;
            case '4':
                $titlelajur = "Pengecoran";
                $deviceNumber = '3';
                break;
            case '5':
                $titlelajur = "Perenggangan Tulangan";
                $deviceNumber = '4';
                break;
            case '6':
                $titlelajur = "Pemutaran Cetakan & UAP";
                $deviceNumber = '5';
                break;
            case '7':
                $titlelajur = "Pembukaan Cetakan";
                $deviceNumber = '6';
                break;
        }

        $query = DB::table('view_report')
                    ->where('device_number', $deviceNumber)
                    ->whereBetween('timestamp', [$startDate, $endDate])
                    ->orderBy('timestamp', 'desc');
                    if (!empty($shift) && $shift !== 'All') {
                        $query->where('shift', $shift);
                    }

                    $eventWorkers = $query->paginate(12)->appends([
                        'id_titiklajur' => $id_titiklajur,
                        'start_date' => $startDate,
                        'end_date' => $endDate,
                        'shift' => $shift
                    ]);
                
                    if ($request->ajax()) {
                        return response()->json([
                            'html' => view('backend.partials.event_workers', ['eventWorkers' => $eventWorkers])->render(),
                            'pagination' => $eventWorkers->links('pagination::bootstrap-4')->render()
                        ]);
                    }

        return view('backend.admin.dashboard.lajurdetail', compact('id_titiklajur', 'startDate', 'endDate', 'shift', 'titlelajur', 'eventWorkers'));

    }
}
