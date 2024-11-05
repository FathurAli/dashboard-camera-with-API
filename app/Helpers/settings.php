<?php

namespace App\Helpers;

if (!function_exists('Settings')) {
    function Settings($key, $default = null) {
        return config('settings.'.$key, $default);
    }
}
