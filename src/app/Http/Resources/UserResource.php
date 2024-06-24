<?php

namespace App\Http\Resources;

use App\Models\User;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'name' => $this->name,
            'email' => $this->email,
            // TODO: add 'role' => $this->role,
            // Check: https://gitlab.com/wolfpackit/projects/euroteq/backend/-/blob/main/src/app/Http/Resources/UserResource.php
        ];
    }
}