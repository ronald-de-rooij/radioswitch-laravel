<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;

class ApiController extends Controller
{
    use ApiResponse;

    public const PAGE_SIZE = 10;
    public const PAGE_SIZE_SEARCH = 100;
}
