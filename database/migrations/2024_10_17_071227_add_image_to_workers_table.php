<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddImageToWorkersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Dalam file migrasi
        Schema::table('workers', function (Blueprint $table) {
            $table->string('image')->nullable(); // Tambahkan kolom image
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('workers', function (Blueprint $table) {
           if (Schema::hasColumn('workers','image')) {
            $table->dropColumn('image');
           } 
        });
    }
}
