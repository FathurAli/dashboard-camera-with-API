<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dashboard extends Model
{
    public static function konversi($angka)
{
    // Array kosong untuk penyimpanan terbilang
    $terbilang = [];

    // Daftar angka dalam bahasa Indonesia
    $angkaTerbilang = [
        '', 'satu', 'dua', 'tiga', 'empat', 'lima', 'enam', 'tujuh', 'delapan', 'sembilan', 'sepuluh',
        'sebelas', 'dua belas', 'tiga belas', 'empat belas', 'lima belas', 'enam belas', 'tujuh belas', 
        'delapan belas', 'sembilan belas'
    ];

    // Konversi angka ke terbilang
    if ($angka < 20) {
        $terbilang[] = $angkaTerbilang[$angka];
    } elseif ($angka < 100) {
        $terbilang[] = $angkaTerbilang[floor($angka / 10)] . ' puluh';
        $terbilang[] = $angkaTerbilang[$angka % 10];
    } elseif ($angka < 200) {
        $terbilang[] = 'seratus';
        $terbilang[] = Dashboard::konversi($angka - 100);
    } elseif ($angka < 1000) {
        $terbilang[] = $angkaTerbilang[floor($angka / 100)] . ' ratus';
        $terbilang[] = Dashboard::konversi($angka % 100);
    } elseif ($angka < 2000) {
        $terbilang[] = 'seribu';
        $terbilang[] = Dashboard::konversi($angka - 1000);
    } elseif ($angka < 1000000) {
        $terbilang[] = Dashboard::konversi(floor($angka / 1000)) . ' ribu';
        $terbilang[] = Dashboard::konversi($angka % 1000);
    } elseif ($angka < 1000000000) {
        $terbilang[] = Dashboard::konversi(floor($angka / 1000000)) . ' juta';
        $terbilang[] = Dashboard::konversi($angka % 1000000);
    } else {
        $terbilang[] = 'Angka terlalu besar';
    }

    // Menggabungkan elemen array menjadi satu string
    return implode(' ', array_filter($terbilang));
}

}
