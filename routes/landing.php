<?php

use App\Jobs\Auth\CreateUser;
use App\Models\Auth\User;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

Route::get('/', 'Landing\Main@index');

Route::group(['prefix' => 'home'], function () {
    Route::get('/', function () {
        return redirect('/');
    });
    Route::get('/tools', 'Landing\Main@tools');
    Route::get('/blog', 'Landing\Main@tools');
    Route::get('/tools/{category}', 'Landing\Main@toolsCat');
    Route::get('/tools/{category}/{name}', 'Landing\Main@toolShow');
    Route::get('/blogs/{category}/{name}', 'Landing\Main@blog');
    Route::get('/services', 'Landing\Main@blog');
});



Route::group(['prefix' => 'pocketcfo/api'], function () {
    Route::post('/signup', 'Landing\Main@register');

    // dd([$request->email,$request->password]);

    // $user = dispatch(new CreateUser($request));



    // $this->model = User::create($request->input());



});
