<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;

class SalesChart extends ChartWidget
{
    protected static ?string $heading = 'Sales Chart';

    protected function getData(): array
    {
        return [
            'datasets' => [
                [
                    'label' => 'Leads Generated each month',
                    'data' => [0, 10, 5, 12, 21, 32, 45, 74, 65, 45, 24, 89],
                    'backgroundColor' => 'rgb(251 191 36)',
                    'borderColor' => 'rgb(251 191 36)',
                ],
                // [
                //     'label' => 'Sales Generated each month',
                //     'data' => [1, 4, 10, 2, 7, 2, 25, 74, 5, 6, 17, 31],
                //     'backgroundColor' => 'rgb(74 222 128)',
                //     'borderColor' => 'rgb(74 222 128)',
                // ],
            ],
            'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
