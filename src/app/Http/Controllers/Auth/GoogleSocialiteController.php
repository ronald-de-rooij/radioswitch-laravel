<?php

namespace App\Http\Controllers\Auth;

use Exception;
use App\Models\User;
use Ramsey\Uuid\Uuid;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class GoogleSocialiteController extends Controller
{
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->stateless()->redirect();
    }

    public function handleCallback()
    {
        try {
            // get user data from Google
            $user = Socialite::driver('google')->stateless()->user();

            // find user in the database where the social id is the same with the id provided by Google
            $findUser = User::where('social_id', $user->id)->first();

            if ($findUser)  // if user found then do this
            {
                return response()->json([
                    'name' => $findUser->name,
                    'email' => $findUser->email,
                    'auth_token' => $user->token
                ]);
            } else {
                // if user not found then this is the first time he/she try to login with Google account
                // create user data with their Google account data
                $newUser = User::updateOrCreate(
                    [
                        'id' => Uuid::uuid4()->toString(),
                    ],
                    [
                        'name' => $user->name,
                        'email' => $user->email,
                        'social_id' => $user->id,
                        'social_type' => 'google',
                        'password' => bcrypt('password')
                    ]
                );

                Auth::login($newUser);

                return redirect('/dashboard');
            }
        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }
}
