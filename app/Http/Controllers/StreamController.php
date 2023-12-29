<?php

namespace App\Http\Controllers;

use Illuminate\View\View;

class StreamController extends Controller
{
    public function index(): View
    {
        return view('streams', [
            //
        ]);
    }
}
