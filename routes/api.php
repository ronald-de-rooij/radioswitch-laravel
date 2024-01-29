<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\StreamController;
use App\Http\Controllers\Api\ApiAuthController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/** 
 * PUBLIC ROUTES
 */
Route::post('/session/login', [ApiAuthController::class, 'login'])->name('login');
Route::get('/streams', [StreamController::class, 'index']);

/**
 * PROTECTED ROUTES
 */
Route::middleware('auth:api')->group(function () {
    // Session
    Route::post('/session/logout', [ApiAuthController::class, 'logout'])->name('logout');
    Route::get('/user', [UserController::class, 'user'])->name('user');

    // Streams
    Route::post('/streams', [StreamController::class, 'store']);
    Route::get('/streams/{stream}', [StreamController::class, 'show']);
    Route::put('/streams/{stream}', [StreamController::class, 'update']);
    Route::delete('/streams/{stream}', [StreamController::class, 'destroy']);

});


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

/**
 * Authentication routes
 */
