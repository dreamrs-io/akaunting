<?php

namespace App\Http\Controllers\Landing;

use App\Abstracts\Http\Controller;
use Illuminate\Http\Request;

class Main extends Controller

{

    
/**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'destroy']);
    }
    public function index(){

        return view('landing.home.index');
    }
}
