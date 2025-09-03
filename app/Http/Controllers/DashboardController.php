<?php

namespace App\Http\Controllers;



class DashboardController extends Controller
{
    public function __invoke()
    {
        $user = auth()->user();

        if ($user->isAdmin()) {
            return redirect()->route('admin.dashboard');
        }
        return redirect()->route('customer.dashboard');
    }
}
