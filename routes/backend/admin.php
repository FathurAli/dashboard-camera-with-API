<?php

// Route untuk menampilkan halaman dashboard
Route::get('/dashboard', 'DashboardController@index')->name('dashboard');
Route::get('/dashboardlajur/{id_titiklajur}', 'DashboardController@dashboardlajur')->name('dashboardlajur');
Route::get('/admin/filterdashboardlajur', 'DashboardController@filterdashboardlajur')->name('filterdashboardlajur');
// Route untuk menampilkan halaman laporan
Route::get('/report', 'ReportController@index')->name('report');
// Route untuk mendapatkan data laporan
Route::post('/allreport','ReportController@index')->name('getPekerjaanData');

// Route untuk menampilkan halaman laporan 1
Route::get('/report1', 'ReportController@index1')->name('report1');
// Route untuk mendapatkan data grafik untuk laporan 1
Route::post('/chart/data','ReportController@index1')->name('getChartData');

// Route untuk menampilkan halaman laporan 2
Route::get('/report2', 'ReportController@index2')->name('report2');
// Route untuk mendapatkan data grafik untuk laporan 2
Route::post('/chart/data','ReportController@index2')->name('getChartData');

// Route untuk CRUD log aktivitas
Route::resource('/logActivity', 'LogActivityController');
// Route untuk menampilkan semua log aktivitas
Route::get('/alllogActivity', 'LogActivityController@getAll')->name('alllogActivity');

// Route untuk CRUD data pengguna
Route::resource('/worker', 'WorkerController');
// Route untuk menampilkan semua data pengguna
Route::get('/allworkers', 'WorkerController@getAll')->name('allworkers');
// Route untuk mencetak PDF data pengguna tertentu
Route::get('worker/{id}/cetakpdf', 'WorkerController@cetakpdf')->name('backend.admin.worker.worker_pdf');
// Route untuk mencetak PDF semua data pengguna
Route::get('worker/cetakpdfall', 'WorkerController@cetakpdfall')->name('backend.admin.worker.worker_pdfall');
Route::get('/worker/import', 'WorkerController@import')->name('backend.admin.worker.import');
Route::get('admin/worker/data', 'WorkerController@data')->name('backend.admin.worker.data');
Route::post('admin/worker/import-proses', 'WorkerController@import_proses')->name('import-proses');

// Route untuk CRUD permission
Route::resource('permissions', 'PermissionController');
// Route untuk menampilkan semua permission
Route::get('/allPermissions', 'PermissionController@getAll')->name('allPermissions');

// Route untuk CRUD roles
Route::resource('roles', 'RoleController');
// Route untuk menampilkan semua roles
Route::get('/allRoles', 'RoleController@getAll')->name('allRoles');

// Route untuk CRUD roles
Route::resource('note', 'NoteController');
// Route untuk menampilkan semua roles
Route::get('/allNotes', 'NoteController@getAll')->name('allNotes');

// Route untuk CRUD setting pencetakan
Route::resource('printsetting', 'PrintSettingController');
// Route untuk menampilkan semua setting pencetakan
Route::get('/allPrintSetting', 'PrintSettingController@getAll')->name('allPrintSetting');
// Route untuk mencetak PDF setting pencetakan
Route::get('printsetting/{id}/cetakpdf', 'PrintSettingController@cetakpdf')->name('backend.admin.printseting.printsetting_pdf');

// Route untuk melakukan backup
Route::get('backups', 'BackupController@index');
// Route untuk menampilkan semua backup
Route::get('allBackups', 'BackupController@getAll')->name('allBackups');
// Route untuk membuat backup database
Route::post('backups/db_backup', 'BackupController@db_backup');
// Route untuk membuat backup lengkap
Route::post('backups/full_backup', 'BackupController@full_backup');
// Route untuk mendownload backup
Route::get('backups/download/{file_name}', 'BackupController@download');
// Route untuk menghapus backup
Route::delete('backups/delete/{file_name}', 'BackupController@delete');

// Route untuk CRUD setting
Route::resource('settings', 'SettingsController');
// Route untuk menampilkan semua setting
Route::get('/allSettings', 'SettingsController@getAll')->name('allSettings');

// Route untuk CRUD activity
Route::resource('eventworkers', 'EventworkersController');
// Route untuk menampilkan semua setting
Route::get('/allEventworkers', 'EventworkersController@getAll')->name('allEventworkers');

use App\Http\Controllers\Backend\Admin\ProduktivitasController;

Route::get('/produktivitas', [ProduktivitasController::class, 'index'])->name('produktivitas');
Route::post('/filterdata', [ProduktivitasController::class, 'filter'])->name('filterdata');

use App\Http\Controllers\Backend\Admin\WorkerController;
// Route untuk export excel
Route::get('admin/worker/excel', [WorkerController::class, 'exportExcel'])->name('worker.excel');

// Route untuk
Route::resource('/notes', 'NoteController');
// Route untuk notes
Route::get('/allnotes', 'NoteController@getAll')->name('allnotes');





