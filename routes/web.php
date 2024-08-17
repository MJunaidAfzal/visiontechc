<?php

use App\Models\User;
use App\Models\LeadSource;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

use Filament\Notifications\Notification;



Route::get('/', function () {
    // return view('welcome');
    return redirect('/admin/login');
});


Route::get('/uss', function () {
    // return view('welcome');
    User::create([
        'name' => 'admin',
        'email' => 'admin@gmail.com',
        'password' => Hash::make('admin123'),
    ]);
});

Route::get('/create-perm', function () {

    $mrole = Role::where('name','administrator')->first();
    // dd($mrole);
    $roles = [
            // "see-dashboard",
        "lead-list",
        "lead-create",
        "lead-edit",
        "lead-delete",
        "order-list",
        "order-create",
        "order-edit",
        "order-delete",
        "client-list",
        "client-create",
        "client-edit",
        "client-delete",
        "user-list",
        "user-create",
        "user-edit",
        "user-delete",
        "role-list",
        "role-create",
        "role-edit",
        "role-delete"
    ];

    foreach($roles as $role){
        // dd($role);
        $permission = Permission::create(['name' => $role]);
        $mrole->givePermissionTo($permission);

    }
    $user = \App\Models\User::find(1);
    $user->assignRole('administrator');

    // // return view('welcome');
    // User::create([
    //     'name' => 'admin',
    //     'email' => 'admin@gmail.com',
    //     'password' => Hash::make('admin123'),
    // ]);
});
Route::get('/create-ls', function () {
    $leadsource =[
        'Web',
        'Phone Enquiry',
        'Partner Referral',
        'Purchased List',
        'Other'
    ];
    foreach ($leadsource as $ls){
        LeadSource::create(['name'=>$ls]);
    }


});


Route::get('/noti', function () {

    $recipient = User::find(1);

    // dd($recipient);
    $recipient->notify(
        Notification::make()
            ->title('Saved successfully')
            ->toDatabase(),
    );


});



