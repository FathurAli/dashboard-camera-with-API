<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;
use Mockery\Generator\StringManipulation\Pass\Pass;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        Passport::routes();

        Passport::tokensExpireIn(now()->addHours(2));
    
        Passport::refreshTokensExpireIn(now()->addHours(2));
    
        Passport::personalAccessTokensExpireIn(now()->addHours(2));

        Gate::before(function ($user, $ability) {
            if ($user->hasRole('superadmin')) {
                return true;
            }
        });
    }
}
