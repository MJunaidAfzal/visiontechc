<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Lead extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'title', 'email','phone_number','city' ,'country','description' , 'client_id' , 'lead_source_id' ,'status'];

    public function assignees()
    {
        return $this->belongsToMany(User::class, 'lead_assignees');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }

    public function lead_source()
    {
        return $this->belongsTo(LeadSource::class, 'lead_source_id');
    }

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }
}
