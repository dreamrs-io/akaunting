<?php

namespace App\Http\Controllers\Landing;

use App\Abstracts\Http\Controller;
use App\Jobs\Auth\CreateUser;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;

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
    public function tools(){

        return view('landing.tools.index');
    }
    public function toolsCat($category){

        $items = config('static-data.tools');

        $foundTools = Arr::first($items, function ($item) use ($category) {
            return $item['category'] === $category;
        });

        if ($foundTools == null){
            abort(404);
        }

        return view('landing.tools.category.index');
    }

    public function toolShow($category, $name){

        // $items = config('static-data.tools');

        // $foundTools = Arr::first($items, function ($item) use ($category) {
        //     return $item['category'] === $category;
        // });

        // if ($foundTools == null){
        //     abort(404);
        // }


        return view('landing.tools.category.show');
    }

    public function register(Request $request){
        
        $user = dispatch(new CreateUser($request));

    }
}
