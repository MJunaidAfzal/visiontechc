<?php

namespace App;

enum OrderStatus: int
{
    case InProgress = 1;
    case Revision = 2;
    case Completed = 3;
    case Cancelled = 4;

    public function label(): string
    {
        return match($this) {
            self::InProgress => 'In progress',
            self::Revision => 'Revision',
            self::Completed => 'Completed',
            self::Cancelled => 'Cancelled',
        };
    }
}
