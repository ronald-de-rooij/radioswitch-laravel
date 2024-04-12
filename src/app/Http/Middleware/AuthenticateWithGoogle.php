<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthenticateWithGoogle
{
    public function handle(Request $request, Closure $next)
    {
        $accessToken = $request->bearerToken();

        if (!$accessToken) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        try {
            $user = JWTAuth::parseToken()->authenticate();
            if (!$user) {
                return response()->json(['error' => 'Unauthorized'], 403);
            }
            return $next($request);
        } catch (JWTException $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }

        // return response()->json([$user, "user data retrieved"], 200);
        // Validate access token with Google OAuth server
        // $response = Http::asForm()->post('https://oauth2.googleapis.com/tokeninfo', [
        //     'access_token' => $accessToken,
        // ]);

        // if ($response->successful()) {
        //     // Token is valid
        //     // return true;
        //     return $next($request);
        // }

        // // Token is invalid
        // return response()->json(['error' => 'Unauthorized'], 401);
    }
}
