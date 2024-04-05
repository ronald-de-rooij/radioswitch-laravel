<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\StreamResource;
use App\Http\Requests\StreamStoreRequest;
use App\Http\Requests\StreamUpdateRequest;
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
        return Stream::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StreamUpdateRequest $request, string $id)
    {
        $stream = Stream::findOrFail($id);

        $request->validate([
            // 'description' => 'required',
            'title' => 'required',
            'image_url' => 'required',
        ]);

        $stream->update($request->all());

        return new StreamResource($stream, 200);
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
