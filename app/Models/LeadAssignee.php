<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LeadAssignee extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','lead_id'];
}
