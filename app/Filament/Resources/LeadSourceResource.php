<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LeadSourceResource\Pages;
use App\Filament\Resources\LeadSourceResource\RelationManagers;
use App\Models\LeadSource;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\TextInput;


class LeadSourceResource extends Resource
{
    protected static ?string $model = LeadSource::class;

    protected static ?string $navigationIcon = 'heroicon-o-arrow-down-on-square-stack';
    protected static ?string $navigationGroup = 'Lead Management';

    public static function canViewAny(): bool
    {
        return hasPermission('manage-lead-sources');
    }


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('name')->required(),
                Forms\Components\Select::make('status')->label('Status')->required()
                ->options([
                    '1' => 'Active',
                    '0' => 'Un-active',
                ])
                ->default('1'),

                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')->sortable(),

                Tables\Columns\TextColumn::make('name')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('status')->label('Status')->colors([
                    'success' => 1,
                    'danger' => 0,
                ])->formatStateUsing(fn ($state) => $state ? 'Active' : 'Inactive'),
                //
                //
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
            'index' => Pages\ListLeadSources::route('/'),
            // 'create' => Pages\CreateLeadSource::route('/create'),
            // 'edit' => Pages\EditLeadSource::route('/{record}/edit'),
        ];
    }
}
