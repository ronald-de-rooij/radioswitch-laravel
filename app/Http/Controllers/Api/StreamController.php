<?php

namespace App\Http\Controllers\Api;

use App\Events\StreamCreated; // TODO can be removed (MailTrap)
use App\Http\Controllers\Controller;
use App\Http\Resources\StreamResource;
use Illuminate\Http\Request;
use App\Http\Requests\StreamStoreRequest;
use App\Models\Stream;
use Illuminate\Http\Resources\Json\JsonResource;

class StreamController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return StreamResource::collection(Stream::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StreamStoreRequest $request): JsonResource
    {
        $stream = Stream::create($request->all());

        return new StreamResource($stream);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return StreamResource::collection(Stream::findOrFail($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $stream = Stream::findOrFail($id);
        $stream->update($request->all());

        return StreamResource::collection($stream, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Stream::findOrFail($id)->delete();

        return StreamResource::collection(null, 204);
    }
}
