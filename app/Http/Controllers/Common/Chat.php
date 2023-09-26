<?php

namespace App\Http\Controllers\Common;

use App\Abstracts\Http\Controller;
use App\Http\Requests\Common\Dashboard as Request;
use App\Traits\DateTime;
use App\Traits\Users;


class Chat extends Controller
{
    use DateTime, Users;

    /**
     * Instantiate a new controller instance.
     */
    public function __construct()
    {
        // // Add CRUD permission check
        // $this->middleware('permission:create-common-dashboards')->only('create', 'store', 'duplicate', 'import');
        // $this->middleware('permission:read-common-dashboards')->only('show');
        // $this->middleware('permission:update-common-dashboards')->only('index', 'edit', 'export', 'update', 'enable', 'disable', 'share');
        // $this->middleware('permission:delete-common-dashboards')->only('destroy');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $dashboards = user()->dashboards()->collect();

        return $this->response('common.chat.index', compact('dashboards'));
    }

    

    
}
