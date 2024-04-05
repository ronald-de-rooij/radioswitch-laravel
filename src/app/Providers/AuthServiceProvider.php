<?php
// TODO Can this be removed?
namespace App\Providers;

// use Illuminate\Support\Facades\Gate;
// use Carbon\Carbon;
// use Laravel\Passport\Passport;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();

        // Passport::tokensExpireIn(Carbon::now()->addDays(
        //     config('passport.tokens.access_token_lifetime')
        // ));
        // Passport::refreshTokensExpireIn(Carbon::now()->addDays(
        //     config('passport.tokens.refresh_token_lifetime')
        // ));
        // Passport::personalAccessTokensExpireIn(Carbon::now()->addDays(
        //     config('passport.tokens.personal_access_token_lifetime')
        // ));

    }
}
