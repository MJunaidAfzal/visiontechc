<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderCategoriesResource\Pages;
use App\Filament\Resources\OrderCategoriesResource\RelationManagers;
use App\Models\OrderCategories;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Columns\TextColumn;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;

class OrderCategoriesResource extends Resource
{
    protected static ?string $model = OrderCategories::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Order Management';

    public static function canViewAny(): bool
    {
        return hasPermission('manage-order-categories');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('name')->required(),
                Select::make('status')->label('Status')->required()
                ->options([
                    '1' => 'Active',
                    '0' => 'Un-active',
                ])->default('1'),


                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
                Tables\Columns\TextColumn::make('name')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('status')->label('Status')
                ->colors([
                    'success' => 1,
                    'danger' => 0,
                ])->formatStateUsing(fn ($state) => $state ? 'Active' : 'Inactive'),

            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrderCategories::route('/'),
            'create' => Pages\CreateOrderCategories::route('/create'),
            'edit' => Pages\EditOrderCategories::route('/{record}/edit'),
        ];
    }
}
