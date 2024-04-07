<?php

namespace App\Http\Controllers\Landing;

use App\Abstracts\Http\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Str;


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
        if (!$request->has('token')) {
            return response()->json([
                'status' => null,
                'success' => false,
                'error' => true,
                'message' => 'No Token provided',
                'data' => null,
                'redirect' => null,
            ]);
        }

        $token = json_decode(Crypt::decryptString($request->token));


        $tokenTimestamp = Carbon::createFromTimestampMs($token->timestamp);

        $currentTimestamp = Carbon::now();

        $timeDifferenceMinutes = $currentTimestamp->diffInMinutes($tokenTimestamp);

        $timeDifferenceString = $tokenTimestamp->diffForHumans($currentTimestamp);

        // dd([$tokenTimestamp,$currentTimestamp,$timeDifferenceMinutes]);

        if ($timeDifferenceMinutes > 10) {
            return response()->json([
                'status' => null,
                'success' => false,
                'error' => true,
                'message' => 'Token Expired ' . $timeDifferenceString,
                'data' => null,
                'redirect' => null,
            ]);
        }




        // Attempt to login
        if (!auth()->attempt([
            "email" => $token->email,
            "password" => $token->password,
        ], false)) {
            return response()->json([
                'status' => null,
                'success' => false,
                'error' => true,
                'message' => trans('auth.failed'),
                'data' => null,
                'redirect' => null,
            ]);
        }

        // Get user object
        $user = user();

        // Setting Password In Session 
        // Session::put('password', $request->password);


        // Check if user is enabled
        if (!$user->enabled) {
            $this->logout();

            return response()->json([
                'status' => null,
                'success' => false,
                'error' => true,
                'message' => trans('auth.disabled'),
                'data' => null,
                'redirect' => null,
            ]);
        }

        $company = $user->withoutEvents(function () use ($user) {
            return $user->companies()->enabled()->first();
        });

        // Logout if no company assigned
        if (!$company) {
            $this->logout();

            return response()->json([
                'status' => null,
                'success' => false,
                'error' => true,
                'message' => trans('auth.error.no_company'),
                'data' => null,
                'redirect' => null,
            ]);
        }

        // Redirect to portal if is customer
        if ($user->isCustomer()) {
            $path = session('url.intended', '');

            // Path must start with company id and 'portal' prefix
            if (!Str::startsWith($path, $company->id . '/portal')) {
                $path = route('portal.dashboard', ['company_id' => $company->id]);
            }

            return response()->json([
                'status' => null,
                'success' => true,
                'error' => false,
                'message' => trans('auth.login_redirect'),
                'data' => null,
                'redirect' => url($path),
            ]);
        }

        // Redirect to landing page if is user
        $url = route($user->landing_page, ['company_id' => $company->id]);
        // $url = route('chat-gpt.main.index', ['company_id' => $company->id]);

        // return response()->json([
        //     'status' => null,
        //     'success' => true,
        //     'error' => false,
        //     'message' => trans('auth.login_redirect'),
        //     'data' => null,
        //     'redirect' => redirect()->intended($url)->getTargetUrl(),
        // ]);
        return redirect()->intended($url);
    }
}
