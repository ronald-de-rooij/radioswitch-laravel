<?php

namespace Database\Seeders;

use App\Models\User;
use Ramsey\Uuid\Uuid;
use Illuminate\Database\Seeder;
// use App\Http\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->createDefaultUser();
    }

    protected function createDefaultUser(): void
    {
        User::updateOrCreate(
            [
                'id' => env('DEFAULT_USER_ID', '3c6a5dc3-1484-43bc-808e-45137aee846d'),
            ],
            [
                'name' => env('DEFAULT_USER_NAME', 'Radio Switch'),
                'email' => env('DEFAULT_USER_EMAIL', 'info@radioswit.ch'),
                'password' => bcrypt($this->getDefaultPassword()),
            ]
        );
        // $user->assignRole(Role::ADMIN);
    }

    protected function getDefaultPassword(): string
    {
        if (env('APP_ENV') == 'production') {
            return env('DEFAULT_USER_PASSWORD');
        }
        return 'testtest';
    }
}
