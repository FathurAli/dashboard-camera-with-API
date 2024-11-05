<?php

namespace App\Helpers;

use App\Models\Menu;
use App\Models\Admin;
use App\Models\Operator_menu;
use App\Models\Operator_level;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;



class MenuHelper
{

	public static function get_parent_menus()
	{
		$menuIds = Operator_menu::where('operator_level_id', auth()->user()->access_level)->pluck('menu_id');

		$parentMenus = Menu::whereIn('id', $menuIds)->whereNull('parent_id')->get();

		return $parentMenus;
	}

	public static function get_child_menus()
	{
		$menuIds = Operator_menu::where('operator_level_id', auth()->user()->access_level)->pluck('menu_id');

		$childMenus = Menu::whereIn('id', $menuIds)->whereNotNull('parent_id')->get();

		return $childMenus;
	}

	public static function get_active_parent($link)
	{
		return Menu::where("link", $link)->first();
	}

	public static function get_permission($url)
	{
		$level = auth()->user()->access_level;
		$segments = explode('.', $url);
		$numSegments = count($segments);
		if ($numSegments > 2) {
			$segments = array_slice($segments, 0, 2);
		}
		$newUrl = implode('.', $segments);


		$level_scope = Operator_menu::join('menus', 'operator_menu.menu_id', '=', 'menus.id')
		->join('operator_level', 'operator_menu.operator_level_id', '=', 'operator_level.id')
		->where('operator_level_id', $level)
		->where('link', 'LIKE',  $newUrl . '%')
		->get();

		$level_name = Admin::join('operator_level', 'admins.access_level', '=', 'operator_level.id')
		->where('admins.access_level', (int) $level)
		->get();


		// if ($level_scope->count()<1) {
		// 	if($newUrl != '/dashboard'){
		// 		abort(403, 'Anda tidak memiliki izin untuk mengakses halaman ini.');
		// 	}
		// }

		return($level_name[0]['level']);


	}

}

