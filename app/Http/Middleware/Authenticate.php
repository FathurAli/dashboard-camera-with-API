<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Closure;
use Illuminate\Support\Facades\Auth;
use Laravel\Passport\Exceptions\OAuthServerException;

class Authenticate extends Middleware
{

    public function handle($request, Closure $next, ...$guards)
    {
        if (Auth::guard('admin')->guest()) {
            // Periksa jika token sudah kedaluwarsa atau tidak valid
            return response()->json([
                'status' => 'error',
                'message' => 'Token sudah kedaluwarsa atau tidak valid.'
            ], 401);
        }

        return $next($request);
    }
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            return route('admin.auth.login');
        }
    }
}
