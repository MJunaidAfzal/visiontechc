<?php

namespace App\Filament\Resources\LeadResource\Pages;

use App\Filament\Resources\LeadResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use App\Models\Lead;

class CreateLead extends CreateRecord
{
    protected static string $resource = LeadResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $assignees = $data['assignees'] ?? [];
        unset($data['assignees']);

        $lead = Lead::create($data);
        $lead->assignees()->sync($assignees);

        return $data;
    }
}
