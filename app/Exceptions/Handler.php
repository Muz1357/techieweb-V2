<?php

namespace App\Exceptions;

use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Support\Facades\Log;

class Handler extends ExceptionHandler
{
    protected $dontFlash = ['current_password','password','password_confirmation'];

    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });

        $this->renderable(function (AuthorizationException $e, $request) {
            Log::warning('Unauthorized access', [
                'user_id' => optional($request->user())->id,
                'route' => $request->path(),
                'ip' => $request->ip(),
            ]);
            return response()->view('errors.403', [], 403);
        });
    }
}
