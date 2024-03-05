<?php

use Illuminate\Support\Facades\Route;



Route::admin('pocket-cfo', function () {
        Route::resource('/', 'Main');
});
