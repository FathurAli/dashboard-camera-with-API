<?php

namespace App\Listeners;

use App\Events\InvoiceCreated;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class GenerateAutoNumber
{
    public function handle($event)
    {
        $model = $event->getModel(); // Mendapatkan model yang akan digunakan
        $latestRecord = $model::latest()->first(); // Mendapatkan record terakhir dari model
        $nextNumber = $latestRecord ? $latestRecord->id + 1 : 1; // Menghasilkan nomor berikutnya
        
        // Set nomor otomatis ke model
        $model->no_spk = $nextNumber;
    }
}