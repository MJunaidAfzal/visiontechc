<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;
use Filament\Forms;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use App\OrderStatus;
use App\OrderPayment;

class ViewOrder extends ViewRecord
{
    protected static string $resource = OrderResource::class;

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('order_number')->label('Order Number')->formatStateUsing(fn ($state) => "<b>#{$state}</b>"),
                Tables\Columns\TextColumn::make('status')->label('Status')->formatStateUsing(fn ($state) => "<b>" . OrderStatus::tryFrom($state)?->label() ?? 'Unknown' . "</b>"),
                Tables\Columns\TextColumn::make('deadline')->label('Deadline')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
            ])
            ->columns([
                Tables\Columns\TextColumn::make('word_count')->label('Word Count')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
                Tables\Columns\TextColumn::make('category.name')->label('Order Category')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
                Tables\Columns\ImageColumn::make('order_attachments')->label('Order Attachments'),
            ])
            ->columns([
                Tables\Columns\TextColumn::make('total_amount')->label('Total Amount')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
                Tables\Columns\TextColumn::make('upfront')->label('Upfront')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
            ])
            ->columns([
                Tables\Columns\TextColumn::make('description')->label('Description')->formatStateUsing(fn ($state) => "<b>" . strip_tags($state) . "</b>"),
                Tables\Columns\TextColumn::make('comment')->label('Comment')->formatStateUsing(fn ($state) => "<b>" . strip_tags($state) . "</b>"),
            ])
            ->columns([
                Tables\Columns\TextColumn::make('name')->label('Name')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
                Tables\Columns\TextColumn::make('email')->label('Email')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
                Tables\Columns\TextColumn::make('phone_number')->label('Phone Number')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
            ])
            ->columns([
                Tables\Columns\TextColumn::make('status')->label('Status')->formatStateUsing(fn ($state) => "<b>" . OrderStatus::tryFrom($state)?->label() ?? 'Unknown' . "</b>"),
                Tables\Columns\TextColumn::make('payment_method')->label('Payment Method')->formatStateUsing(fn ($state) => "<b>" . OrderPayment::tryFrom($state)?->label() ?? 'Unknown' . "</b>"),
                Tables\Columns\TextColumn::make('payment_receipt')->label('Payment Receipt')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
            ])
            ->columns([
                Tables\Columns\TextColumn::make('assignees.name')->label('Assignees')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
                Tables\Columns\TextColumn::make('lead.name')->label('Lead')->formatStateUsing(fn ($state) => "<b>{$state}</b>"),
            ]);
    }
}
