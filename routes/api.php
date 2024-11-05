<?php

use App\Http\Controllers\Backend\Admin\NoteController;
use App\Http\Controllers\Backend\Admin\WorkerController;
use App\Http\Controllers\Backend\Admin\AdminController;
use Illuminate\Support\Facades\Route;

// Public API all frontend without authentication
Route::group([
    'prefix' => 'v1',
    'as' => 'public.',
    'namespace' => 'Api\Frontend'
], function () {
    require base_path('routes/api/public.php');
});

// Admin API
Route::group([
    'prefix' => 'v1',
    'as' => 'api.',
    'namespace' => 'Api\Backend',
], function () {
    require base_path('routes/api/admin.php');
});

Route::post('/login', [AdminController::class, 'login']);
Route::post('/register', 'Api\Auth\AuthController@register');

// API access with token
Route::group([
    'prefix' => 'v1',
    'as' => 'api.',
    'middleware' => 'auth:api', // Membatasi akses dengan token
], function () {
    Route::get('details', 'Api\Backend\UserApiController@details');

    //Logout
    Route::post('/admin/logout', [AdminController::class, 'logout']);

    // Notes
    Route::get('/notes', [NoteController::class, 'notes']);
    Route::delete('/notes/{id}', [NoteController::class, 'destroy']);
    Route::put('/notes/{id}', [NoteController::class, 'update']);
    Route::patch('/notes/{id}', [NoteController::class, 'update']);

    // Workers
    Route::get('/workers', [WorkerController::class, 'workers']);
    Route::put('/workers/{id}', [WorkerController::class, 'update']);
    Route::post('/workers', [WorkerController::class, 'store']);
    Route::delete('/workers/{id}', [WorkerController::class, 'destroy']);
});

// Admin login
Route::post('/admin/login', [AdminController::class, 'login']);
