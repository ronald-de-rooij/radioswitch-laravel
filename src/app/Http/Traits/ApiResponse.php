<?php

namespace App\Http\Traits;

use App\Http\HttpCode;
use Illuminate\Http\JsonResponse;
use Illuminate\Pagination\LengthAwarePaginator;

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
        $response = response()->json( // NOSONAR
            $resourceClassName::collection($query->all()),
            HttpCode::OK
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
    protected function successResponse($data, string $message = null, int $code = HttpCode::OK): JsonResponse
    {
        if (empty($data) && !empty($message)) {
            $data = ['message' => $message];
        }
        return response()->json($data, $code);
    }

    protected function errorResponse(
        $errors,
        string $message = null,
        int $code = HttpCode::INTERNAL_SERVER_ERROR
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
