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
        // Route::get('/', 'Settings@edit')->name('edit');
        // Route::post('/', 'Settings@update')->name('update');
        // Route::post('get', 'Settings@get')->name('get');
        // Route::delete('delete', 'Settings@destroy')->name('delete');
    });
    // Route::resource('users', 'Auth\Users', ['middleware' => ['dropzone']]);
    // Route::group(['as' => 'chat-gpt.'], function () {
    //     Route::get('/index', 'Main@index')->name('index');
    //     // Route::get('/', 'Settings@edit')->name('edit');
    //     // Route::post('/', 'Settings@update')->name('update');
    //     // Route::post('get', 'Settings@get')->name('get');
    //     // Route::delete('delete', 'Settings@destroy')->name('delete');
    // });
});