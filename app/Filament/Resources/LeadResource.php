<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LeadResource\Pages;
use App\Filament\Resources\LeadResource\RelationManagers;
use App\Models\Lead;
use App\Models\LeadSource;
use App\Models\Client;
use Illuminate\Support\Facades\Auth;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\RichEditor;
use Filament\Tables\Columns\Layout\Panel;

use Filament\Tables\Filters\SelectFilter;


class LeadResource extends Resource
{

    protected static ?string $model = Lead::class;

    protected static ?string $navigationIcon = 'heroicon-o-users';
    protected static ?string $navigationGroup = 'Lead Management';

    // protected function getTableQuery(): Builder
    // {
    //     dd('===' );

    //     $user = Auth::user();

    //     $query = parent::getTableQuery();

    //     // if (!hasPermission('lead-all')) {
    //     //     // Assuming 'assignees' is a relationship method on the Order model
    //     //     $query->whereHas('assignees', function ($query) use ($user) {
    //     //         $query->where('user_id', $user->id);
    //     //     });
    //     // }
    //     return $query;
    // }

    public static function canViewAny(): bool
    {
        return hasPermission('lead-list') ?? hasPermission('lead-all');
    }

    public static function canCreate(): bool
    {
        return hasPermission('lead-create');
    }

    public static function canEdit($record): bool
    {
        return hasPermission('lead-edit');
    }

    public static function canDelete($record): bool
    {
        return hasPermission('lead-delete');
    }


    public static function form(Form $form): Form
    {
        return $form
            ->schema([



                TextInput::make('name')->required(),
                TextInput::make('email')->required(),
                TextInput::make('phone_number')->required(),
                TextInput::make('title'),
                RichEditor::make('description'),

                Forms\Components\Select::make('assignees')
                ->multiple()
                    ->relationship('assignees', 'name')
                    ->required(),

                TextInput::make('city'),
                TextInput::make('country'),

                Forms\Components\Select::make('status')->required()
                ->options([
                    '0' => 'Open - Contacted',
                    '1' => 'Open - Uncontacted',
                ]),

                Forms\Components\Select::make('client_id')->label('Client')
                // ->required()
                ->options(
                    Client::where('is_active','1')->get()->pluck('name','id')

                ),

                Forms\Components\Select::make('lead_source_id')->label('Lead Source')->required()
                ->options(
                    LeadSource::where('status','1')->get()->pluck('name','id')
                ),
                //
                // 'name', 'title', 'email','phone_number','city' ,'country','description' , 'client_id' , 'lead_source_id' ,'status'
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                // 'name', 'title', 'email','phone_number','city' ,'country','description' , 'client_id' , 'lead_source_id' ,'status'
                TextColumn::make('id')->sortable(),
                // ->visible(fn($record) => hasPermission('delete-customer') ),
                TextColumn::make('name')->sortable()->searchable(),

                TextColumn::make('client.name')->sortable()->searchable(),
                TextColumn::make('lead_source.name')->sortable()->searchable(),





                // TextColumn::make('email')->sortable()->searchable(),
                // TextColumn::make('phone_number')->sortable(),
                // TextColumn::make('title')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('assignees.name')->label('Assignees'),
                // TextColumn::make('description')->sortable()->searchable(),

                // TextColumn::make('city')->sortable()->searchable(),

                // TextColumn::make('country')->sortable()->searchable(),

                Tables\Columns\TextColumn::make('status')
                ->colors([
                    'success' => 1,
                    'info' => 0,
                ])->label('Status')->formatStateUsing(fn ($state) => $state ? 'Open - Uncontacted' : 'Open - Contacted'),

                //
            ])
            ->filters([
                //
                SelectFilter::make('client')
                ->label('Lead Client')
                ->relationship('client', 'name'),


                SelectFilter::make('lead_source')
                ->label('Lead Source')
                ->relationship('lead_source', 'name'),


                SelectFilter::make('status')
                ->label('Order Status')
                ->options([
                    '0' => 'Open - Contacted',
                    '1' => 'Open - Uncontacted',
                ]),
            ])
            ->actions([
                // Tables\Actions\CreateAction::make()->slideOver(),

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
            // OrdersRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListLeads::route('/'),
            'create' => Pages\CreateLead::route('/create'),
            // 'edit' => Pages\EditLead::route('/{record}/edit'),

            // 'index' => Pages\ListLeads::route('/'),
            // 'create' => Pages\CreateLead::route('/create'),
            // 'edit' => Pages\EditLead::route('/{record}/edit'),
            // 'view' => Pages\ViewLead::route('/{record}'),
        ];
    }
}
