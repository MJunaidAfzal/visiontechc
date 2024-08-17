<?php

namespace App\Filament\Resources\LeadAssigneeResource\Pages;

use App\Filament\Resources\LeadAssigneeResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListLeadAssignees extends ListRecords
{
    protected static string $resource = LeadAssigneeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
