    @extends('backend.layouts.master')
    @section('title', 'User')
    @section('content')
        <div class="app-page-title">
            <div class="page-title-wrapper">
                <div class="page-title-heading">
                    <div class="page-title-icon">
                        <i class="pe-7s-users icon-gradient bg-mean-fruit"></i>
                    </div>
                    <div>All User</div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="main-card mb-5 card">
                <div class="d-flex justify-content-end mt-2">
                    <a href="{{ route('worker.export.pdf') }}" class="btn btn-xs btn-success mr-1" target="_blank"
                        title="PDF">
                        <i class="fa fa-print"></i> Export PDF
                    </a>

                    <a href="{{ route('worker.exportExcel') }}" class="btn btn-info text-white"
                        style="margin-right: 10px;">Excel</a>

                    <button class="btn btn-success" onclick="create()" style="margin-right: 20px;">
                        <i class="glyphicon glyphicon-plus"></i> New User
                    </button>

                    <button class="btn btn-success" onclick="ajax_submit_data()" style="margin-right: 20px;">
                        <i class="glyphicon glyphicon-plus"></i> Import
                    </button>

                    <a href="{{ url('/download/template') }}" class="btn btn-primary">Download Template</a>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table id="User-table" class="align-middle mb-0 table table-borderless table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Nama User</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Data akan dimasukkan di sini -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <style>
            @media screen and (min-width: 768px) {
                #myModal .modal-dialog {
                    width: 80%;
                    border-radius: 5px;
                }
            }
        </style>

        <script>
            $(function() {
                table = $('#User-table').DataTable({
                    processing: true,
                    serverSide: true,
                    ajax: '/admin/allworkers',
                    columns: [{
                            data: 'id',
                            name: 'id'
                        },
                        {
                            data: 'image',
                            name: 'image',
                            render: function(data) {
                                return data ? '<img src="/images/' + data +
                                    '" alt="User Image" style="width: 50px; height: 50px; border-radius: 50%;">' :
                                    'No Image';
                            }
                        },
                        {
                            data: 'name',
                            name: 'name'
                        },
                        {
                            data: 'action',
                            name: 'action'
                        }
                    ],
                    columnDefs: [{
                        className: "",
                        targets: "_all"
                    }],
                    autoWidth: false,
                });

                $('.dataTables_filter input[type="search"]').attr('placeholder', 'Type here to search...').css({
                    'width': '220px',
                    'height': '30px'
                });
            });

            function create() {
                ajax_submit_create('worker');
            }

            $(document).ready(function() {
                // Edit Form
                $("#User-table").on("click", ".edit", function() {
                    var id = $(this).data('id');
                    ajax_submit_edit('worker', id);
                });

                // Delete
                $("#User-table").on("click", ".delete", function(event) {
                    event.preventDefault();
                    var id = $(this).data('id');
                    console.log(id); // tambahkan ini untuk cek id yang dikirim
                    ajax_submit_delete('worker', id);
                });

            });

            function ajax_submit_store(route) {
                var form = $('#create')[0];
                var formData = new FormData(form);

                $.ajax({
                    type: 'POST',
                    url: route,
                    data: formData,
                    processData: false, // Important!
                    contentType: false, // Important!
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },

                    success: function(response) {
                        if (response.type === 'success') {
                            alert(response.message);
                            table.ajax.reload(); // Reload DataTable
                            $('#myModal').modal('hide');
                        }
                    },
                    error: function(xhr) {
                        console.log(xhr);
                        if (xhr.status === 422) {
                            var errors = xhr.responseJSON.message;
                            alert(errors);
                        } else {
                            alert('Error saving data. Please try again.');
                        }
                    }
                });
            }
        </script>
    @stop
