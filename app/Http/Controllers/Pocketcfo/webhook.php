<?php

namespace App\Http\Controllers\Pocketcfo;

use App\Abstracts\Http\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Crypt;

class webhook extends Controller
{

    public function __construct()
    {
        $this->middleware('guest', ['except' => 'destroy']);
    }


    public function index(Request $request)
    {

        $token = $request->input('token');

        if (!$token) {
            return response()->json([
                'message' => "Token dose'nt exists",
            ], 400);
        }

        try {
            $token = json_decode(Crypt::decryptString($token));
        } catch (\Throwable $th) {
            return response()->json([
                'message' => "Invalid Token",
            ]);
        }

        $domain =   parse_url(env('APP_URL'))['host'];

        if ($token->domain != $domain) {
            return response()->json([
                'token_domain' => $token->domain,
                'app_domain' => $domain,
                'message' => "Invalid Token Domain",
            ], 400);
        }
    
        $tokenTimestamp = Carbon::createFromTimestampMs($token->timestamp);

        $currentTimestamp = Carbon::now();

        $timeDifferenceMinutes = $currentTimestamp->diffInMinutes($tokenTimestamp);

        $timeDifferenceString = $tokenTimestamp->diffForHumans($currentTimestamp);

        if ($timeDifferenceMinutes > 1) {
            return response()->json([
                'message' => 'Token Expired ' . $timeDifferenceString,
            ], 400);
        }
   
        if ($token->subscription == 'active') {

            Artisan::call('up');

            return response()->json([
                'message' => 'Webhook event received application enabled',
            ], 200);

        } else {

            Artisan::call('down', [
                '--status' => '402',

            ]);
            return response()->json([
                'message' => 'Webhook event received application disabled',
            ], 200);

        }
      
        return response()->json([
            'message' => 'Webhook event received no action performed',
        ], 200);
    }
}
