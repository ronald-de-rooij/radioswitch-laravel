<?php

namespace App\Listeners;

use App\Events\StreamCreated;
use App\Models\User;
use App\Notifications\NewStream;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendStreamCreatedNotifications implements ShouldQueue
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(StreamCreated $event): void
    {
        // dd($event->stream);
        User::cursor()->each(function ($user) use ($event) {
            $user->notify(new NewStream($event->stream));
        });
    }
}
