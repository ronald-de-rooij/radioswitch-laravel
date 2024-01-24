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

class AuthController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function login(Request $request)
    {


        $credentials = $this->validate($request,
            [
                'email' => 'required|email',
                'password' => 'required|string|min:6|max:255',
            ]
        );

        if (! Auth::attempt($credentials)) {
            abort(HttpCode::UNAUTHORIZED, __('Could not login with provided credentials'));
        }

        $user = Auth::user();
        /** @var User $user */
        // $accessToken = $user->createToken('personal_access_token')->accessToken;

        return [
            'user' => new UserResource($user),
            // 'access_token' => $accessToken,
        ];

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

    /**
 * @return \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Query\Builder|object|null
 */
    protected function getClient()
    {
        $client = DB::table('oauth_clients')
            ->where('personal_access_client', '=', false)
            ->first();
        if (empty($client)) {
            abort(Response::HTTP_INTERNAL_SERVER_ERROR, "Client was not set up.");
        }
        return $client;
    }

}
