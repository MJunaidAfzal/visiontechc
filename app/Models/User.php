<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

// use Jeffgreco13\FilamentBreezy\Traits\TwoFactorAuthenticatable;
// use Solutionforest\FilamentEmail2fa\Interfaces\RequireTwoFALogin;
// use Solutionforest\FilamentEmail2fa\Trait\HasTwoFALogin;
use Jeffgreco13\FilamentBreezy\Traits\TwoFactorAuthenticatable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
//  implements RequireTwoFALogin
{
    use HasFactory, Notifiable , HasRoles , TwoFactorAuthenticatable , HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function leads()
    {
        return $this->belongsToMany(Lead::class, 'lead_assignees');
    }

    // public function roles()
    // {
    //     return $this->belongsToMany(Role::class);
    // }

    // public function permissions()
    // {
    //     return $this->roles->map->permissions->flatten()->unique();
    // }
}
