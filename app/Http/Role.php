<?php

namespace App\Http;

class Role extends \Spati\Permission\Models\Role
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