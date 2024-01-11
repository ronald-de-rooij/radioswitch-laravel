<?php

namespace App\Models;

use App\Events\StreamCreated;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Stream extends Model
{
    use HasFactory;

    protected $fillable = [
        'description',
        'image_url',
        'stream_url',
        'title',
        'user_id', // TODO Is this needed?
    ];

    public $dispatchedEvents = [
        'stream-created' => StreamCreated::class,
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
