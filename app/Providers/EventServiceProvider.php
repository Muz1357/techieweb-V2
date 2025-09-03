<?php

namespace App\Providers;

use App\Models\FailedLogin;
use Illuminate\Auth\Events\Failed;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        Failed::class => [
            // Just reference the listener class here
            'App\Listeners\RecordFailedLogin',
        ],
    ];

    public function boot()
    {
        parent::boot();

        // Or you can register it manually in the boot method
        \Event::listen(Failed::class, function (Failed $event) {
            FailedLogin::create([
                'email' => $event->credentials['email'] ?? 'unknown',
                'ip' => request()->ip(),
            ]);
        });
    }

    public function shouldDiscoverEvents(): bool { return false; }
}
