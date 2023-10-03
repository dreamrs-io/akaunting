<?php

use Illuminate\Support\Facades\Route;

/**
 * 'admin' middleware and 'chat-gpt' prefix applied to all routes (including names)
 *
 * @see \App\Providers\Route::register
 */

// Route::admin('chat-gpt', function () {
//     Route::get('/index', 'Main@index');
// });
Route::admin('chat-gpt', function () {
    Route::group(['prefix' => 'main', 'as' => 'main.'], function () {
        Route::resource('/', 'Main');

        // Route::get('detail/{id}', 'Main@detail')->name('detail');
        // Route::get('list', 'Main@getList')->name('list');
        // Route::post('send', 'Main@send')->name('send');
        // Route::post('call-gpt', 'Main@callGpt')->name('call-gpt');
        // Route::delete('delete', 'Settings@destroy')->name('delete');
    });
});