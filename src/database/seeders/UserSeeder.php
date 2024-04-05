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
        $email = env('DEFAULT_USER_EMAIL', 'mario@bros.com');
        $id = env('DEFAULT_USER_ID', Uuid::uuid4());

        // $user = User::updateOrCreate(
        User::updateOrCreate(
            [
                'id' => $id
            ],
            [
                'name' => env('DEFAULT_USER_NAME', 'Mario Bros'),
                'email' => $email,
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
