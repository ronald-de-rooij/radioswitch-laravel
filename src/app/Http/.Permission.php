<?php
// TODO INSTALL SPATIE
namespace App\Http;

class Permission extends \Spatie\Permission\Models\Permission
{
    // Streams
    public const STREAM_VIEW = 'stream.view';
    public const STREAM_VIEW_ANY = 'stream.viewAny';
    public const STREAM_CREATE = 'stream.create';
    public const STREAM_UPDATE = 'stream.update';
    public const STREAM_DELETE = 'stream.delete';


    /**
     * @return string[]
     */
    public static function allPermissions(): array
    {
        return [
            // Streams
            self::STREAM_VIEW,
            self::STREAM_VIEW_ANY,
            self::STREAM_CREATE,
            self::STREAM_UPDATE,
            self::STREAM_DELETE,
        ];
    }
}
