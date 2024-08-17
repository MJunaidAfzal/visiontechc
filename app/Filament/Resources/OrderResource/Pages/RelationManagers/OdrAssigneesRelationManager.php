<?php
// namespace App\Filament\Resources\OrderResource\RelationManagers;

// use Filament\Forms;
// use Filament\Resources\RelationManager;
// use Filament\Resources\Form;
// use Filament\Resources\Table;
// use Filament\Tables;

// class OdrAssigneesRelationManager extends RelationManager
// {
//     protected static string $relationship = 'odr_assignees';

//     public static function form(Form $form): Form
//     {
//         return $form
//             ->schema([
//                 Forms\Components\Select::make('user_id')
//                     ->relationship('user', 'name')
//                     ->required(),
//             ]);
//     }

//     public static function table(Table $table): Table
//     {
//         return $table
//             ->columns([
//                 Tables\Columns\TextColumn::make('user.name')->label('Assignee'),
//             ])
//             ->filters([
//                 //
//             ])
//             ->headerActions([
//                 Tables\Actions\CreateAction::make(),
//             ])
//             ->actions([
//                 Tables\Actions\EditAction::make(),
//                 Tables\Actions\DeleteAction::make(),
//             ])
//             ->bulkActions([
//                 Tables\Actions\DeleteBulkAction::make(),
//             ]);
//     }
// }
