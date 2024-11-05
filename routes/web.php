<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\Admin\WorkerController;
use App\Http\Controllers\Backend\Admin\NoteController;
use App\Http\Controllers\Backend\Admin\AdminController;
use App\Http\Controllers\Backend\Admin\UserController;
// Route::group([
//     'namespace' => 'Frontend',
//     'as' => 'frontend.'],
//     function () {
//         require base_path('routes/frontend/frontend.php');
//     });
Route::get('/', function () {
    return view('auth.admin.login');
})->name('login');

// Bakcend


// Admin Auth
Route::prefix('login')->group(function () {
    Route::get('/', 'Auth\Admin\LoginController@login')->name('admin.auth.login');
    Route::post('login', 'Auth\Admin\LoginController@loginAdmin')->name('admin.auth.loginAdmin');
    Route::post('logout', 'Auth\Admin\LoginController@logout')->name('admin.auth.logout');
    Route::get('logout', 'Auth\Admin\LoginController@logout');

    // -------------------------------Notes---------------------------------
    // Tambahkan rute untuk edit dan destroy jika belum ada
    // Route::get('/note/{id}/edit', [NoteController::class, 'edit'])->name('backend.admin.note.edit');
    // Route::delete('/note/{id}', [NoteController::class, 'destroy'])->name('backend.admin.note.destroy');
});

Route::prefix('note')->name('note.')->group(function () {
    Route::get('/', [NoteController::class, 'index'])->name('index');
    Route::get('/create', [NoteController::class, 'create'])->name('create');
    Route::post('/store', [NoteController::class, 'store'])->name('store');
    Route::get('/all', [NoteController::class, 'getAllNotes'])->name('all');
    Route::post('/upload/image', [NoteController::class, 'upload'])->name('upload.image');
    Route::get('/{id}/edit', [NoteController::class, 'edit'])->name('edit');
    Route::put('/{id}', [NoteController::class, 'update'])->name('update');
    Route::delete('/{id}', [NoteController::class, 'destroy'])->name('destroy');
});
// workers
Route::prefix('admin')->name('worker.')->group(function () {
    Route::get('/workers', [WorkerController::class, 'index'])->name('index');
    Route::get('/allworkers', [WorkerController::class, 'getAll'])->name('data');
    Route::get('/workers/create', [WorkerController::class, 'create'])->name('create');
    Route::post('/workers/store', [WorkerController::class, 'store'])->name('store');
    Route::get('/workers/{id}/edit', [WorkerController::class, 'edit'])->name('edit');
    Route::post('/workers/{worker}/update', [WorkerController::class, 'update'])->name('update');
    Route::delete('worker/{id}', [WorkerController::class, 'destroy'])->name('destroy');
    Route::get('/workers/{id}/cetakpdf', [WorkerController::class, 'cetakpdf'])->name('cetakpdf');
    Route::get('/export/pdf', [WorkerController::class, 'exportPdf'])->name('export.pdf');
    Route::get('/workers/export-excel', [WorkerController::class, 'exportExcel'])->name('exportExcel');
    Route::get('/workers/import', [WorkerController::class, 'import'])->name('import');
    Route::post('/workers/import-proses', [WorkerController::class, 'import_proses'])->name('import_proses');
});

//admin
Route::post('/admin/login', [AdminController::class, 'login'])->name('admin.login');
Route::post('/user/login', [UserController::class, 'login'])->name('user.login');



// Admin Dashborad
Route::group(
    [
        'namespace' => 'Backend\Admin',
        'prefix' => 'admin',
        'as' => 'admin.',
        'middleware' => 'auth:admin'
    ],
    function () {
        require base_path('routes/backend/admin.php');
    }
);

// User Auth
Route::prefix('user_login')->group(function () {
    Route::get('login', 'Auth\User\LoginController@login')->name('user.auth.login');
    Route::post('login', 'Auth\User\LoginController@loginUser')->name('user.auth.loginUser');
    Route::post('logout', 'Auth\User\LoginController@logout')->name('user.auth.logout');
    Route::get('logout', 'Auth\User\LoginController@logout');
});

// User Dashborad
Route::group(
    [
        'namespace' => 'Backend\User',
        'prefix' => 'user',
        'as' => 'user.',
        'middleware' => 'auth:user'
    ],
    function () {
        require base_path('routes/backend/user.php');
    }
);

// clear config and cache
//['cache:clear', 'optimize', 'route:cache', 'route:clear', 'view:clear', 'config:cache']

//    /artisan/cache-clear  // replace (:) to (-)
//Route::get('/artisan/{cmd}', function($cmd) {
//   $cmd = trim(str_replace("-",":", $cmd));
//   $validCommands = ['cache:clear', 'optimize', 'route:cache', 'route:clear', 'view:clear', 'config:cache'];
//   if (in_array($cmd, $validCommands)) {
//      Artisan::call($cmd);
//      return "<h1>Ran Artisan command: {$cmd}</h1>";
//   } else {
//      return "<h1>Not valid Artisan command</h1>";
//   }
//});

Route::get('/download/template', function () {
    // Path ke file template.xlsx
    $filePath = storage_path('app/public/template.xlsx');

    // Pastikan file ada
    if (!Storage::exists('public/template.xlsx')) {
        abort(404);
    }

    // Unduh file dengan nama asli
    return Response::download($filePath);
});
