<?php

namespace App\Http\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Http\Response;

trait ApiResponse
{
    /**
     * Supply a paginated Builder
     * @param LengthAwarePaginator $query
     * @param string $resourceClassName
     * @return JsonResponse
     */
    protected function successResponsePaged(
        LengthAwarePaginator $query,
        string $resourceClassName = 'JsonResource'
    ): JsonResponse {
        $response = response()->json(
            $resourceClassName::collection($query->all()),
            Response::HTTP_OK
        )->withHeaders([
            'x-pagination-page-count' => $query->lastPage(),
            'x-pagination-per-page' => $query->perPage(),
            'x-pagination-total-count' => $query->total(),
        ]);
        return $response;
    }

    /**
     * @param $data
     * @param string|null $message
     * @param int $code
     * @return JsonResponse
     */
    protected function successResponse($data, string $message = null, int $code = Response::HTTP_OK): JsonResponse
    {
        if (empty($data) && !empty($message)) {
            $data = ['message' => $message];
        }
        return response()->json($data, $code);
    }

    protected function errorResponse(
        $errors,
        string $message = null,
        int $code = Response::HTTP_INTERNAL_SERVER_ERROR
    ): JsonResponse {
        return response()->json(
            [
                'message' => $message,
                'errors' => $errors,
            ],
            $code
        );
    }
}
