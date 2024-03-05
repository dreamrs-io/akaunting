<?php

use Illuminate\Support\Facades\Route;

/**
 * 'portal' middleware and 'portal/pocket-cfo' prefix applied to all routes (including names)
 *
 * @see \App\Providers\Route::register
 */

Route::portal('pocket-cfo', function () {
    Route::get('/', 'Main@index');
})->middleware('guest');

