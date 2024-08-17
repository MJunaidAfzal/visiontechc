<?php

// app/Filament/Resources/OrderResource/Actions/ZipDownloadAction.php

namespace App\Filament\Resources\OrderResource\Actions;

use Filament\Tables\Actions\Action;
use Illuminate\Support\Facades\Storage;
use Filament\Actions\StaticAction;
use ZipArchive;
use App\Models\Order;
use Illuminate\Contracts\View\View;

class ZipDownloadAction extends StaticAction
{
    public static function make(): Action
    {
        return $this->button('Download as ZIP')
            ->icon('heroicon-o-download')
            ->color('success');
    }



    public function handle(Order $record): \Symfony\Component\HttpFoundation\BinaryFileResponse
    {
        $public_dir = public_path() . DIRECTORY_SEPARATOR . 'uploads/order/zip';
        $file_path = public_path() . DIRECTORY_SEPARATOR . 'uploads/order';
        $zipFileName = $record->name . '.zip';

        $zip = new ZipArchive();
        if ($zip->open($public_dir . DIRECTORY_SEPARATOR . $zipFileName, ZipArchive::CREATE) === TRUE) {
            foreach ($record->orders as $orders) {
                $zip->addFile($file_path . '/' . $orders->order_attachments, $orders->order_attachments);
            }
            $zip->close();
        }

        $headers = [
            'Content-Type' => 'application/octet-stream',
        ];
        $filetopath = $public_dir . '/' . $zipFileName;

        if (file_exists($filetopath)) {
            return response()->download($filetopath, $zipFileName, $headers);
        }

        return redirect()->back();
    }
}
