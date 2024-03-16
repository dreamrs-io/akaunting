<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RedirectHome
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if ($request->is('home')) {
            return redirect('/');
        }

        // welcome/home is not good choice it will add another level of route and we dont want that 
        // so i check for home and if not home then flow will be normal and anything after index route will be treated as company ID

        return $next($request);
    }
}
