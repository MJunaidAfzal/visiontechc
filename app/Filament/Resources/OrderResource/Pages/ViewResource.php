<?php
namespace App\Filament\Resources\ProductResource\Pages;

use Parallax\FilamentComments\Actions\CommentsAction;
use Filament\Resources\Pages\ViewRecord;


class ViewProduct extends ViewRecord
{
    protected function getHeaderActions(): array
    {
        return [
            CommentsAction::make(),
        ];
    }
}
