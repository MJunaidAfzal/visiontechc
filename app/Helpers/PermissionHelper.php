<?php

if (!function_exists('hasPermission')) {
    /**
     * Check if the authenticated user has a specific permission.
     *
     * @param string $permission
     * @return bool
     */
    function hasPermission($permission)
    {
        // Retrieve permissions from the session
        $permissions = session('user_permissions');
        // dd($permissions);
        // Check if the permission exists in the stored array
        return in_array($permission, $permissions);
    }
}
