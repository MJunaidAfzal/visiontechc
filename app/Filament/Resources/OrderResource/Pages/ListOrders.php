<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use App\Models\Order;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Resources\Components\Tab;

class ListOrders extends ListRecords
{
    protected static string $resource = OrderResource::class;

    public function getTabs(): array
    {
        return [
            'all' => Tab::make('All Orders'),
            'In progress' => Tab::make('In progress')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('status', 1)),
            'Revision' => Tab::make('Revision')
                ->badge(Order::query()->where('status', 2)->count())

                ->modifyQueryUsing(fn (Builder $query) => $query->where('status', 2)),

            'Completed' => Tab::make('Completed')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('status', 3)),
            'Canceled' => Tab::make('Canceled')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('status', 4)),

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
}
