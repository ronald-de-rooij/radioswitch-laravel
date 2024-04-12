<?php

namespace App\Http\Controllers\Auth;

use Exception;
use App\Models\User;
use Ramsey\Uuid\Uuid;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
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
            $authenticatedUser = Socialite::driver('google')->stateless()->user();
            // find user in the database where the social id is the same with the id provided by Google
            $findUser = User::where('social_id', $authenticatedUser->id)->first();

            if ($findUser)  // if user found then do this
            {
                return $this->formatUserResourceWithToken($findUser, $authenticatedUser);
            } else {
                // if user not found then this is the first time he/she try to login with Google account
                // create user data with their Google account data
                $newUser = User::updateOrCreate(
                    [
                        'id' => Uuid::uuid4()->toString(),
                    ],
                    [
                        'name' => $authenticatedUser->name,
                        'email' => $authenticatedUser->email,
                        'social_id' => $authenticatedUser->id,
                        'social_type' => 'google',
                        'password' => bcrypt('password')
                    ]
                );

                return $this->formatUserResourceWithToken($newUser, $authenticatedUser);
            }
        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }

    function formatUserResourceWithToken($user, $authenticatedUser): UserResource
    {
        $token = auth()->login($user);

        return (new UserResource($user))->additional([
            'meta' => [
                'token' => $token,
                'access_token' => $authenticatedUser->token
            ]
        ]);
    }
}
