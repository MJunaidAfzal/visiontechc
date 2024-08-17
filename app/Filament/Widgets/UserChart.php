<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;

class UserChart extends ChartWidget
{
    protected static ?string $heading = 'Leads Chart';

    protected function getData(): array
    {
        return [
            'datasets' => [
                [
                    'label' => 'Sales Generated each month',
                    'data' => [0, 10, 5, 2, 21, 32, 45, 74, 65, 45, 77, 89],
                    'backgroundColor' => 'rgb(74 222 128)',
                    'borderColor' => 'rgb(74 222 128)',
                ],
            ],
            'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
