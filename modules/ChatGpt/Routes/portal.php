<?php

use Illuminate\Support\Facades\Route;

/**
 * 'portal' middleware and 'portal/chat-gpt' prefix applied to all routes (including names)
 *
 * @see \App\Providers\Route::register
 */

Route::portal('chat-gpt', function () {
    // Route::get('invoices/{invoice}', 'Main@show')->name('invoices.show');
    // Route::post('invoices/{invoice}/confirm', 'Main@confirm')->name('invoices.confirm');
});
