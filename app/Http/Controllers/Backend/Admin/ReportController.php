<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use App\Models\report;
use App\Models\Grafik;
use Illuminate\Http\Request;
use App\Models\Pekerjaan;
use App\Charts\MonthlyUsersChart;
use App\Charts\MonthlyUsersChart1;
use App\Charts\MonthlyUsersChart2;

class ReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function index()
    // {
    //     return view('backend.admin.report.index');
    // }
    public function index(Request $request)
    {
        $month = $request->input('month');
    
        if ($month) {
            // Mengambil data berdasarkan bulan yang dipilih
            $grafikData = Grafik::whereYear('tanggal', '=', date('Y', strtotime($month)))
                                ->whereMonth('tanggal', '=', date('m', strtotime($month)))
                                ->get();
        } else {
            // Mengambil semua data jika tidak ada filter bulan yang dipilih
            $grafikData = Grafik::all();
        }
    
        return view('backend.admin.report.index_bar', compact('grafikData'));
    }
    
    // public function index(MonthlyUsersChart $chart)
    // {
    //     return view('backend.admin.report.index_bar');
    // }

    public function index1(Request $request)
    {
        $month = $request->input('month');
    
        if ($month) {
            // Mengambil data berdasarkan bulan yang dipilih
            $grafikData = Grafik::whereYear('tanggal', '=', date('Y', strtotime($month)))
                                ->whereMonth('tanggal', '=', date('m', strtotime($month)))
                                ->get();
        } else {
            // Mengambil semua data jika tidak ada filter bulan yang dipilih
            $grafikData = Grafik::all();
        }
        return view('backend.admin.report.index_line', compact('grafikData'));
        
    }
    public function index2(Request $request)
    {
        $month = $request->input('month');
    
        if ($month) {
            // Mengambil data berdasarkan bulan yang dipilih
            $grafikData = Grafik::whereYear('tanggal', '=', date('Y', strtotime($month)))
                                ->whereMonth('tanggal', '=', date('m', strtotime($month)))
                                ->get();
        } else {
            // Mengambil semua data jika tidak ada filter bulan yang dipilih
            $grafikData = Grafik::all();
        }
        return view('backend.admin.report.index_pie', compact('grafikData'));
      
        // return view('backend.admin.report.index1', [
        //     'chart1' => $chart->build(),
         
        // ]);
    }


    // public function getChartData(Request $request)
    // {
    //     $startDate = $request->input('start_date');
    //     $endDate = $request->input('end_date');

    //     $data = Pekerjaan::whereBetween('tanggal', [$startDate, $endDate])
    //                      ->pluck('jumlah');

    //     return response()->json($data);
    // }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\report  $report
     * @return \Illuminate\Http\Response
     */
    public function show(report $report)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\report  $report
     * @return \Illuminate\Http\Response
     */
    public function edit(report $report)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\report  $report
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, report $report)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\report  $report
     * @return \Illuminate\Http\Response
     */
    public function destroy(report $report)
    {
        //
    }
}
