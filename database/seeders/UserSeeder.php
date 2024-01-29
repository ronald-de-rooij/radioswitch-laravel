<?php

namespace Database\Seeders;

use App\Models\User;
// use Ramsey\Uuid\Uuid;
use Illuminate\Database\Seeder;
use App\Http\Role;

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
        $id = env('DEFAULT_USER_ID', 1); 
        // TODO: Uuid::uuid4() - https://gitlab.com/wolfpackit/projects/euroteq/backend/-/blob/main/src/database/seeders/UserSeeder.php

        $user = User::updateOrCreate(
            [
                'id' => $id
            ],
            [
                'name' => 'Mario Bros',
                'email' => $email,
                'password' => bcrypt($this->getDefaultPassword()),
            ]
        );
        $user->assignRole(Role::ADMIN);
    }

    protected function getDefaultPassword(): string
    {
        if (env('APP_ENV') == 'production') {
            return env('DEFAULT_USER_PASSWORD');
        }
        return 'testtest';
    }

}
