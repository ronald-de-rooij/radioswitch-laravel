<?php
// TODO INSTALL SPATIE
namespace App\Http;

class Role extends \Spatie\Permission\Models\Role
{
    // Roles
    public const ADMIN = 'admin';
    public const USER = 'user';

    /**
     * @return string[]
     */
    public static function allRoles(): array
    {
        return [
            self::ADMIN,
            self::USER,
        ];
    }
}
