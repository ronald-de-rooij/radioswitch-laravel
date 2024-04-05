<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\UserResource;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;


class UserController extends ApiController
{
    public function user(Request $request): mixed
    {
        // return $request->bearerToken();
      return $this->successResponse(new UserResource($request->user()));
    }
}
