{{-- 

<div class="app-sidebar sidebar-shadow">
    <div class="app-header__logo">
        <div class="header__pane ml-auto">
            <div>
                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
                        data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                </button>
            </div>
        </div>
    </div>
    <div class="app-header__mobile-menu">
        <div>
            <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
            </button>
        </div>
    </div>
    <div class="app-header__menu">
                        <span>
                            <button type="button"
                                    class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
    </div>
    <div class="scrollbar-sidebar" style="background-color: rgb(10, 184, 243)" >
        <div class="app-sidebar__inner">
            <ul class="vertical-nav-menu mt-4">
                @if (session('alert'))
                <script>
                    alert("{{ session('alert-permission') }}");
                </script>
            @endif

            <?php
            $aside_current_route = Route::current()->getName();
            $aside_parent_menus = \App\Helpers\MenuHelper::get_parent_menus();
            $aside_child_menus = \App\Helpers\MenuHelper::get_child_menus();
            $get_permission = \App\Helpers\MenuHelper::get_permission($aside_current_route);
            $aside_active_parent = \App\Helpers\MenuHelper::get_active_parent($aside_current_route);
            $aside_active_parent_parent_id = $aside_active_parent ? $aside_active_parent->parent_id : "";

            $aside_child_menu_filters = [];
            foreach ($aside_child_menus as $value) {
                if (!isset($aside_child_menu_filters[$value->parent_id])) {
                    $aside_child_menu_filters[$value->parent_id] = [];
                }
                $aside_child_menu_filters[$value->parent_id][] = $value;
            }
            ?>

            <ul class="menu-inner py-1">
                <li id="dashboardMenu" class="@if($aside_current_route == '/dashboard') active open @endif" >
                    <a href="{{url('/admin/dashboard')}}" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home-circle"></i>
                        <div class="text-truncate" style="color: white">Dashboard</div>
                    </a>
                </li>

                <?php foreach ($aside_parent_menus as $value): ?>
                    <li id="menu-{{ $value->id }}" class="@if($value->id == $aside_active_parent_parent_id) active open @endif" style="color: white">
                        <a @if($value->link) href="{{ url($value->link) }}" @else href="javascript:void(0)" @endif class="menu-link @if(isset($aside_child_menu_filters[$value->id])) menu-toggle @endif" style="color: white">
                            <i class="{{ $value->icon_class }}"></i>
                            <div data-i18n="User interface" style="color: white">{{ $value->title }}</div>
                        </a>
                        <ul class="menu-sub" style="color: white">
                            <?php foreach ($aside_child_menu_filters[$value->id] as $value_2): ?>
                                @if($value_2->title != 'Item Release' && $value_2->title != 'Item Purchasing')
                                    <li id="menu-{{ $value_2->id }}" class="@if($aside_current_route == $value_2->link) active @endif">
                                        <a @if($value_2->link) href="{{ url($value_2->link) }}" @else href="javascript:void(0)" @endif class="menu-link">
                                            <div style="color: white">{{ $value_2->title }}</div>
                                        </a>
                                    </li>
                                @endif
                            <?php endforeach; ?>
                        </ul>
                    </li>
                <?php endforeach; ?>
            </ul>
            </ul>
        </div>
    </div>
</div> --}}


<div class="app-sidebar sidebar-shadow">
    <div class="app-header__logo">
        <div class="header__pane ml-auto">
            <div>
                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
                        data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                </button>
            </div>
        </div>
    </div>
    <div class="app-header__mobile-menu">
        <div>
            <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
            </button>
        </div>
    </div>
    <div class="app-header__menu">
                        <span>
                            <button type="button"
                                    class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
    </div>
    <div class="scrollbar-sidebar" style="background-color: rgb(10, 184, 243)" >
        <div class="app-sidebar__inner">
            <ul class="vertical-nav-menu mt-4">
                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="{{ URL :: to('/admin/dashboard') }}">
                        <i class="metismenu-icon pe-7s-rocket"></i>
                        
                        Dashboard
                    </a>
                </li>
                
                <li>
                   
                <li class="pb-2" style="font-size: 15px">    
                    <a style="color: white" href="{{ URL :: to('/admin/logActivity') }}">
                        <i class="metismenu-icon pe-7s-bookmarks"></i>
                        log
                    </a>
                </li>
                <li class="pb-2" style="font-size: 15px">    
                    <a style="color: white" href="{{ URL :: to('/admin/produktivitas') }}">
                        <i class="metismenu-icon pe-7s-bookmarks"></i>
                        Produktivitas
                    </a>
                </li>
                <li class="pb-2" style="font-size: 15px">    
                    <a style="color: white">
                        <i class="metismenu-icon pe-7s-bookmarks"></i>
                        Report
                    </a>
                    <ul>
                        <li class="pb-2" style="font-size: 15px">
                            <a style="color: white" href="{{ URL :: to('/admin/eventworkers') }}">
                                <i class="metismenu-icon pe-7s-rocket"></i>
                                Activity
                            </a>
                        </li>
                        <li>
                            <a style="color: white"  href="{{ URL :: to('/admin/report') }}">
                                <i class="metismenu-icon"></i>
                               Chart Bar
                            </a>
                        </li>
                        <li>
                            <a style="color: white" href="{{ URL :: to('/admin/report1') }}">
                                <i class="metismenu-icon"></i>
                                Line Chart
                            </a>
                        </li>
                        <li>
                            <a style="color: white" href="{{ URL :: to('/admin/report2') }}">
                                <i class="metismenu-icon"></i>
                                Pie Chart
                            </a>
                        </li>
                     
                    </ul>
                </li>
                
                
                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="#">
                        <i class="metismenu-icon pe-7s-diamond"></i>
                        Admin Settings
                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                    </a>
                    <ul>
                        <li>
                            <a style="color: white" href="{{ URL :: to('/admin/roles') }}">
                                <i class="metismenu-icon"></i>
                                Roles
                            </a>
                        </li>
                        <li>
                            <a style="color: white" href="{{ URL :: to('/admin/permissions') }}">
                                <i class="metismenu-icon"></i>
                                Permission
                            </a>
                        </li>
                        <li>
                            <a style="color: white" href="{{ URL :: to('/admin/printsetting') }}">
                                <i class="metismenu-icon"></i>
                                Print Setting
                            </a>
                        </li>
                        <li>
                            <a style="color: white" href="{{ URL :: to('/admin/settings') }}">
                                <i class="metismenu-icon pe-7s-tools"></i>
                                Settings
                            </a>
                        </li>
                        <li class="treeview">
                            <a style="color: white" href="{{ URL :: to('/admin/backups') }}">
                                <i class="metismenu-icon pe-7s-download"></i><span>Backup</span>
                            </a>
                        </li>
                    </ul>
                </li>
                {{-- <li>
                    <a href="{{ URL :: to('/admin_login/logout') }}">
                        <i class="metismenu-icon pe-7s-upload"></i>
                        Logout
                    </a>
                </li> --}}
                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="{{ URL :: to('/admin/worker') }}">
                        <i class="metismenu-icon pe-7s-rocket"></i>  
                     Data User
                    </a>
                </li>

                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="{{ URL :: to('/admin/users') }}">
                        <i class="metismenu-icon pe-7s-rocket"></i>  
                    User
                    </a>
                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="{{ URL :: to('/admin/module') }}">
                        <i class="metismenu-icon pe-7s-rocket"></i>  
                    Modul
                    </a>
                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="{{ URL :: to('/admin/groups') }}">
                        <i class="metismenu-icon pe-7s-rocket"></i>  
                    Group
                    </a>
                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="{{ URL :: to('/admin/menu') }}">
                        <i class="metismenu-icon pe-7s-rocket"></i>  
                    Menu
                    </a>
                </li>
                <li class="pb-2" style="font-size: 15px">
                    <a style="color: white" href="{{ URL :: to('/admin/note') }}">
                        <i class="metismenu-icon pe-7s-rocket"></i>  
                    Note
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- /.sidebar -->
<script type="text/javascript">
    $(document).ready(function () {
        $('.app-sidebar__inner ul li').each(function () {
            if (window.location.href.indexOf($(this).find('a:first').attr('href')) > -1) {
                $(this).closest('ul').closest('li').attr('class', 'mm-active');
                $(this).addClass('mm-active').siblings().removeClass('mm-active');
            }
        });
    });
</script>
