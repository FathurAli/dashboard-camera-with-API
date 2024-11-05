@extends('backend.layouts.master')
@section('title', 'activity')
@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-users icon-gradient bg-mean-fruit"> </i>
            </div>
            <div>All Activity </div>
            <div class="d-inline-block ml-2">
                {{-- @can('activity-create') --}}
                {{-- <button class="btn btn-success" onclick="create()"><i
                        class="glyphicon glyphicon-plus"></i>
                    New Activity
                </button> --}}
                {{-- @endcan --}}
            </div>
        </div>
    </div>
</div>
<div class="row mb-3">
    <div class="col-md-12">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" style="color: black" href="#">All</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" style="color: black" href="#Pembersihan">Pembersihan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" style="color: black" href="#Pembukaan Cetakan">Pembukaan Cetakan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" style="color: black" href="#Pemutaran Cetakan">Pemutaran Cetakan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" style="color: black" href="#Pengecoran Cetakan">Pengecoran Cetakan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" style="color: black" href="#Perakitan Tulangan">Perakitan Tulangan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" style="color: black" href="#Peregangan Tulangan">Peregangan Tulangan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" style="color: black" href="#Stok Rakitan Tulangan">Stok Rakitan Tulangan</a>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="main-card mb-3 card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="Eventworkers-table"
                           class="align-middle mb-0 table table-borderless table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>worker_id</th>
                            <th>event_scene_id</th>
                            <th>activity_id</th>
                            <th>activity_name</th>
                            <th>snapshot</th>
                            <th hidden>Action</th>
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
            width: 70%;
            border-radius: 5px;
        }
    }

    .cardimg-content {
        padding: 10px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: auto;
    }

    .cardimg-title {
        display: flex;
        align-items: center;
    }

    .icon {
        width: 20px;
        text-align: center;
        margin-right: 5px;
    }

    .name {
        font-size: 13px;
        font-weight: 600;
        color: #333;
    }
</style>



<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
    $(function () {
        var table = $('#Eventworkers-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ route("admin.allEventworkers") }}',
            },
            columns: [
                {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                {data: 'worker_id', name: 'worker_id'},
                {data: 'event_scene_id', name: 'event_scene_id'},
                {data: 'activity_id', name: 'activity_id'},
                {data: 'activity_name', name: 'activity_name'},
                {data: 'snapshot', name: 'snapshot', render: function(data, type, row) {
                    return `<a href="#" class="snapshot-link" data-src="/event_workers/${data}" 
                             data-worker-id="${row.worker_id}" 
                             data-activity-name="${row.activity_name}" 
                             data-timestamp="${row.timestamp}">
                             ${data}</a>`;
                }},
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

        // Handle click event on snapshot link
        $('#Eventworkers-table').on('click', '.snapshot-link', function(e) {
            e.preventDefault();

            var imgSrc = $(this).data('src');
            var workerId = $(this).data('worker-id');
            var activityName = $(this).data('activity-name');
            var timestamp = $(this).data('timestamp');

            // Populate the modal with data
            $('#snapshotImage').attr('src', imgSrc);
            $('#modalWorkerId').text(workerId);
            $('#modalActivityStatus').text(formatActivityStatus(activityName));
            $('#modalActivityName').text(activityName);
            $('#modalActivityDate').text(formatDate(timestamp));
            $('#modalActivityTime').text(formatTime(timestamp));
            
            // Show the modal
            $('#snapshotModal').modal('show');
        });

        function formatActivityStatus(activityName) {
            if (activityName === "Unknown") {
                return "Unknown";
            } else if (activityName === "Tidak Bekerja") {
                return "Non-Produktif";
            } else {
                return "Produktif";
            }
        }

        function formatDate(timestamp) {
            return moment(timestamp).add(7, 'hours').format('DD-MM-YYYY');
        }

        function formatTime(timestamp) {
            return moment(timestamp).add(7, 'hours').format('HH:mm:ss');
        }

        // Handle filter button click event
        $('.nav-link').on('click', function () {
            var activityName = $(this).text().trim();

            if (activityName === 'All') {
                table.search('').columns().search('').draw(); // Clear all filters if "All" is clicked
            } else {
                table.column(4).search(activityName).draw(); // Filter based on activity name if not
            }
        });
    });
</script>
@stop

<div class="modal fade mt-5" id="snapshotModal" tabindex="-1" role="dialog" aria-labelledby="snapshotModalLabel" aria-hidden="true" style="width: 25%; margin-left: 40%;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="snapshotModalLabel">Snapshot</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <center>
                    <img id="snapshotImage" src="" alt="Snapshot" class="img-fluid" style="width: 250px; height: 250px; border-radius: 8px">
                </center>
                <div class="cardimg-content">
                    <div class="cardimg-title">
                        <span class="icon"><i class="fa fa-user"></i></span>
                        <span class="name" >Worker</span>
                    </div>
                    <div class="cardimg-title">
                        <span class="icon"><i class="fa fa-cog"></i></span>
                        <span class="name" id="modalActivityStatus">Status</span>
                    </div>
                    <div class="cardimg-title">
                        <span class="icon"><i class="fa fa-map-pin"></i></span>
                        <span class="name" id="modalActivityName">Nama Aktivitas</span>
                    </div>
                    <div class="cardimg-title">
                        <span class="icon"><i class="fa fa-calendar"></i></span>
                        <span class="name" id="modalActivityDate">Tanggal</span>
                    </div>
                    <div class="cardimg-title">
                        <span class="icon"><i class="fa fa-clock-o"></i></span>
                        <span class="name" id="modalActivityTime">Jam</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>