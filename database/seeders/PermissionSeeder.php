<?php

namespace Database\Seeders;

use App\Http\Permission;
use Illuminate\Database\Seeder;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach (Permission::allPermissions() as $permission) {
            Permission::findOrCreate($permission);
        }
    }
}
