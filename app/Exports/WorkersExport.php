<?php

namespace App\Exports;

use App\Models\worker;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
class WorkersExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return worker::select('id','name')->get(); // Mengambil semua data worker
    }

  

    public function headings():array
    {
        return[
            'id',
            'Nama User'
        ];
    }
}

