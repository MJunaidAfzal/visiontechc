<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Parallax\FilamentComments\Models\Traits\HasFilamentComments;
use Illuminate\Support\Str;

class Order extends Model
{
    use HasFactory , HasFilamentComments;

    protected $fillable = [
        'order_number',
        'description',
        'word_count',
        'deadline',
        'order_attachments',
        'comment',
        'name',
        'email',
        'phone_number',
        'status',
        'payment_method',
        'payment_receipt',
        'total_amount',
        'upfront',
        'user_id',
        'lead_id',

        'order_categories_id',
        'priority'
    ];

    protected function casts(): array
    {
        return [
            'order_attachments' => 'array',
            'payment_receipt' => 'array',
            'priority' => 'boolean',
        ];
    }

    protected static function booted()
    {
        static::creating(function ($order) {
            do {
                $orderNumber = 'ODR-' . Str::upper(Str::random(6));
            } while (self::where('order_number', $orderNumber)->exists());

            $order->order_number = $orderNumber;
        });
    }

    public function assignees()
    {
        return $this->belongsToMany(User::class, 'order_assignees');
    }

    public function lead()
    {
        return $this->belongsTo(Lead::class, 'lead_id');
    }

    public function category()
    {
        return $this->belongsTo(OrderCategories::class, 'order_categories_id');
    }

    public function user_created()
    {
        return $this->belongsTo(User::class, 'user_id' , 'id');
    }

    // public function order_status()
    // {
    //     return $this->belongsTo(Or::class, 'created_by');
    // }


    // public function assignees()
    // {
    //     return $this->belongsToMany(User::class, 'lead_assignees');
    // }



}
