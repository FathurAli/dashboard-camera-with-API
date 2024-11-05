@extends('backend.layouts.master')
@section('title', 'Dashboard Lajur')
@section('content')
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .card-panel {
        margin: 15px;
    }
    .card-body {
        padding: 10px;
    }
    .chart {
        width: 100%;
        height: 300px;
        background-color: #f0f0f0;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #888;
    }
    .cardimg {
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        cursor: pointer;
        transition: box-shadow 0.3s, transform 0.3s;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .cardimg:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        transform: translateY(-5px);
    }
    .cardimg-image {
        width: 100%;
        height: 250px;
        border-bottom: 1px solid #ddd;
    }
    .cardimg-content {
        padding: 16px;
    }
    .cardimg-title {
        margin: 0;
        font-size: 1.2em;
    }
    .cardimg-description {
        margin-top: 8px;
        color: #555;
    }
    .popup {
        display: none;
        position: fixed;
        z-index: 9999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.8);
    }
    .popup-content {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 600px;
        text-align: center;
        position: relative;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .close {
        position: absolute;
        top: 10px;
        right: 25px;
        color: #aaa;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }
    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
    .popup-image {
        width: 100%;
        height: auto;
        margin-bottom: 20px;
    }
    .popup-title {
        margin: 0;
        font-size: 1.5em;
    }
</style>

<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-monitor icon-gradient bg-mean-fruit"></i>
            </div>
            <div>
                <b>{{ $titlelajur }}</b>
            </div>
        </div>
    </div>
</div>
<div class="col-md-12">
    <form id="filterForm" action="javascript:void(0);" method="get" accept-charset="utf-8" class="needs-validation" novalidate>
        @csrf
        <div class="main-card mb-5 card">
            <div class="card-body">
                <input type="text" name="id_titiklajur" value="{{ $id_titiklajur }}" style="display: none;">
                <div class="form-row">
                    <div class="col-md-4">
                        <div class="form-group d-flex align-items-center">
                            <label for="start_date" class="col-md-5" style="font-weight: bold;">Start Date</label>
                            <input type="date" class="col-md-7 form-control" id="start_date" name="start_date" value="{{ $startDate }}" placeholder="">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group d-flex align-items-center">
                            <label for="end_date" class="col-md-5" style="font-weight: bold;">End Date</label>
                            <input type="date" class="col-md-7 form-control" id="end_date" name="end_date" value="{{ $endDate }}" placeholder="">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group d-flex align-items-center">
                            <label for="shift" class="col-md-3" style="font-weight: bold;">Shift</label>
                            <select name="shift" id="shift" class="col-md-8 form-control" style="width: 100%;" placeholder="">
                                <option value="">Selected</option>
                                <option value="All" <?php if($shift == "All"){ ?> selected="true" <?php } ?>>All</option>
                                <option value="shift 1" <?php if($shift == "shift 1"){ ?> selected="true" <?php } ?> >1</option>
                                <option value="shift 2" <?php if($shift == "shift 2"){ ?> selected="true" <?php } ?> >2</option>
                                <option value="shift 3" <?php if($shift == "shift 3"){ ?> selected="true" <?php } ?> >3</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group col-md-2 offset-sm-2" style="margin-left: 12.7%;">
                    <button type="submit" class="btn btn-primary button-submit" data-loading-text="Loading...">
                        <span class="fa fa-search fa-fw"></span> Search
                    </button>
                    <button type="button" class="btn btn-danger" onclick="window.location.href='/admin/dashboard';">
                        <span class="fa fa-arrow-left fa-fw"></span> Back
                    </button>
                </div>
            </div>
        </div>
    </form>

    <div id="eventWorkersContainer" class="main-card mb-5 card">
        <div class="card-body" id="eventWorkersContent">
            @include('backend.admin.dashboard.filterlajurdetail', ['eventWorkers' => $eventWorkers])
        </div>
        <div class="d-flex justify-content-center" id="paginationLinks">
            {{ $eventWorkers->links('pagination::bootstrap-4') }}
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function openPopup(popupId) {
        document.getElementById(popupId).style.display = "block";
    }

    function closePopup(popupId) {
        document.getElementById(popupId).style.display = "none";
    }

    $(document).ready(function() {
    $('#filterForm').on('submit', function(event) {
        event.preventDefault();
        var formData = $(this).serialize();
        loadData(formData);
    });

    function loadData(formData) {
        $.ajax({
            url: "{{ route('admin.filterdashboardlajur') }}",
            type: 'GET',
            data: formData,
            beforeSend: function() {
                // Optional: show a loading indicator
                $('.button-submit').attr('data-loading-text', 'Loading...').button('loading');
            },
            success: function(response) {
                $('#eventWorkersContent').html(response.html);
                $('#paginationLinks').html(response.pagination);
                initPaginationLinks();
            },
            complete: function() {
                // Hide the loading indicator
                $('.button-submit').button('reset');
            }
        });
    }

    function initPaginationLinks() {
        $('#paginationLinks .pagination a').on('click', function(event) {
            event.preventDefault();
            var page = $(this).attr('href').split('page=')[1];
            var formData = $('#filterForm').serialize() + '&page=' + page;
            loadData(formData);
        });
    }

    initPaginationLinks();
});

</script>
@endsection
