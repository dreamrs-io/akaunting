<?php

use Illuminate\Support\Facades\Route;

/**
 * 'admin' middleware and 'pocket-cfo' prefix applied to all routes (including names)
 *
 * @see \App\Providers\Route::register
 */

Route::group( function () {
    Route::get('/', 'Main@index')->name('landing');
});
