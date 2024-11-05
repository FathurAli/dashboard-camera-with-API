<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use App\Models\Note;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class NoteController extends Controller
{
    // Menampilkan daftar catatan
    public function index(Request $request)
    {
        // Jika request berasal dari API (misalnya dari frontend JS)
        return view('backend.admin.note.index');

    }

    public function notes(Request $request)
    {
        // Ambil semua data dari tabel note
        $query = Note::query();

        if($request->has('title')){
            $query->where('title','like','%'.$request->title.'%');
        }
        
        if ($request->has('from_date') && $request->has('to_date')) {
            // Menggunakan whereBetween untuk filter rentang tanggal
            $query->whereBetween('created_at', [$request->from_date . ' 00:00:00', $request->to_date . ' 23:59:59']);
        }
    
        if ($request->has('created_at')) {
            $query->whereDate('created_at', $request->created_at);
        }
        $notes = $query->get();
        // Kembalikan data dalam format JSON
        return response()->json($notes);
    }

    // Menampilkan form untuk membuat catatan baru
    public function create()
    {
        return view('backend.admin.note.create');
    }

    // Menyimpan catatan baru ke database
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        Note::create([
            'title' => $request->title,
            'content' => $request->content,
        ]);

        if ($request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'Note created successfully.',
                'note' => [
                    'title' => $request->title,
                    'content' => $request->content,
                ]
            ]);
        }

        return redirect()->route('note.index')->with('success', 'Note created successfully.');
    }

    // Mengambil semua catatan untuk DataTables
    public function getAllNotes()
    {
        $notes = Note::select(['id', 'title', 'content']);

        return DataTables::of($notes)
            ->addColumn('action', function($note) {
                return '
                    <a href="'.route('note.edit', $note->id).'" class="btn btn-sm btn-warning"><i class="fa fa-edit"></i></a>
                    <button class="btn btn-danger btn-sm" onclick="deleteNote('.$note->id.')"><i class="fa fa-trash"></i></button>
                ';
            })
            ->rawColumns(['content', 'action'])
            ->make(true);
    }

    // Menampilkan form untuk mengedit catatan
    public function edit($id)
    {
        $note = Note::findOrFail($id);
        return view('backend.admin.note.edit', compact('note'));
    }

    // Mengupdate catatan
    public function update(Request $request, $id)
    {
        //Api
        $notes=Note::find($id);
        if (!$notes){
            return response()->json(['message' => 'Note tidak ditemukan'], 404);
        }
        // Validasi Api
        $validator = Validator::make($request->all(),[
            'title' => 'required|string|max:225',
        ]);

        if ($validator->fails()){
            return response()->json($validator -> errors(), 422);
        }

        $notes->title = $request->title;

        $notes->save();


        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        $note = Note::findOrFail($id);
        $note->update([
            'title' => $request->title,
            'content' => $request->content,
        ]);

        return redirect()->route('note.index')->with('success', 'Note updated successfully.');
        return response()->json([
            'massage' => 'Note berhasil diupdate',
            'note' => $notes
        ], 200);
    }

    // Menghapus catatan
    public function destroy($id)
    {
        $note = Note::find($id);

        if (!$note) {
            return response()->json([
                'success' => false,
                'message' => 'Note not found.',
            ], 404);
        }

        $note->delete();

        return response()->json([
            'success' => true,
            'message' => 'Note deleted successfully.',
        ], 200);
    }

    // Mengupload gambar
    public function upload(Request $request)
    {
        $request->validate([
            'upload' => 'required|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        if ($request->file('upload')) {
            $file = $request->file('upload');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('upload/image'), $filename);

            return response()->json([
                'url' => asset('upload/image/' . $filename)
            ]);
        }

        return response()->json(['error' => 'Image upload failed.']);
    }
}
