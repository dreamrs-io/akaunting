<?php

use App\Jobs\Auth\CreateUser;
use App\Models\Auth\User;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

Route::get('/redirect', 'Landing\Main@index');
