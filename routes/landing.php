<?php

use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'welcome'], function () {
    Route::get('home', 'Landing\Main@index')->name('home'); 
});



