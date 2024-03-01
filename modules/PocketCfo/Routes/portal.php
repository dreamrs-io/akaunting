<?php

use Illuminate\Support\Facades\Route;

/**
 * 'portal' middleware and 'portal/pocket-cfo' prefix applied to all routes (including names)
 *
 * @see \App\Providers\Route::register
 */

Route::portal('pocket-cfo', function () {
    // Route::get('invoices/{invoice}', 'Main@show')->name('invoices.show');
    // Route::post('invoices/{invoice}/confirm', 'Main@confirm')->name('invoices.confirm');
});
