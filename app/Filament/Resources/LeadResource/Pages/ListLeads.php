<?php

namespace App\Filament\Resources\LeadResource\Pages;

use App\Filament\Resources\LeadResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use App\Models\Lead;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Resources\Components\Tab;

class ListLeads extends ListRecords
{
    protected static string $resource = LeadResource::class;

    // protected function getTableQuery(): Builder
    // {
    //     return Lead::query();
    // }

    public function getTabs(): array
    {
        return [
            'all' => Tab::make('All Leads'),
            'active' => Tab::make('Open - Uncontacted')
                            ->badge(Lead::query()->where('status', true)->count())
                            ->modifyQueryUsing(fn (Builder $query) => $query->where('status', true)),

            'inactive' => Tab::make('Open - Contacted')
                ->badge(Lead::query()->where('status', false)->count())
                ->modifyQueryUsing(fn (Builder $query) => $query->where('status', false)),
        ];
    }

    protected function getTableQuery(): Builder
    {
        // dd('===' );

        $user = Auth::user();

        $query = parent::getTableQuery();

        if (!hasPermission('lead-all')) {
            // Assuming 'assignees' is a relationship method on the Order model
            $query->whereHas('assignees', function ($query) use ($user) {
                $query->where('user_id', $user->id);
            });
        }
        return $query->orderBy('id','DESC');
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }


    protected function mutateFormDataBeforeSave(array $data): array
    {
        $assignees = $data['assignees'] ?? [];
        unset($data['assignees']);

        $lead = $this->record;
        $lead->update($data);
        $lead->assignees()->sync($assignees);

        return $data;
    }
}
