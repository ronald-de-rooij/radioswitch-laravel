<?php

namespace Database\Seeders;

use App\Http\Permission;
use App\Http\Role;
use Illuminate\Database\Seeder;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $role = Role::where('name', Role::ADMIN)->first();
        $role->syncPermissions(
            [
                Permission::STREAM_VIEW,
                Permission::STREAM_VIEW_ANY,

                Permission::STREAM_CREATE,
                Permission::STREAM_UPDATE,
                Permission::STREAM_DELETE,
            ]
        );

    }
}
