<?php

namespace App\Policies;

use App\Models\Stream;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class StreamPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Stream $stream): bool
    {
        //
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo(Permisson::CREATE_STREAM)) {
            return true;
        }
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Stream $stream): Response
    {
        return $user->id === $stream->user_id
            ? Response::allow()
            : Response::deny('You do not own this stream.');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Stream $stream): Response
    {
        return $this->update($user, $stream);
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Stream $stream): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Stream $stream): bool
    {
        //
    }
}
