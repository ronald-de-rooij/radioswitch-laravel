<?php

namespace App\Notifications;

use App\Models\Stream;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Str;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewStream extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
    public function __construct(public Stream $stream)
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject("New Stream from {$this->stream->user->name}")
            ->greeting("New Stream from {$this->stream->user->name}")
            ->line(Str::limit($this->stream->title, 100))
            ->line(Str::limit($this->stream->description, 100))
            ->action("View Stream", url('/streams/{$this->stream->id}'))
            ->line("Thank you for using our application!");
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}
