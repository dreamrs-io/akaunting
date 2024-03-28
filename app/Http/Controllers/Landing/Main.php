<?php

namespace App\Http\Controllers\Landing;

use App\Abstracts\Http\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

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
    public function index(Request $request)
    {

        if ($request->has('token')) {


            $aaa=Crypt::encrypt('HI');
            $d  =Crypt::decrypt($aaa);
            $nodejsString = 'eyJpdiI6IjNCdVJlMkNySGhyRm45bmEybVVIS3c9PSIsInZhbHVlIjoieE9NelFZUXVHd3QvbHVYZ2tBZmZobzZFcVdXUVF1QVNJNGc3OFVMNmxmVT0iLCJtYWMiOiI5Y2VhN2YzMjgwNzc5ZjQ0NjBkMDI0MjYyYjBlZTFjYjUwOTVlYWQ2M2JhMGVkMjdiNjA2MzU2Mzc0MzUyOGRmIn0=';
            $dnodejs=Crypt::decryptString($nodejsString);

           return response([
            'TEXT TO BE ENCRYPTED' => $d,
            'ENCRYPTED BY LARAVEL' => $aaa,
            'ENCRYPTED BY NODE JS' => $nodejsString,
            'DECRYPTING THE LARAVEL STRING' =>$d,
            'DECRYPTING THE NODEJS STRING' =>$dnodejs,
           ],200);
           

        }
        // return response('dddd', 200);
    }
}
