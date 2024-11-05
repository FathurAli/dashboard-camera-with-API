<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Event;

class Bast extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_pertama',
        'jabatan_pertama',
        'nama_kedua',
        'jabatan_kedua',
        'nobast',
        'tgl_bast',
        'bast_pembayaran',
        'bast_keterangan',
        'id_pekerjaan',
        'status_tagihan',
        'autonumber',
        'tanggal_gen',
        'noinv_gen',
        'nokwi_gen'
    ];
    protected $dispatchesEvents = [
    'created' => \App\Events\PekerjaanCreated::class,
    ];
}
