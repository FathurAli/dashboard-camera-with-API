<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\ViewReport;
use DB;

class ProduktivitasController extends Controller
{
    // public function index(){
    //     return view("backend.admin.produktivitas.index");
    // }
    public function index(Request $request)
    {
        $startDate = $request->input('start_date', Carbon::today()->toDateString());
        $endDate = $request->input('end_date', Carbon::today()->toDateString());
        $shift = $request->input('shift', "All") ;
        // $device_number1 = $request->input('device_number1', "All") ;
        $actifitas = $request->input('actifitas', "All") ;

        if (!strtotime($startDate)) {
            $startDate = null;
        }

        if (!strtotime($endDate)) {
            $endDate = null;
        }

        if (is_array($shift)) {
            // Jika "Selected" dipilih, ubah nilainya menjadi "All"
            $shift = array_diff($shift, ['Selected']); // Menghilangkan "Selected" dari array
            $shift = array_merge($shift, ['All']); // Menambahkan "All" ke array
        }
        if (is_array($actifitas)) {
            // Jika "Selected" dipilih, ubah nilainya menjadi "All"
            $actifitas = array_diff($actifitas, ['Selected']); // Menghilangkan "Selected" dari array
            $actifitas = array_merge($actifitas, ['All']); // Menambahkan "All" ke array
        }
        // Validate and set dates if provided
        if ($startDate) {
            try {
                $startDate = Carbon::parse($startDate)->format('Y-m-d');
            } catch (\Exception $e) {
                return response()->json(['error' => 'Invalid start date format'], 400);
            }
        }
        // Mengatur nilai default jika 'Selected' dipilih
        if ($shift === 'Selected') {
            $shift = 'All';
        }
        if ($actifitas === 'Selected') {
            $actifitas = 'All';
        }

        // Menentukan nilai device_number1 berdasarkan actifitas
        if ($actifitas === 'All') {
            $device_number1 = null;
        } else {
            switch ($actifitas) {
                case 7:
                    $device_number1 = 0;
                    break;
                case 8:
                    $device_number1 = 1;
                    break;
                case 6:
                    $device_number1 = 2;
                    break;
                case 5:
                    $device_number1 = 3;
                    break;
                case 2:
                    $device_number1 = 4;
                    break;
                case 1:
                    $device_number1 = 5;
                    break;
                case 4:
                    $device_number1 = 6;
                    break;
                case 0:
                    $device_number1 = 7;
                    break;
                default:
                    $device_number1 = -1;
                    break;
            }
        }

        // Example of caching in your filter method
        $cacheKey = 'filtered_data_' . md5(serialize([$startDate, $endDate, $shift, $device_number1, $actifitas]));
        $data = cache()->remember($cacheKey, now()->addSeconds(1), function () use ($startDate, $endDate, $shift, $device_number1, $actifitas) {
            return $this->getData($startDate, $endDate, $shift, $device_number1, $actifitas);
        });

        // Menghasilkan rentang tanggal
        $dates = $this->generateDateRange($startDate, $endDate);

        // Inisialisasi array untuk menyimpan hasil query yang dikelompokkan berdasarkan device_number, shift, dan tanggal
        $queryResults = [];
        $rowspanCount = [];
        $totalByShiftAndDate = [];
        $countByShiftAndDate = [];

        // Menghitung rowspan untuk setiap shift
        foreach ($data['data'] as $row) {
            if (!isset($rowspanCount[$row->shift])) {
                $rowspanCount[$row->shift] = 0;
            }
            $rowspanCount[$row->shift]++;
        }

        $customProdA = config('app.custom_PersenProduktifA');
        $customProdB = config('app.custom_PersenProduktifB');
        $customNonProd = config('app.custom_PersenNonProduktif');
        // Melakukan iterasi untuk setiap baris dan tanggal dalam rentang, serta mengambil data
        foreach ($data['data'] as $row) {
            foreach ($dates as $date) {
                $query1 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '0')
                    ->whereDate('timestamp', $date)
                    ->count();
        
                $query2 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '!=', '0')
                    ->whereDate('timestamp', $date)
                    ->count();
        
                $query3 = $query1 + $query2;
        
                $query4 = $query3 != 0 ? round($query2 / $query3 * 100) : 0;
                $querynon4 = $query3 != 0 ? round($query1 / $query3 * 100) : 0;
        
                if ($query4 >= 50 && $query4 < 76) {
                    $persenA = $customProdA;
                    $persen_countProd = $query4 * ($persenA / 100);
                    $query4 = $query4 + $persen_countProd;
                } elseif ($query4 < 50) {
                    $persenB = $customProdB;
                    $persen_countProd = $query4 * ($persenB / 100);
                    $query4 = $query4 + $persen_countProd;
                }

                $querynon4 = $customNonProd - $query4;

                if ($querynon4 == $customNonProd) {
                    $querynon4 = 0;
                }
                $hour = substr($date, 0, 5);
        
                $queryResults[$row->device_number][$row->shift][$date] = [

                    'hour' => $hour,
                    'query1Total' => $query1,
                    'query2Total' => $query2,
                    'query3Total' => $query3,
                    'query4Total' => $query4,
                ];
            
        

                // Menjumlahkan untuk perhitungan rata-rata
                if (!isset($totalByShiftAndDate[$row->shift][$date])) {
                    $totalByShiftAndDate[$row->shift][$date] = 0;
                    $countByShiftAndDate[$row->shift][$date] = 0;
                }

                $totalByShiftAndDate[$row->shift][$date] += $query4;
                $countByShiftAndDate[$row->shift][$date]++;
            }
        }

        // Menghitung rata-rata
        $averages = [];
        foreach ($totalByShiftAndDate as $shift => $totals) {
            $averageRow = [
                'shift' => $shift,
                'device_number' => 'Rata-Rata'
            ];
            foreach ($totals as $date => $total) {
                $averageRow[$date] = $countByShiftAndDate[$shift][$date] > 0 ? round($total / $countByShiftAndDate[$shift][$date], 2) : '-';
            }
            $averages[$shift] = (object) $averageRow;
        }

        //ke 2
        // Mengambil nilai input dari request
        $startDate2 = $request->input('start_date2', Carbon::today()->toDateString());
        $endDate2 = $request->input('end_date2', Carbon::today()->toDateString());
        $shift2 = $request->input('shift2', "All") ;
        // $device_number2 = $request->input('device_number2', "All") ;
        $actifitas2 = $request->input('actifitas2', "All") ;

        // Validate the dates
        if (!strtotime($startDate2)) {
            $startDate2 = null;
        }

        if (!strtotime($endDate2)) {
            $endDate2 = null;
        }
        if (is_array($shift2)) {
            // Jika "Selected" dipilih, ubah nilainya menjadi "All"
            $shift2= array_diff($shift2, ['Selected']); // Menghilangkan "Selected" dari array
            $shift2 = array_merge($shift2, ['All']); // Menambahkan "All" ke array
        }
        if (is_array($actifitas2)) {
            // Jika "Selected" dipilih, ubah nilainya menjadi "All"
            $actifitas2 = array_diff($actifitas2, ['Selected']); // Menghilangkan "Selected" dari array
            $actifitas2 = array_merge($actifitas2, ['All']); // Menambahkan "All" ke array
        }
        // return $startDate2;
        // Mengatur nilai default jika 'Selected' dipilih
        if ($shift2 === 'Selected') {
            $shift2 = 'All';
        }
        if ($actifitas2 === 'Selected') {
            $actifitas2 = 'All';
        }

        // Menentukan nilai device_number1 berdasarkan actifitas2
        if ($actifitas2 === 'All') {
            $device_number2 = null;
        } else {
            switch ($actifitas2) {
                case 7:
                    $device_number2 = 0;
                    break;
                case 8:
                    $device_number2 = 1;
                    break;
                case 6:
                    $device_number2 = 2;
                    break;
                case 5:
                    $device_number2 = 3;
                    break;
                case 2:
                    $device_number2 = 4;
                    break;
                case 1:
                    $device_number2 = 5;
                    break;
                case 4:
                    $device_number2 = 6;
                    break;
                case 0:
                    $device_number2 = 7;
                    break;
                default:
                    $device_number2 = -1;
                    break;
            }
        }

        // Example of caching in your filter method
        $cacheKey = 'filtered_data_' . md5(serialize([$startDate2, $endDate2, $shift2, $device_number2, $actifitas2]));
        $data2 = cache()->remember($cacheKey, now()->addSeconds(1), function () use ($startDate2, $endDate2, $shift2, $device_number2, $actifitas2) {
            return $this->getData2($startDate2, $endDate2, $shift2, $device_number2, $actifitas2);
        });

        // Menghasilkan rentang tanggal
        $dates2 = $this->generateDateRange2($startDate2, $endDate2);

        // Inisialisasi array untuk menyimpan hasil query yang dikelompokkan berdasarkan device_number, shift, dan tanggal
        $queryResults2 = [];
        $rowspanCount2 = [];
        $totalByShiftAndDate2 = [];
        $countByShiftAndDate2 = [];

        // Menghitung rowspan untuk setiap shift
        foreach ($data2['data'] as $row) {
            if (!isset($rowspanCount2[$row->shift])) {
                $rowspanCount2[$row->shift] = 0;
            }
            $rowspanCount2[$row->shift]++;
        }

        // Melakukan iterasi untuk setiap baris dan tanggal dalam rentang, serta mengambil data
        foreach ($data2['data'] as $row) {
            foreach ($dates2 as $date) {
                $query6 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '0')
                    ->whereDate('timestamp', $date)
                    ->count();

                $query7 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '!=', '0')
                    ->whereDate('timestamp', $date)
                    ->count();

                $query8 = $query6 + $query7;

                $query9 = $query8 != 0 ? round($query7 / $query8 * 100) : 0;

                $queryResults2[$row->device_number][$row->shift][$date] = [
                    'query6Total' => $query6,
                    'query7Total' => $query7,
                    'query8Total' => $query8,
                    'query9Total' => $query9,
                ];

                // Menjumlahkan untuk perhitungan rata-rata
                if (!isset($totalByShiftAndDate2[$row->shift][$date])) {
                    $totalByShiftAndDate2[$row->shift][$date] = 0;
                    $countByShiftAndDate2[$row->shift][$date] = 0;
                }

                $totalByShiftAndDate2[$row->shift][$date] += $query9;
                $countByShiftAndDate2[$row->shift][$date]++;
            }
        }

        // Menghitung rata-rata
        $averages2 = [];
        foreach ($totalByShiftAndDate2 as $shift2 => $totals) {
            $averageRow = [
                'shift2' => $shift2,
                'device_number' => 'Rata-Rata'
            ];
            foreach ($totals as $date => $total) {
                $averageRow[$date] = $countByShiftAndDate2[$shift2][$date] > 0 ? round($total / $countByShiftAndDate2[$shift2][$date], 2) : '-';
            }
            $averages2[$shift2] = (object) $averageRow;
        }

        $detail = ViewReport::whereBetween('timestamp', [$startDate, $endDate])->get();
      

        // return $data;
        // Menyiapkan data untuk dikirimkan ke tampilan
        return view('backend.admin.produktivitas.filterdata', [
            'data' => $data['data'],
            'dates' => $dates,
            'startDate' => $startDate,
            'endDate' => $endDate,
            'shift' => $shift,
            'actifitas' => $actifitas,
            'queryResults' => $queryResults,
            'rowspanCount' => $rowspanCount,
            'averages' => $averages,

            'data2' => $data2['data'],
            'dates2' => $dates2,
            'startDate2' => $startDate2,
            'endDate2' => $endDate2,
            'shift2' => $shift2,
            'actifitas2' => $actifitas2,
            'queryResults2' => $queryResults2,
            'rowspanCount2' => $rowspanCount2,
            'averages2' => $averages2,
            'detail' => $detail

        ]);
    }

    public function filter(Request $request)
    {

        $startDate = $request->input('start_date', Carbon::today()->toDateString());
        $endDate = $request->input('end_date', Carbon::today()->toDateString());
        $shift = $request->input('shift', "All") ;
        // $device_number1 = $request->input('device_number1', "All") ;
        $actifitas = $request->input('actifitas', "All") ;
   
           if (is_array($shift)) {
               // Jika "Selected" dipilih, ubah nilainya menjadi "All"
               $shift = array_diff($shift, ['Selected']); // Menghilangkan "Selected" dari array
               $shift = array_merge($shift, ['All']); // Menambahkan "All" ke array
           }
           if (is_array($actifitas)) {
               // Jika "Selected" dipilih, ubah nilainya menjadi "All"
               $actifitas = array_diff($actifitas, ['Selected']); // Menghilangkan "Selected" dari array
               $actifitas = array_merge($actifitas, ['All']); // Menambahkan "All" ke array
           }
           // Validate and set dates if provided
           if ($startDate) {
               try {
                   $startDate = Carbon::parse($startDate)->format('Y-m-d');
               } catch (\Exception $e) {
                   return response()->json(['error' => 'Invalid start date format'], 400);
               }
           }
           // Mengatur nilai default jika 'Selected' dipilih
           if ($shift === 'Selected') {
               $shift = 'All';
           }
           if ($actifitas === 'Selected') {
               $actifitas = 'All';
           }
   
           // Menentukan nilai device_number1 berdasarkan actifitas
           if ($actifitas === 'All') {
               $device_number1 = null;
           } else {
               switch ($actifitas) {
                   case 7:
                       $device_number1 = 0;
                       break;
                   case 8:
                       $device_number1 = 1;
                       break;
                   case 6:
                       $device_number1 = 2;
                       break;
                   case 5:
                       $device_number1 = 3;
                       break;
                   case 2:
                       $device_number1 = 4;
                       break;
                   case 1:
                       $device_number1 = 5;
                       break;
                   case 4:
                       $device_number1 = 6;
                       break;
                   case 0:
                       $device_number1 = 7;
                       break;
                   default:
                       $device_number1 = -1;
                       break;
               }
           }
   
           // Example of caching in your filter method
           $cacheKey = 'filtered_data_' . md5(serialize([$startDate, $endDate, $shift, $device_number1, $actifitas]));
           $data = cache()->remember($cacheKey, now()->addSeconds(1), function () use ($startDate, $endDate, $shift, $device_number1, $actifitas) {
               return $this->getData($startDate, $endDate, $shift, $device_number1, $actifitas);
           });
   
           // Menghasilkan rentang tanggal
           $dates = $this->generateDateRange($startDate, $endDate);
   
           // Inisialisasi array untuk menyimpan hasil query yang dikelompokkan berdasarkan device_number, shift, dan tanggal
           $queryResults = [];
           $rowspanCount = [];
           $totalByShiftAndDate = [];
           $countByShiftAndDate = [];
   
           // Menghitung rowspan untuk setiap shift
           foreach ($data['data'] as $row) {
               if (!isset($rowspanCount[$row->shift])) {
                   $rowspanCount[$row->shift] = 0;
               }
               $rowspanCount[$row->shift]++;
           }
           $customProdA = config('app.custom_PersenProduktifA');
           $customProdB = config('app.custom_PersenProduktifB');
           $customNonProd = config('app.custom_PersenNonProduktif');
   
           // Melakukan iterasi untuk setiap baris dan tanggal dalam rentang, serta mengambil data
           foreach ($data['data'] as $row) {
            foreach ($dates as $date) {
                $query1 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '0')
                    ->whereDate('timestamp', $date)
                    ->count();
        
                $query2 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '!=', '0')
                    ->whereDate('timestamp', $date)
                    ->count();
        
                $query3 = $query1 + $query2;
        
                $query4 = $query3 != 0 ? round($query2 / $query3 * 100) : 0;
                $querynon4 = $query3 != 0 ? round($query1 / $query3 * 100) : 0;
        
                if ($query4 >= 50 && $query4 < 76) {
                    $persenA = $customProdA;
                    $persen_countProd = $query4 * ($persenA / 100);
                    $query4 = $query4 + $persen_countProd;
                } elseif ($query4 < 50) {
                    $persenB = $customProdB;
                    $persen_countProd = $query4 * ($persenB / 100);
                    $query4 = $query4 + $persen_countProd;
                }

                $querynon4 = $customNonProd - $query4;

                if ($querynon4 == $customNonProd) {
                    $querynon4 = 0;
                }
                $hour = substr($date, 0, 5);
        
                $queryResults[$row->device_number][$row->shift][$date] = [

                    'hour' => $hour,
                    'query1Total' => $query1,
                    'query2Total' => $query2,
                    'query3Total' => $query3,
                    'query4Total' => $query4,
                ];
            
        

                // Menjumlahkan untuk perhitungan rata-rata
                if (!isset($totalByShiftAndDate[$row->shift][$date])) {
                    $totalByShiftAndDate[$row->shift][$date] = 0;
                    $countByShiftAndDate[$row->shift][$date] = 0;
                }

                $totalByShiftAndDate[$row->shift][$date] += $query4;
                $countByShiftAndDate[$row->shift][$date]++;
            }
        }
   
           // Menghitung rata-rata
           $averages = [];
           foreach ($totalByShiftAndDate as $shift => $totals) {
               $averageRow = [
                   'shift' => $shift,
                   'device_number' => 'Rata-Rata'
               ];
               foreach ($totals as $date => $total) {
                   $averageRow[$date] = $countByShiftAndDate[$shift][$date] > 0 ? round($total / $countByShiftAndDate[$shift][$date], 2) : '-';
               }
               $averages[$shift] = (object) $averageRow;
           }


           $startDate2 = $request->input('start_date2', Carbon::today()->toDateString());
           $endDate2 = $request->input('end_date2', Carbon::today()->toDateString());
           $shift2 = $request->input('shift2', "All") ;
           // $device_number2 = $request->input('device_number2', "All") ;
           $actifitas2 = $request->input('actifitas2', "All") ;
   
        if (is_array($shift2)) {
            // Jika "Selected" dipilih, ubah nilainya menjadi "All"
            $shift2 = array_diff($shift2, ['Selected']); // Menghilangkan "Selected" dari array
            $shift2 = array_merge($shift2, ['All']); // Menambahkan "All" ke array
        }
        if (is_array($actifitas2)) {
            // Jika "Selected" dipilih, ubah nilainya menjadi "All"
            $actifitas2 = array_diff($actifitas2, ['Selected']); // Menghilangkan "Selected" dari array
            $actifitas2 = array_merge($actifitas2, ['All']); // Menambahkan "All" ke array
        }
        // return $startDate2;
        // Mengatur nilai default jika 'Selected' dipilih
        if ($shift2 === 'Selected') {
            $shift2 = 'All';
        }
        if ($actifitas2 === 'Selected') {
            $actifitas2 = 'All';
        }

        // Menentukan nilai device_number1 berdasarkan actifitas2
        if ($actifitas2 === 'All') {
            $device_number1 = null;
        } else {
            switch ($actifitas2) {
                case 7:
                    $device_number1 = 0;
                    break;
                case 8:
                    $device_number1 = 1;
                    break;
                case 6:
                    $device_number1 = 2;
                    break;
                case 5:
                    $device_number1 = 3;
                    break;
                case 2:
                    $device_number1 = 4;
                    break;
                case 1:
                    $device_number1 = 5;
                    break;
                case 4:
                    $device_number1 = 6;
                    break;
                case 0:
                    $device_number1 = 7;
                    break;
                default:
                    $device_number1 = -1;
                    break;
            }
        }

        // Example of caching in your filter method
        $cacheKey = 'filtered_data_' . md5(serialize([$startDate2, $endDate2, $shift2, $device_number1, $actifitas2]));
        $data2 = cache()->remember($cacheKey, now()->addSeconds(1), function () use ($startDate2, $endDate2, $shift2, $device_number1, $actifitas2) {
            return $this->getData2($startDate2, $endDate2, $shift2, $device_number1, $actifitas2);
        });

        // Menghasilkan rentang tanggal
        $dates2 = $this->generateDateRange2($startDate2, $endDate2);

        // Inisialisasi array untuk menyimpan hasil query yang dikelompokkan berdasarkan device_number, shift, dan tanggal
        $queryResults2 = [];
        $rowspanCount2 = [];
        $totalByShiftAndDate2 = [];
        $countByShiftAndDate2 = [];

        // Menghitung rowspan untuk setiap shift
        foreach ($data2['data'] as $row) {
            if (!isset($rowspanCount2[$row->shift])) {
                $rowspanCount2[$row->shift] = 0;
            }
            $rowspanCount2[$row->shift]++;
        }

        // Melakukan iterasi untuk setiap baris dan tanggal dalam rentang, serta mengambil data
        foreach ($data2['data'] as $row) {
            foreach ($dates2 as $date) {
                $query6 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '0')
                    ->whereDate('timestamp', $date)
                    ->count();

                $query7 = DB::table('view_report')
                    ->where('device_number', $row->device_number)
                    ->where('shift', $row->shift)
                    ->where('activity_id', '!=', '0')
                    ->whereDate('timestamp', $date)
                    ->count();

                $query8 = $query6 + $query7;

                $query9 = $query8 != 0 ? round($query7 / $query8 * 100) : 0;

                $queryResults2[$row->device_number][$row->shift][$date] = [
                    'query6Total' => $query6,
                    'query7Total' => $query7,
                    'query8Total' => $query8,
                    'query9Total' => $query9,
                ];

                // Menjumlahkan untuk perhitungan rata-rata
                if (!isset($totalByShiftAndDate2[$row->shift][$date])) {
                    $totalByShiftAndDate2[$row->shift][$date] = 0;
                    $countByShiftAndDate2[$row->shift][$date] = 0;
                }

                $totalByShiftAndDate2[$row->shift][$date] += $query9;
                $countByShiftAndDate2[$row->shift][$date]++;
            }
        }

        // Menghitung rata-rata
        $averages2 = [];
        foreach ($totalByShiftAndDate2 as $shift2 => $totals) {
            $averageRow = [
                'shift' => $shift2,
                'device_number' => 'Rata-Rata'
            ];
            foreach ($totals as $date => $total) {
                $averageRow[$date] = $countByShiftAndDate2[$shift2][$date] > 0 ? round($total / $countByShiftAndDate2[$shift2][$date], 2) : '-';
            }
            $averages2[$shift2] = (object) $averageRow;
        }

     
 
        // $snapshots = [];
        //         foreach ($data as $item) {
        //             $snapshot = $item['snapshot'];
        //             $snapshots[] = $snapshot;
        //         }
        // return $data2;
        // Menyiapkan data untuk dikirimkan ke tampilan
        return view('backend.admin.produktivitas.filterdata', [
            'data' => $data['data'],
            'dates' => $dates,
            'startDate' => $startDate,
            'endDate' => $endDate,
            'shift' => $shift,
            'actifitas' => $actifitas,
            'queryResults' => $queryResults,
            'rowspanCount' => $rowspanCount,
            'averages' => $averages,

            'data2' => $data2['data'],
            'dates2' => $dates2,
            'startDate2' => $startDate2,
            'endDate2' => $endDate2,
            'shift2' => $shift2,
            'actifitas2' => $actifitas2,
            'queryResults2' => $queryResults2,
            'rowspanCount2' => $rowspanCount2,
            'averages2' => $averages2,


        ]);
    }

   
    private function getData($startDate, $endDate, $shift = null, $device_number1, $actifitas)
    {
        $dates = $this->generateDateRange($startDate, $endDate);
        $selectStatements = [];
        foreach ($dates as $date) {
            $selectStatements[] = DB::raw("SUM(CASE WHEN tanggal = '$date' THEN 1 ELSE 0 END) AS \"$date\"");
        }

        $query = DB::table(DB::raw('(
            SELECT 
                CASE 
                    WHEN EXTRACT(HOUR FROM event_workers.timestamp) >= 0 AND EXTRACT(HOUR FROM event_workers.timestamp) < 8 THEN \'Shift 1\'
                    WHEN EXTRACT(HOUR FROM event_workers.timestamp) >= 8 AND EXTRACT(HOUR FROM event_workers.timestamp) < 16 THEN \'Shift 2\'
                    ELSE \'Shift 3\'
                END AS shift,
                event_scenes.device_number,
                DATE(event_workers.timestamp) AS tanggal
            FROM 
                event_scenes
            JOIN 
                event_workers ON event_scenes.id = event_workers.event_scene_id
            WHERE 
                DATE(event_workers.timestamp) BETWEEN \'' . $startDate . '\' AND \'' . $endDate . '\'
        ) AS subquery'))
            ->select(
                array_merge(
                    [
                        'shift',
                        'device_number'
                    ],
                    $selectStatements
                )
            )
            ->groupBy('shift', 'device_number')
            ->orderBy('shift')
            ->orderBy('device_number');

        if ($shift && $shift !== 'All') {
            $query->having('shift', $shift);
        }
        if ($device_number1 !== null && $device_number1 !== '') {
            $query->having('device_number', $device_number1);
        }
        $data = $query->get();
        $data = collect($data);
    
        $formattedData = [];
        $shift2Totals = ['Shift 1' => [], 'Shift 2' => [], 'Shift 3' => []];
        $shift2Counts = ['Shift 1' => 0, 'Shift 2' => 0, 'Shift 3' => 0];
        $query->chunk(100, function ($data) use (&$formattedData, &$shift2Totals, &$shift2Counts, $dates) {
            foreach ($data as $row) {
                $formattedRow = [
                    'shift' => $row->shift,
                    'device_number' => $row->device_number
                ];
                foreach ($dates as $date) {
                    $formattedRow[$date] = $row->{$date};
                    if (!isset($shift2Totals[$row->shift][$date])) {
                        $shift2Totals[$row->shift][$date] = 0;
                    }
                    $shift2Totals[$row->shift][$date] += $row->{$date};
                }
                $shift2Counts[$row->shift]++;
                $formattedData[] = (object) $formattedRow;
            }
        });
    
        $averages = [];
        foreach ($shift2Totals as $shift2 => $totals) {
            $averageRow = [
                'shift' => $shift2,
                'device_number' => 'Rata-Rata'
            ];
            foreach ($totals as $date => $total) {
                $averageRow[$date] = $shift2Counts[$shift2] > 0 ? round($total / $shift2Counts[$shift2], 2) : '-';
            }
            $averages[$shift2] = (object) $averageRow;
        }
    
        $snapshotData = DB::table('event_workers')
            ->select('snapshot')
            ->where('timestamp', '>=', $startDate)
            ->where('timestamp', '<=', $endDate)
            ->get();
    
        $formattedSnapshot = [];
        foreach ($snapshotData as $snapshot) {
            $formattedSnapshot[] = [
                'snapshot' => $snapshot->snapshot,
            ];
        }
    
        // Menggabungkan data formattedData dan snapshot ke dalam satu array data
        $combinedData = [];
        foreach ($formattedData as $formattedRow) {
            $combinedRow = [
                'shift' => $formattedRow->shift,
                'device_number' => $formattedRow->device_number,
                // Sisipkan data snapshot ke dalam setiap baris data sesuai kebutuhan
                'snapshot' => isset($formattedSnapshot[$formattedRow->device_number]) ? $formattedSnapshot[$formattedRow->device_number]['snapshot'] : '',
            ];
    
            foreach ($dates as $date) {
                $combinedRow[$date] = $formattedRow->{$date};
            }
    
            $combinedData[] = (object) $combinedRow;
        }
    
        return [
            'data' => collect($combinedData),
            'averages' => $averages,
        ];
    }
    private function generateDateRange($start_date, $end_date)
    {
        $dates = [];
        $currentDate = Carbon::parse($start_date);
        $endDate2 = Carbon::parse($end_date);

        while ($currentDate->lte($endDate2)) {
            $dates[] = $currentDate->toDateString();
            $currentDate->addDay();
        }

        return $dates;
    }

    private function getData2($startDate2, $endDate2, $shift = null, $device_number2, $actifitas2)
    {
        $dates2 = $this->generateDateRange($startDate2, $endDate2);
        $selectStatements = [];
        foreach ($dates2 as $date) {
            $selectStatements[] = DB::raw("SUM(CASE WHEN tanggal = '$date' THEN 1 ELSE 0 END) AS \"$date\"");
        }

        $query = DB::table(DB::raw('(
            SELECT 
                CASE 
                    WHEN EXTRACT(HOUR FROM event_workers.timestamp) >= 0 AND EXTRACT(HOUR FROM event_workers.timestamp) < 8 THEN \'Shift 1\'
                    WHEN EXTRACT(HOUR FROM event_workers.timestamp) >= 8 AND EXTRACT(HOUR FROM event_workers.timestamp) < 16 THEN \'Shift 2\'
                    ELSE \'Shift 3\'
                END AS shift,
                event_scenes.device_number,
                DATE(event_workers.timestamp) AS tanggal
            FROM 
                event_scenes
            JOIN 
                event_workers ON event_scenes.id = event_workers.event_scene_id
            WHERE 
                DATE(event_workers.timestamp) BETWEEN \'' . $startDate2 . '\' AND \'' . $endDate2 . '\'
        ) AS subquery'))
            ->select(
                array_merge(
                    [
                        'shift',
                        'device_number'
                    ],
                    $selectStatements
                )
            )
            ->groupBy('shift', 'device_number')
            ->orderBy('shift')
            ->orderBy('device_number');

        if ($shift && $shift !== 'All') {
            $query->having('shift', $shift);
        }
        if ($device_number2 !== null && $device_number2 !== '') {
            $query->having('device_number', $device_number2);
        }
        $data2 = $query->get();
        $data2 = collect($data2);
    
        $formattedData = [];
        $shift2Totals = ['Shift 1' => [], 'Shift 2' => [], 'Shift 3' => []];
        $shift2Counts = ['Shift 1' => 0, 'Shift 2' => 0, 'Shift 3' => 0];
        $query->chunk(100, function ($data2) use (&$formattedData, &$shift2Totals, &$shift2Counts, $dates2) {
            foreach ($data2 as $row) {
                $formattedRow = [
                    'shift' => $row->shift,
                    'device_number' => $row->device_number
                ];
                foreach ($dates2 as $date) {
                    $formattedRow[$date] = $row->{$date};
                    if (!isset($shift2Totals[$row->shift][$date])) {
                        $shift2Totals[$row->shift][$date] = 0;
                    }
                    $shift2Totals[$row->shift][$date] += $row->{$date};
                }
                $shift2Counts[$row->shift]++;
                $formattedData[] = (object) $formattedRow;
            }
        });
    
        $averages2 = [];
        foreach ($shift2Totals as $shift2 => $totals) {
            $averageRow = [
                'shift' => $shift2,
                'device_number' => 'Rata-Rata'
            ];
            foreach ($totals as $date => $total) {
                $averageRow[$date] = $shift2Counts[$shift2] > 0 ? round($total / $shift2Counts[$shift2], 2) : '-';
            }
            $averages2[$shift2] = (object) $averageRow;
        }
    
        $snapshotData = DB::table('event_workers')
            ->select('snapshot')
            ->where('timestamp', '>=', $startDate2)
            ->where('timestamp', '<=', $endDate2)
            ->get();
    
        $formattedSnapshot = [];
        foreach ($snapshotData as $snapshot) {
            $formattedSnapshot[] = [
                'snapshot' => $snapshot->snapshot,
            ];
        }
    
        // Menggabungkan data formattedData dan snapshot ke dalam satu array data
        $combinedData = [];
        foreach ($formattedData as $formattedRow) {
            $combinedRow = [
                'shift' => $formattedRow->shift,
                'device_number' => $formattedRow->device_number,
                // Sisipkan data snapshot ke dalam setiap baris data sesuai kebutuhan
                'snapshot' => isset($formattedSnapshot[$formattedRow->device_number]) ? $formattedSnapshot[$formattedRow->device_number]['snapshot'] : '',
            ];
    
            foreach ($dates2 as $date) {
                $combinedRow[$date] = $formattedRow->{$date};
            }
    
            $combinedData[] = (object) $combinedRow;
        }
    
        return [
            'data' => collect($combinedData),
            'averages' => $averages2,
        ];
    }



    private function generateDateRange2($start_date, $end_date)
    {
        $dates2 = [];
        $currentDate = Carbon::parse($start_date);
        $endDate2 = Carbon::parse($end_date);
        // Memeriksa apakah rentang tanggal mencakup hari ini
        if ($currentDate->isSameDay(Carbon::today())) {
            $currentDate->addDay(); // Melewatkan hari ini jika rentang dimulai dari hari ini
        }

        while ($currentDate->lte($endDate2)) {
            $dates2[] = $currentDate->toDateString();
            $currentDate->addDay();
        }

        return $dates2;
    }



}
