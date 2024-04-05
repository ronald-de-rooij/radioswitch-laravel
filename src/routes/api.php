<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\AuthenticateWithGoogle;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\StreamController;
use App\Http\Controllers\Api\ApiAuthController;
use App\Http\Controllers\Auth\GoogleSocialiteController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

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
Route::post('/session/register', [ApiAuthController::class, 'register'])->name('register');
Route::get('/streams', [StreamController::class, 'index']);

/**
 * SOCIALITE ROUTES
 */
Route::get('/auth/google', [GoogleSocialiteController::class, 'redirectToGoogle']);
Route::get('/callback/google', [GoogleSocialiteController::class, 'handleCallback']);

// Route::get('/auth/redirect', function () {
//     return Socialite::driver('google')->redirect();
// });

// Route::get('/auth/callback', function () {
//     $googleUser = Socialite::driver('google')->user();

//     $user = User::updateOrCreate(
//         [
//             'google_id' => $googleUser->id
//         ],
//         [
//             'name' => $googleUser->name,
//             'email' => $googleUser->email,
//             'social_id' => $googleUser->id,
//             'social_type' => 'google',
//             'password' => bcrypt('password')
//         ]
//     );

//     Auth::login($user);

//     return $user;
// });

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

// Session
// Route::get('/streams/{stream}', [StreamController::class, 'show']);
Route::post('/session/logout', [ApiAuthController::class, 'logout'])->name('logout');

// Streams
Route::post('/streams', [StreamController::class, 'store']);
Route::put('/streams/{stream}', [StreamController::class, 'update']);
Route::delete('/streams/{stream}', [StreamController::class, 'destroy']);


// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
