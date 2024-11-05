<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;
use Laravel\Passport\HasApiTokens;

class Admin extends Authenticatable
{
   use HasApiTokens, Notifiable, HasRoles;

   /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
   protected $fillable = [
     'name', 'email', 'password',
   ];

   /**
    * The attributes that should be hidden for arrays.
    *
    * @var array
    */
   protected $hidden = [
     'password', 'remember_token',
   ];


   protected $casts = [
     'email_verified_at' => 'datetime',
   ];
   // App\Models\User.php

public function isAdmin()
{
    return $this->role === 1;
}

public function isUser()
{
    return $this->role === null; // atau kosongkan saja, tergantung representasi data Anda
}

}
