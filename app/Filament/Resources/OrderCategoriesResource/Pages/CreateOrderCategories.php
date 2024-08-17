<?php

namespace App\Filament\Resources\OrderCategoriesResource\Pages;

use App\Filament\Resources\OrderCategoriesResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateOrderCategories extends CreateRecord
{
    protected static string $resource = OrderCategoriesResource::class;
}
