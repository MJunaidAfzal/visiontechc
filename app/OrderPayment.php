<?php

namespace App;

enum OrderPayment: int
{
    case Paypal = 1;
    case Payooner = 2;
    case Other = 3;

    public function label(): string
    {
        return match($this) {
            self::Paypal => 'Paypal',
            self::Payooner => 'Payooner',
            self::Other => 'Other',
        };
    }
}
