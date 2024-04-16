<?php

use Illuminate\Support\Facades\Route;

Route::post('/stripe/webhook', 'PocketCfo\webhook@index');
