<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    // app/Http/Middleware/RoleMiddleware.php

public function handle($request, Closure $next, $role)
{
    if ($role == 1 && auth()->check() && auth()->user()->isAdmin()) {
        return $next($request);
    } elseif ($role == null && auth()->check() && auth()->user()->isUser()) {
        return $next($request);
    }

    abort(403, 'Unauthorized action.');
}

}
