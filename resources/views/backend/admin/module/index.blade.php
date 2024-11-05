@extends('backend.layouts.master')
@section('title', 'Module')
@section('content')
<style>
    @media screen and (min-width: 768px) {
        #myModal .modal-dialog {
            width: 70%;
            border-radius: 5px;
        }
    }
</style>
    <div class="app-page-title">
        <div class="page-title-wrapper">
            <div class="page-title-heading">
                <div class="page-title-icon">
                    <i class="pe-7s-users icon-gradient bg-mean-fruit"> </i>
                </div>
                <div>All Module</div>
                <div class="d-inline-block ml-2">
                    {{-- @can('Module-create') --}}
                        <button class="btn btn-success" onclick="create()"><i
                                class="glyphicon glyphicon-plus"></i>
                                New Module
                        </button>
                    {{-- @endcan --}}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="main-card mb-3 card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="Module-table" class="align-middle mb-0 table table-borderless table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Perusahaan</th>
                                    {{-- <th>Clinet</th>
                                    <th>Module</th>
                                    <th>No SPK</th>
                                    <th>Status</th> --}}
                                    <th>Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <script>
        $(function () {
            table = $('#Module-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route("admin.allModule") }}',
                },
                columns: [
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    {data: 'id_parent', name: 'id_parent'},
                    // {data: 'client_name', name: 'client_name'},
                    // {data: 'nama_Module', name: 'nama_Module'},
                    // {data: 'no_spk', name: 'no_spk'},
                    // {data: 'status', name: 'status'},
                    {data: 'action', name: 'action'}
                ],
                columnDefs: [
                    {className: "", targets: "_all"}
                ],
                autoWidth: false,
            }); 


            $('.dataTables_filter input[type="search"]').attr('placeholder', 'Type here to search...').css({
                'width': '220px',
                'height': '30px'
            });
        });
     
    </script>
    <script type="text/javascript">
        function create() {
            ajax_submit_create('module');
        }


        $(document).ready(function () {
            // View Form
            $("#Module-table").on("click", ".view", function () {
                var id = $(this).data('id');
                ajax_submit_view('module', id)
            });

            $("#Module-table").on("click", ".edit", function () {
                var id = $(this).data('id');
                ajax_submit_edit('module', id);
            });



            // Delete
            $("#Module-table").on("click", ".delete", function (event) {
                event.preventDefault();
                var id = $(this).data('id');
                ajax_submit_delete('module', id)
            });

        });

    </script>
@stop
