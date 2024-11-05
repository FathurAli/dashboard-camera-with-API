<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class EventWorker extends Model
{
    use HasFactory;
    protected $table = 'event_workers';

    public static function grupByActivityName()
    {
        return self::select('activity_name', DB::raw('count(*) as total'))
                    ->groupBy('activity_name')
                    ->get();
    }
}
