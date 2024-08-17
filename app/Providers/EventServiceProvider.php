<?php
namespace App\Providers;

use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\Logout;

use App\Listeners\StoreUserPermissionsInSession;
use App\Listeners\ClearUserPermissionsOnLogout;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        Login::class => [
            StoreUserPermissionsInSession::class,
        ],
        Logout::class => [
            ClearUserPermissionsOnLogout::class,
        ],
    ];

    public function boot()
    {
        parent::boot();
    }
}
