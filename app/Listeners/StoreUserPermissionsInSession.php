<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

use Illuminate\Auth\Events\Login;
use Illuminate\Support\Facades\Session;


class StoreUserPermissionsInSession
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(object $event): void
    {
        //
        $user = $event->user;

        // Load all permissions and store them in the session
        // $permissions = $user->permissions()->pluck('name')->toArray();
        $permissions = $user->roles()->with('permissions')->get()
        ->pluck('permissions.*.name')
        ->flatten()
        ->unique()
        ->toArray();
        Session::put('user_permissions', $permissions);
    }
}
