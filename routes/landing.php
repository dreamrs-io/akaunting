<?php

use Illuminate\Support\Facades\Route;



Route::get('/', 'Landing\Main@index');

Route::group(['prefix' => 'home'], function () {
    Route::get('/',function(){
        return redirect('/');
    });
    Route::get('/tools', 'Landing\Main@tools');
    Route::get('/tools/{category}', 'Landing\Main@toolsCat');
    Route::get('/tools/{category}/{name}', 'Landing\Main@toolShow');

});



