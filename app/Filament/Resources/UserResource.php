<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;

use Filament\Tables\Columns\TextColumn;
class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-users';
    protected static ?string $navigationGroup = 'User Management';

    public static function canViewAny(): bool
    {
        return hasPermission('manage-users');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                TextInput::make('name')->required(),
                TextInput::make('email')->required(),

                // Conditionally show the password field only on create
                Forms\Components\TextInput::make('password')
                    ->password()
                    ->required(fn ($context) => $context === 'create')
                    ->visible(fn ($context) => $context === 'create'),

                // Add a separate password update section for edit
                Forms\Components\Fieldset::make('Update Password')
                    ->schema([
                        Forms\Components\TextInput::make('new_password')
                            ->password()
                            ->label('New Password')
                            ->nullable(),
                    ])
                    ->visible(fn ($context) => $context === 'edit'),

                Select::make('roles')
                    ->multiple()
                    ->relationship('roles', 'name')
                    ->preload(),
                //

                Forms\Components\TextInput::make('last_login_at')
                    ->label('Last Login At')
                    ->disabled(),
                Forms\Components\TextInput::make('last_login_ip')
                    ->label('Last Login IP')
                    ->disabled(),
                Forms\Components\TextInput::make('last_login_location')
                    ->label('Last Login Location')
                    ->disabled(),
                Forms\Components\TextInput::make('last_login_browser')
                    ->label('Last Login Browser')
                    ->disabled(),
            ]);
    }

    public static function beforeSave($record, array $data): void
    {
        // Handle password only if it is being set (for both create and update)
        if (isset($data['password'])) {
            $record->password = Hash::make($data['password']);
        } elseif (isset($data['new_password']) && !empty($data['new_password'])) {
            $record->password = Hash::make($data['new_password']);
        }
    }


    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                TextColumn::make('id')->sortable(),
                TextColumn::make('name')->sortable()->searchable(),
                TextColumn::make('email')->sortable()->searchable(),
                TextColumn::make('roles_count')
                    ->counts('roles')
                    ->label('Roles Count'),

                // TextColumn::make('name'),
                // TextColumn::make('email'),
                // TextColumn::make('last_login_at')
                //         ->label('Last Login At'),
                // TextColumn::make('last_login_ip')
                //         ->label('Last Login IP'),
                // TextColumn::make('last_login_location')
                //         ->label('Last Login Location'),
                // TextColumn::make('last_login_browser')
                //         ->label('Last Login Browser'),
                //
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make()->slideOver(),

                Tables\Actions\EditAction::make()->slideOver(),
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
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            // 'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
