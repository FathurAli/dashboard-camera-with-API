<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;
use App\Models\Proyek;
use App\Models\Perusahaan;
use App\Models\Client;
use App\Models\Quotation;
use View;
use DB;


class ProyekController extends Controller
{
   /**
    * Display a listing of the resource.
    * @return \Illuminate\Http\Response
    */
   public function index(Request $request)
   {
      return view('backend.admin.proyek.index');
   }

   public function getAll(Request $request)
   {
      if ($request->ajax()) {
         $can_edit = $can_delete = '';
         if (!auth()->user()->can('proyek-edit')) {
            $can_edit = "style='display:none;'";
         }
         if (!auth()->user()->can('proyek-delete')) {
            $can_delete = "style='display:none;'";
         }

         $proyek = Proyek::join('perusahaans', 'perusahaans.id', '=', 'proyeks.perusahaan')
         ->get(['proyeks.nama_pekerjaan', 'perusahaans.nama', 'proyeks.no_spk', 'proyeks.status', 'proyeks.id']);
         return Datatables::of($proyek)
           ->addColumn('file_path', function ($proyek) {
              return "<img src='" . asset($proyek->file_path) . "' width='60px'>";
           })
           ->addColumn('title', function ($proyek) {
              return Str::words($proyek->title, 10, '...');
           })
           ->addColumn('status', function ($proyek) {
              return $proyek->status ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>';
           })
           ->addColumn('action', function ($proyek) use ($can_edit, $can_delete) {
              $html = '<div class="btn-group">';
              $html .= '<a data-toggle="tooltip" ' . $can_edit . '  id="' . $proyek->id . '" class="btn btn-xs btn-info mr-1 edit" title="Edit"><i class="fa fa-edit"></i> </a>';
              $html .= '<a data-toggle="tooltip" ' . $can_delete . ' id="' . $proyek->id . '" class="btn btn-xs btn-danger delete" title="Delete"><i class="fa fa-trash"></i> </a>';
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
            $data = Perusahaan::all();
            $dataClient = Client::all();
            $dataQuotation = Quotation::all();
            $view = View::make('backend.admin.proyek.create', compact('data','dataClient','dataQuotation'))->render();
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
         $haspermision = auth()->user()->can('proyek-create');
         if ($haspermision) {

                  $delete_rp = str_replace("Rp","", $request->input('nilai_kontrak') ); $request->input('title');
                  $delete_dot = str_replace(".","", $delete_rp);
                  $delete_space = str_replace(" ","", $delete_dot);

                  $proyek = new Proyek;
                  $proyek->perusahaan = $request->input('perusahaan');
                  $proyek->jenis_kontrak = $request->input('jenis_kontrak');
                  $proyek->client_id = $request->input('client_id');
                  $proyek->nama_pekerjaan = $request->input('nama_pekerjaan');
                  $proyek->no_spk = $request->input('no_spk');
                  $proyek->tgl_spk = $request->input('tgl_spk');
                  $proyek->tgl_awal = $request->input('tgl_awal');
                  $proyek->tgl_akhir = $request->input('tgl_akhir');
                  $proyek->nilai_kontrak = $delete_space;
                  $proyek->tgl_bast = $request->input('tgl_bast');
                  $proyek->no_bast = $request->input('no_bast');
                  $proyek->keterangan = $request->input('keterangan');
                  $proyek->status_proyek = $request->input('status_proyek');
                  $proyek->metode_pembayaran = $request->input('metode_pembayaran');
                  $proyek->id_quotation = $request->input('id_quotation');
                  $proyek->uploaded_by = auth()->user()->id;
                  $proyek->save(); //
                  return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
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
    * @param  \App\Models\Proyek $proyek
    *
    * @return \Illuminate\Http\Response
    */
   public function show(Request $request, Proyek $proyek)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-view');
         if ($haspermision) {
           
            $view = View::make('backend.admin.proyek.view', compact('proyek'))->render();
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
    * @param  \App\Models\Proyek $proyek
    *
    * @return \Illuminate\Http\Response
    */
   public function edit(Request $request, Proyek $proyek)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-edit');
         if ($haspermision) {
            $dataClient = Client::all();
            $data = Perusahaan::all();
            $dataQuotation = Quotation::all();
            $view = View::make('backend.admin.proyek.edit', compact('proyek','data','dataClient','dataQuotation'))->render();
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
    * @param  \App\Models\Proyek $proyek
    *
    * @return \Illuminate\Http\Response
    */
   public function update(Request $request, Proyek $proyek)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('proyek-edit');
         if ($haspermision) {

            $delete_rp = str_replace("Rp","", $request->input('nilai_kontrak') ); $request->input('title');
            $delete_dot = str_replace(".","", $delete_rp);
            $delete_space = str_replace(" ","", $delete_dot);

            $proyek->perusahaan = $request->input('perusahaan');
            $proyek->jenis_kontrak = $request->input('jenis_kontrak');
            $proyek->client_id = $request->input('client_id');
            $proyek->nama_pekerjaan = $request->input('nama_pekerjaan');
            $proyek->no_spk = $request->input('no_spk');
            $proyek->tgl_spk = $request->input('tgl_spk');
            $proyek->tgl_awal = $request->input('tgl_awal');
            $proyek->tgl_akhir = $request->input('tgl_akhir');
            $proyek->nilai_kontrak = $delete_space;
            $proyek->tgl_bast = $request->input('tgl_bast');
            $proyek->no_bast = $request->input('no_bast');
            $proyek->keterangan = $request->input('keterangan');
            $proyek->status_proyek = $request->input('status_proyek');
            $proyek->metode_pembayaran = $request->input('metode_pembayaran');
            $proyek->id_quotation = $request->input('id_quotation');
            $proyek->uploaded_by = auth()->user()->id;
            $proyek->save(); //
            return response()->json(['type' => 'success', 'message' => "Successfully Created"]);
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
    * @param  \App\Models\Proyek $proyek
    *
    * @return \Illuminate\Http\Response
    */
   public function destroy(Request $request, Proyek $proyek)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('notice-delete');
         if ($haspermision) {
            $proyek->delete();
            return response()->json(['type' => 'success', 'message' => 'Successfully Deleted']);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

}
