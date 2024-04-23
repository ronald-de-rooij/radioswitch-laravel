<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\AuthenticateWithGoogle;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\StreamController;
use App\Http\Controllers\Auth\GoogleSocialiteController;

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
Route::get('/streams', [StreamController::class, 'index']);

/**
 * SOCIALITE ROUTES
 */
Route::get('/auth/google', [GoogleSocialiteController::class, 'redirectToGoogle']);
Route::get('/callback/google', [GoogleSocialiteController::class, 'handleCallback']);

/**
 * PROTECTED ROUTES
 */

//  Route::get('/user', function (Request $request) {
//     Log::debug('Request data:', $request->all());
//     return $request->user();
// });
Route::get('/user', [UserController::class, 'user'])->name('user');

// TODO Authenticate the following routes
Route::middleware([AuthenticateWithGoogle::class])->get('/streams/{stream}', [StreamController::class, 'show']);
// Route::get('/streams/{stream}', [StreamController::class, 'show']);

// Streams
Route::post('/streams', [StreamController::class, 'store']);
Route::put('/streams/{stream}', [StreamController::class, 'update']);
Route::delete('/streams/{stream}', [StreamController::class, 'destroy']);
