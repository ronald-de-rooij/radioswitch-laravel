<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Http\HttpCode;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

class ApiAuthController extends Controller
{
    public function login(Request $request)
    {
        // Use OAuth to log in and provide a proxy.
        $client = $this->getClient();

        $this->validate(
            $request,
            [
                'email' => 'required|email',
                'password' => 'required',
            ]
        );

        $request->request->add([
            'username' => $request->email,
            'password' => $request->password,
            'grant_type' => 'password',
            'client_id' => $client->id,
            'client_secret' => $client->secret,
            'scope' => '*'
        ]);

        $proxy = Request::create(
            'oauth/token',
            'POST'
        );

        return Route::dispatch($proxy);
    }

        /**
     * @param Request $request
     * @return mixed
     */
    protected function refreshToken(Request $request)
    {
        $client = $this->getClient();

        $request->request->add([
            'grant_type' => 'refresh_token',
            'refresh_token' => $request->refresh_token,
            'client_id' => $client->id,
            'client_secret' => $client->secret,
        ]);

        $proxy = Request::create(
            '/oauth/token',
            'POST'
        );

        return Route::dispatch($proxy);
    }


    /**
     * @return \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Query\Builder|object|null
     */
    protected function getClient()
    {
        $client = DB::table('oauth_clients')
            ->where('personal_access_client', '=', false)
            ->first();
        if (empty($client)) {
            abort(HttpCode::INTERNAL_SERVER_ERROR, "Client was not set up.");
        }
        return $client;
    }


    public function logout()
    {
        if (! Auth::check()) {
            abort(HttpCode::UNAUTHORIZED);
        }
        /** @var User $user */
        $user = Auth::user();
        $token = $user->token();
        $token->revoke();

        return __('User logged out successfully');
    }

}
