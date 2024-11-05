<?php
use App\Http\Controllers\Backend\Admin\EventworkersController;

Route::apiResource('blogs', 'BlogApiController');

// Route baru untuk menampilkan data event workers
Route::get('event-workers', [EventworkersController::class, 'showEventWorkers']);

// Only Admin Access

Route::group(['middleware' => ['auth:admin_api']], function () {
    Route::get('users', 'UserApiController@index');
});
