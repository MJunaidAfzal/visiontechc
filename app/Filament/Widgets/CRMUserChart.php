<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Models\{  User , Lead , Order };
class CRMUserChart extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            //

            Stat::make( 'Total Clients', User::count())
            ->description( 'Increase in users')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->color('success'),
            // ->chart([7, 3, 4, 5, 6, 3, 5, 33),


            Stat::make( 'Total Leads', Lead::count())
            ->description( 'Increase in users')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->color('success')
            ->chart([7, 3, 4, 5, 6, 3, 5, 33]),

            Stat::make( 'Total Orders', Order::count())
            ->description( 'Increase in users')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->color('success')
            ->chart([7, 3, 4, 5, 6, 3, 5, 33])


        ];
    }
}
