<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use Stevebauman\Location\Facades\Location;
class LogUserLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $response = $next($request);

        if (Auth::check()) {
            $user = Auth::user();
            $user->last_login_at = now();
            $user->last_login_ip = $request->ip();

            $location = Location::get($request->ip());
            if ($location) {
                $user->last_login_location = $location->city . ', ' . $location->countryName;
            }

            $user->last_login_browser = $request->header('User-Agent');
            $user->save();
        }

        return $response;

    }
}
