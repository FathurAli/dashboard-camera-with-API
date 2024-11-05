@extends('backend.layouts.master')
@section('title', 'All Modules')
@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-study icon-gradient bg-mean-fruit"></i>
            </div>
            <div>All Modules</div>
            <div class="d-inline-block ml-2">
                {{-- Tombol untuk menambah modul --}}
                <button class="btn btn-success" onclick="createModule()">
                    <i class="glyphicon glyphicon-plus"></i> New Module
                </button>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="main-card mb-3 card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="manage_modules"
                           class="align-middle mb-0 table table-borderless table-striped table-hover">
                        <thead>
                            <tr>
                                <th>id_Module</th>
                                <th>id_parent</th>
                                <th>name_module</th>
                                <th>name_controller</th>
                                <th>sort</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    @media screen and (min-width: 768px) {
        #myModal .modal-dialog {
            width: 85%;
            border-radius: 5px;
        }
    }
</style>
<script>
    $(function () {
            var table = $('#manage_modules').DataTable({
                processing: true,
                serverSide: true,
                ajax: '/admin/allmodule',
                columns: [
                    { data: 'DT_RowIndex', name: 'DT_RowIndex' },
                    { data: 'id_module', name: 'id_module' },
                    { data: 'id_parent', name: 'id_parent' },
                    { data: 'name_module', name: 'name_module' },
                    { data: 'name_controller', name: 'name_controller' },
                    { data: 'sort', name: 'sort' },
                   
                    { data: 'action', name: 'action' }
                ],
                columnDefs: [
                    { className: "", targets: "_all" }
                ],
                autoWidth: false,
            });

            $('.dataTables_filter input[type="search"]').attr('placeholder', 'Type here to search...').css({
                'width': '220px',
                'height': '30px'
            });
        });

    // Fungsi untuk menampilkan form tambah modul
    function createModule() {
        ajax_submit_create('module');
    }

    // Fungsi untuk menampilkan form edit modul
    $(document).ready(function () {
        $("#manage_modules").on("click", ".edit", function () {
            var id_module = $(this).data('id_module');
            ajax_submit_edit('module', id_module);
        });


        // Fungsi untuk menghapus modul
        $("#manage_modules").on("click", ".delete", function () {
            var id = $(this).data('id');
            ajax_submit_delete('module', id);
        });
    });

</script>
@stop
