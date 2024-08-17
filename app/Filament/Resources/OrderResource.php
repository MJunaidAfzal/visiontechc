<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Order;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Checkbox;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use App\OrderStatus;
use Filament\Tables\Filters\SelectFilter;
use App\Filament\Resources\OrderResource\Actions\ZipDownloadAction;


use Parallax\FilamentComments\Tables\Actions\CommentsAction;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-check';
    protected static ?string $navigationGroup = 'Order Management';

    protected function getTableQuery(): Builder
    {
        $user = Auth::user();

        $query = parent::getTableQuery();

        if (!hasPermission('order-all')) {
            // Assuming 'assignees' is a relationship method on the Order model
            $query->whereHas('assignees', function ($query) use ($user) {
                $query->where('user_id', $user->id);
            });
        }
        dd($query ,$query->get() );
        return $query;
    }

    public static function canViewAny(): bool
    {
        return hasPermission('order-list') ?? hasPermission('order-all');
    }

    public static function canCreate(): bool
    {
        return hasPermission('order-create');
    }

    public static function canEdit($record): bool
    {
        return hasPermission('order-edit');
    }

    public static function canDelete($record): bool
    {
        return hasPermission('order-delete');
    }


    public static function form(Form $form): Form
    {

        return $form
        ->schema([
            Forms\Components\Section::make('Order Details')
                ->schema([
                    Forms\Components\Grid::make(2)
                    //
                        ->schema([
                            Forms\Components\TextInput::make('order_number')->disabled() ,
                                // ->required(),
                            Forms\Components\DatePicker::make('deadline'),


                            Forms\Components\TextInput::make('word_count')
                                ->numeric(),

                            Forms\Components\Select::make('order_categories_id')
                                ->relationship('category', 'name')
                                ->required(),


                            Forms\Components\TextInput::make('total_amount')
                                ->numeric()
                                ->required(),




                            Forms\Components\TextInput::make('upfront')
                                ->numeric(),
                        ]),
                        Checkbox::make('priority'),

                    Forms\Components\RichEditor::make('description'),
                    Forms\Components\FileUpload::make('order_attachments')
                    ->downloadable()
                    ->multiple(),
                    Forms\Components\RichEditor::make('comment'),
                ]),

            Forms\Components\Section::make('Customer Information')
                ->schema([
                    Forms\Components\Grid::make(2)
                        ->schema([
                            Forms\Components\TextInput::make('name')
                                ->required(),
                            Forms\Components\TextInput::make('email')
                                ->email()
                                ->required(),
                            Forms\Components\TextInput::make('phone_number')
                                ->tel(),
                        ]),
                ]),

            Forms\Components\Section::make('Order Status & Payment')
                ->schema([
                    Forms\Components\Grid::make(2)
                        ->schema([
                            Forms\Components\Select::make('status')
                                ->options([
                                    '1' => 'In progress',
                                    '2' => 'Revision',
                                    '3' => 'Completed',
                                    '4' => 'Canceled',
                                ])
                                ->required(),
                            Forms\Components\Select::make('payment_method')
                                ->options([
                                    '1' => 'Paypal',
                                    '2' => 'Payooner',
                                    '3' => 'Other',
                                ])
                                ->required(),
                        ]),
                    Forms\Components\FileUpload::make('payment_receipt')
                        ->downloadable()
                        ->multiple(),
                ]),

            Forms\Components\Section::make('Assignments')
                ->schema([
                    Forms\Components\Select::make('assignees')
                        ->multiple()
                        ->relationship('assignees', 'name')
                        ->required(),
                    Forms\Components\Select::make('lead_id')
                        ->relationship('lead', 'name')
                        ->required(),
                ]),

            Forms\Components\Hidden::make('user_id')->default( Auth::id() ),

        ]);

    }



    public static function table(Table $table): Table
    {

        return $table
            ->columns([
                TextColumn::make('order_number')->sortable()->searchable(),
                // TextColumn::make('description')->limit(50),
                TextColumn::make('word_count')->sortable(),
                TextColumn::make('deadline')->formatStateUsing(fn($state) => Carbon::parse($state)->format('Y-m-d'))->sortable(),

                // Tables\Columns\TextColumn::make('days_status')
                //     ->label('Days Status')
                //     ->formatStateUsing(function ($record) {
                //         $deadline = Carbon::parse($record->deadline);
                //         $now = Carbon::now();
                //         $diffInDays = $now->diffInDays($deadline, false); // Returns negative if overdue

                //         if ($record->status == '3' || $record->status == '4') { // Completed or Cancelled
                //             return 'N/A'; // No calculation needed
                //         }

                //         if ($diffInDays > 0) {
                //             return "{$diffInDays} days left";
                //         } else {
                //             return abs($diffInDays) . ' days overdue';
                //         }
                //     }),

                // Tables\Columns\TextColumn::make('days_status')
                //     ->label('Days Status')
                //     ->formatStateUsing(function ($record) {
                //         if (empty($record->deadline)) {
                //             return 'No deadline set';
                //         }

                //         try {
                //             $deadline = Carbon::parse($record->deadline);
                //         } catch (\Exception $e) {
                //             return 'Invalid date format';
                //         }

                //         $now = Carbon::now();
                //         $diffInDays = $now->diffInDays($deadline, false); // Negative if overdue

                //         if (in_array($record->status, ['3', '4'])) { // Completed or Cancelled
                //             return 'N/A'; // Not applicable
                //         }

                //         if ($diffInDays > 0) {
                //             return "{$diffInDays} days left";
                //         } else {
                //             return abs($diffInDays) . ' days overdue';
                //         }
                //     }),


                //    ->html(), // Enable HTML rendering if needed
                // TextColumn::make('name')->sortable()->searchable(),
                // TextColumn::make('email')->sortable()->searchable(),
                // TextColumn::make('phone_number')->sortable()->searchable(),
                // TextColumn::make('user.name')->label('Created By')->sortable()->searchable(), // Add this line

                // TextColumn::make('status')->sortable()->searchable(),
                // TextColumn::make('lead.name')->label('Order Lead')->sortable()->searchable()->url(fn ($record) => route('filament.resources.leads.view', $record->lead_id))
                // ->openUrlInNewTab(),

                TextColumn::make('user_created.name')->label('Created By')->sortable()->searchable(),

                TextColumn::make('status')
                        ->label('Status')
                        // ->enum(OrderStatus::cases()) // Uses the enum labels
                        ->formatStateUsing(fn ($state) => OrderStatus::tryFrom($state)?->label() ?? '-')
                        ->colors([
                            'primary' => OrderStatus::InProgress->value,
                            'warning' => OrderStatus::Revision->value,
                            'success' => OrderStatus::Completed->value,
                            'danger'  => OrderStatus::Cancelled->value,
                        ])
                        ->sortable(),
                    // other columns...



                // TextColumn::make('payment_method')->sortable(),
                // TextColumn::make('total_amount')->sortable(),
                // TextColumn::make('upfront')->sortable(),


                //
            ])
            ->filters([
                //
                SelectFilter::make('status')
                ->label('Order Status')
                ->options([
                    OrderStatus::InProgress->value => OrderStatus::InProgress->label(),
                    OrderStatus::Revision->value => OrderStatus::Revision->label(),
                    OrderStatus::Completed->value => OrderStatus::Completed->label(),
                    OrderStatus::Cancelled->value => OrderStatus::Cancelled->label(),
                ]),
                Tables\Filters\Filter::make('deadline_range')
                    ->form([
                        Forms\Components\DatePicker::make('start_date')
                            ->label('Start Date')
                            ->required(),

                        Forms\Components\DatePicker::make('end_date')
                            ->label('End Date')
                            ->required(),
                    ])
                    ->query(fn (Builder $query, array $data) => $query->whereBetween('deadline', [
                        $data['start_date'] ?? '0000-00-00', // Adjust default value if needed
                        $data['end_date'] ?? '9999-12-31', // Adjust default value if needed
                    ])),
            ])
            ->actions([
                // Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make()->button()->slideOver(),
                Tables\Actions\EditAction::make()->button()->slideOver(),
                CommentsAction::make(),
                ZipDownloadAction::make('Download as ZIP'),
                // \App\Filament\Resources\OrderResource\Actions\ZipDownloadAction::button(),

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
            'index'  => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'view' => Pages\ViewOrder::route('/{record}'),

            // 'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }
}
