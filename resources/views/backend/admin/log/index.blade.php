@extends('backend.layouts.master')
@section('title', 'Log')
@section('content')
    <div class="app-page-title">
        <div class="page-title-wrapper">
            <div class="page-title-heading">
                <div class="page-title-icon">
                    <i class="pe-7s-users icon-gradient bg-mean-fruit"> </i>
                </div>
                <div>Log Activity</div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="main-card mb-3 card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="Log-table"
                               class="align-middle mb-0 table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nama</th>
                                    <th>Evnt</th>
                                    <th>Description</th>
                                    <th>Aksi</th>
                                 
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
                width: 90%;
                border-radius: 5px;
            }
        }
    </style>
    <script>
        $(function () {
            var table = $('#Log-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: '/admin/alllogActivity',
                columns: [
                    { data: 'DT_RowIndex', name: 'DT_RowIndex' },
                    { data: 'log_name', name: 'log_name' },
                    { data: 'event', name: 'event' },
                    { data: 'description', name: 'description' },
                   
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
    </script>
@endsection