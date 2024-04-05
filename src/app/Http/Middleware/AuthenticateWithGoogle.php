<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class AuthenticateWithGoogle
{
    public function handle(Request $request, Closure $next)
    {
        $accessToken = $request->bearerToken();

        if (!$accessToken) {
            dd('No token');
            return false; // Token not provided
        }

        $response = Http::asForm()->post('https://oauth2.googleapis.com/tokeninfo', [
            'access_token' => $accessToken,
        ]);

        // Validate access token with Google OAuth server
        // You can use Google API Client Library or make HTTP request to Google's token validation endpoint

        if ($response->successful()) {
            // Token is valid
            return true;
        }

        // Token is invalid
        return response()->json(['error' => 'Unauthorized'], 401);
    }
}
