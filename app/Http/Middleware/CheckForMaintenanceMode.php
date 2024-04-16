<?php

namespace App\Http\Middleware;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Foundation\Http\Middleware\PreventRequestsDuringMaintenance;

class CheckForMaintenanceMode extends PreventRequestsDuringMaintenance
{

    public function __construct(Application $app)
    {
        parent::__construct($app);
        $this->except = ['stripe/webhook'];
    }
    
}
