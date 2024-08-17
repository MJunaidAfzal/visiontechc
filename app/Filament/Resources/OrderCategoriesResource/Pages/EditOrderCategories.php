<?php

namespace App\Filament\Resources\OrderCategoriesResource\Pages;

use App\Filament\Resources\OrderCategoriesResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditOrderCategories extends EditRecord
{
    protected static string $resource = OrderCategoriesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
