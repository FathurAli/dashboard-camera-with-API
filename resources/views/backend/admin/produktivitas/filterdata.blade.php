@extends('backend.layouts.master')

@section('title', 'Laporan Produktivitas')

@section('content')

<style>
    .table-scroll {
        position: relative;
        max-width: 1100px;
        margin: auto;
        overflow: hidden;
        border: 1px solid #000;
        width: 100%;
        transition: width 0.3s, float 0.3s;
    }

    .table-wrap {
        width: 100%;
        overflow: auto;
    }

    .table-scroll table {
        width: 1000px;
        margin: auto;
        border-collapse: separate;
        border-spacing: 0;
    }

    .table-scroll th,
    .table-scroll td {
        padding: 5px 10px;
        border: 1px solid #000;
        background: #fff;
        white-space: nowrap;
        vertical-align: top;
        text-align: center; /* Center align text in all cells */
    }

    .table-scroll thead,
    .table-scroll tfoot {
        background: #f9f9f9;
    }

    .clone {
        position: absolute;
        top: 0;
        left: 0;
        pointer-events: none;
    }

    .clone th,
    .clone td {
        visibility: hidden;
    }

    .clone td,
    .clone th {
        border-color: transparent;
    }

    .clone .fixed-side {
        border: 1px solid #000;
        background: #eee;
        visibility: visible;
        text-align: center;
        vertical-align: middle;
    }

    .clone thead,
    .clone tfoot {
        background: transparent;
    }

    #table-scroll.small {
        margin-top: 26px;
        width: 50%;
        float: left;
    }

    #table-scroll2 {
        width: 49%;
        float: right;
        display: none;
        font-size: 15px;
       
    }

    #table-scroll2.taller {
        height: auto; /* Adjust this value to make the second table taller */
    }

    .spinner-border {
        display: inline-block;
        width: 1rem;
        height: 1rem;
        vertical-align: text-bottom;
        border: .25em solid currentColor;
        border-right-color: transparent;
        border-radius: 50%;
        animation: spinner-border .75s linear infinite;
    }

    @keyframes spinner-border {
        100% {
            transform: rotate(360deg);
        }
    }

    /* Additional CSS class for smaller font size */
    .smaller-font th,
    .smaller-font td {
        font-size: 0.8em; /* Adjust as needed */
    }
    .clickable-td{
        border: 1px solid #000;
        background: #eee;
        visibility: visible;
        text-align: center;
        vertical-align: middle;
        cursor: pointer; /* Mengubah kursor menjadi pointer saat dihover */
        transition: background-color 0.3s ease; /* Efek transisi untuk perubahan warna latar belakang */
    }

    .clickable-td:hover {
        background-color: rgba(0, 0, 0, 0.1); /* Warna latar belakang yang berubah saat dihover */
    }
</style>



<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-users icon-gradient bg-mean-fruit"></i>
            </div>
            <div>Laporan Produktivitas</div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="main-card mb-5 card">
        <div class="card-body">
            <form id="searchForm" action="{{ route('admin.filterdata') }}" method="POST" class="needs-validation" novalidate>
                @csrf
                <div class="form-row">
                    <font style="font-size: 15px; color: red;">*Data Wajib Diisi</font>
                </div>
                <br>
                <div class="form-row">
                    <div class="col-md-5">
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="start_date" class="col-md-3">Start Date</label>
                                <input type="date" class="col-md-6 form-control" id="start_date" name="start_date" value="{{ $startDate }}" required>
                                <div class="invalid-feedback">
                                    Please provide a start date.
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="end_date" class="col-md-3">End Date</label>
                                <input type="date" class="col-md-6 form-control" id="end_date" name="end_date" value="{{ $endDate }}" required>
                                <div class="invalid-feedback">
                                    Please provide an end date.
                                </div>
                            </div>
                        </div>
               
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="shift" class="col-md-3">Shift</label>
                                <select name="shift" id="shift" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                                    <option value="Selected" selected disabled hidden>Selected</option>
                                    <option value="All" {{ $shift == "All" ? 'selected' : '' }}>All</option>
                                    <option value="Shift 1" {{ $shift == 'Shift 1' ? 'selected' : '' }}>Shift 1</option>
                                    <option value="Shift 2" {{ $shift == 'Shift 2' ? 'selected' : '' }}>Shift 2</option>
                                    <option value="Shift 3" {{ $shift == 'Shift 3' ? 'selected' : '' }}>Shift 3</option>
                                </select>
                            </div>
                            <span id="error_shift" class="has-error"></span>
                        </div>        
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="actifitas" class="col-md-3">Actifitas</label>
                                <select name="actifitas" id="actifitas" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                                    <option value="Selected" selected disabled hidden>Selected</option>
                                    <option value="All" {{ $actifitas == "All" ? 'selected' : '' }}>All</option>
                                    <option value="7" {{ $actifitas == "7" ? 'selected' : '' }}>Persiapan Rakitan Tulangan</option>
                                    <option value="8" {{ $actifitas == "8" ? 'selected' : '' }}>Stok Rakitan Tulangan</option>
                                    <option value="6" {{ $actifitas == "6" ? 'selected' : '' }}>Perakitan Tulangan</option>
                                    <option value="5" {{ $actifitas == "5" ? 'selected' : '' }}>Pengecoran Cetakan</option>
                                    <option value="2" {{ $actifitas == "2" ? 'selected' : '' }}>Perenggangan Tulangan</option>
                                    <option value="1" {{ $actifitas == "1" ? 'selected' : '' }}>Pemutaran Cetakan</option>
                                    <option value="4" {{ $actifitas == "4" ? 'selected' : '' }}>Pembukaan Cetakan</option>
                                </select>                                
                            </div>
                            <span id="error_actifitas" class="has-error"></span>
                        </div>
                    </div>

                    <div class="col-md-5" id="comparisonFields" style="display:none;">
                        <!-- Fields for comparison, if needed -->
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="start_date2" class="col-md-3">Start Date 2</label>
                                <input type="date" class="col-md-6 form-control" id="start_date2" name="start_date2" value="{{$startDate2}}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="end_date2" class="col-md-3">End Date 2</label>
                                <input type="date" class="col-md-6 form-control" id="end_date2" name="end_date2" value="{{$endDate2}}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="shift" class="col-md-3">Shift</label>
                                <select name="shift2" id="shift2" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                                    <option value="Selected" selected disabled hidden>Selected</option>
                                    <option value="All" {{ $shift2 == "All" ? 'selected' : '' }}>All</option>
                                    <option value="Shift 1" {{ $shift2 == 'Shift 1' ? 'selected' : '' }}>Shift 1</option>
                                    <option value="Shift 2" {{ $shift2 == 'Shift 2' ? 'selected' : '' }}>Shift 2</option>
                                    <option value="Shift 3" {{ $shift2 == 'Shift 3' ? 'selected' : '' }}>Shift 3</option>
                                </select>
                            </div>
                            <span id="error_shift" class="has-error"></span>
                        </div>        
                        <div class="form-row">
                            <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                                <label for="actifitas" class="col-md-3">Actifitas</label>
                                <select name="actifitas2" id="actifitas2" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                                    <option value="Selected" selected disabled hidden>Selected</option>
                                    <option value="All" {{ $actifitas2 == "All" ? 'selected' : '' }}>All</option>
                                    <option value="7" {{ $actifitas2 == "7" ? 'selected' : '' }}>Persiapan Rakitan Tulangan</option>
                                    <option value="8" {{ $actifitas2 == "8" ? 'selected' : '' }}>Stok Rakitan Tulangan</option>
                                    <option value="6" {{ $actifitas2 == "6" ? 'selected' : '' }}>Perakitan Tulangan</option>
                                    <option value="5" {{ $actifitas2 == "5" ? 'selected' : '' }}>Pengecoran Cetakan</option>
                                    <option value="2" {{ $actifitas2 == "2" ? 'selected' : '' }}>Perenggangan Tulangan</option>
                                    <option value="1" {{ $actifitas2 == "1" ? 'selected' : '' }}>Pemutaran Cetakan</option>
                                    <option value="4" {{ $actifitas2 == "4" ? 'selected' : '' }}>Pembukaan Cetakan</option>
                                </select>                                
                            </div>
                            <span id="error_actifitas" class="has-error"></span>
                        </div>
                    </div>

                    <input type="hidden" id="validasibandingkan" name="validasibandingkan" value="0">
                </div>

                <div class="form-group col-md-6 offset-sm-2" style="margin-left: 7.3%;">
                    <button type="submit" class="btn btn-primary button-submit" data-loading-text="Loading...">
                        <span class="fa fa-search fa-fw"></span> Search
                    </button>
                    <button type="button" class="btn btn-warning button-submit1" id="compareButton">
                        <span class="fa fa-exchange"></span> Compare
                    </button>
                </div>
            </form>
            <div class="table-scroll" id="table-scroll" style="display: none">
                <div class="table-wrap">
                        <table class="main-table table table-bordered table-striped">
                            
                            <thead>
                                <tr>
                                    <th rowspan="2" class="fixed-side">Tanggal</th>
                                    <th rowspan="2" class="fixed-side">Aktifitas</th>   
                                    {{-- <th rowspan="2" class="fixed-side">Rata-Rata</th> --}}
                        
                                    @foreach ($dates as $date)
                                        <th class="text-center">{{ $date }}</th>
                                    @endforeach
                                    {{-- @foreach ($dates2 as $date)
                                        <th class="text-center">{{ $date }}</th>
                                    @endforeach --}}
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $prevShift = '';
                                @endphp
                                @foreach ($data as $row)
                                    @php 
                                        $currentShift = $row->shift; 
                                    @endphp
                                    @if ($prevShift !== '' && $prevShift !== $currentShift)
                                        <!-- Baris untuk rata-rata -->
                                        <tr>
                                            <td class="fixed-side"></td>
                                            <td class="fixed-side" style="background-color: rgb(170, 169, 169);">{{ $averages[$prevShift]->device_number }}</td>
                                            @foreach($dates as $date)
                                                <td style="background-color: rgb(170, 169, 169); text-align: center;">
                                                    {{ isset($averages[$prevShift]->{$date}) ? $averages[$prevShift]->{$date} : '-' }}%
                                                </td>
                                            @endforeach
                                        </tr>
                                    @endif
                        
                                    @if ($prevShift !== $currentShift)
                                        <!-- Tampilkan nama shift hanya saat berganti -->
                                        <tr>
                                            <td class="fixed-side" rowspan="{{ $rowspanCount[$currentShift] }}" style="text-align: center;">{{ $currentShift }}</td>
                                            <td class="fixed-side" style="text-align: center;">
                                                @php
                                                    // Mendapatkan deskripsi aktifitas berdasarkan device_number
                                                    $device_description = '';
                                                    switch ($row->device_number) {
                                                        case 0:
                                                            $device_description = 'Persiapan Rakitan Tulangan';
                                                            break;
                                                        case 1:
                                                            $device_description = 'Stok Rakitan Tulangan';
                                                            break;
                                                        case 2:
                                                            $device_description = 'Perakitan Tulangan';
                                                            break;
                                                        case 3:
                                                            $device_description = 'Pengecoran Cetakan';
                                                            break;
                                                        case 4:
                                                            $device_description = 'Perenggangan Tulangan';
                                                            break;
                                                        case 5:
                                                            $device_description = 'Pemutaran Cetakan';
                                                            break;
                                                        case 6:
                                                            $device_description = 'Pembukaan Cetakan';
                                                            break;
                                                        default:
                                                            $device_description = 'Unknown Device Number';
                                                            break;
                                                    }
                                                @endphp
                                                {{ $device_description }}
                                            </td>
                                        @foreach ($dates as $date)
                                        <td class="clickable-td" 
                                            data-date="{{ $date }}" 
                                            data-activity="{{ $device_description }}" 
                                            data-snapshot="{{ isset($row->snapshot) ? $row->snapshot : '' }}"
                                            style="text-align:center">
                                            {{ isset($queryResults[$row->device_number][$currentShift][$date]['query4Total']) ? $queryResults[$row->device_number][$currentShift][$date]['query4Total'] : '-' }}%
                                        </td>
                                    @endforeach

                                        </tr>
                                    @else
                                        <!-- Hanya tampilkan nomor perangkat dan data untuk shift yang sama -->
                                        <tr>
                                            <td class="fixed-side" style="text-align: center;">
                                                @php
                                                    $device_description = '';
                                                    switch ($row->device_number) {
                                                        case 0:
                                                            $device_description = 'Persiapan Rakitan Tulangan';
                                                            break;
                                                        case 1:
                                                            $device_description = 'Stok Rakitan Tulangan';
                                                            break;
                                                        case 2:
                                                            $device_description = 'Perakitan Tulangan';
                                                            break;
                                                        case 3:
                                                            $device_description = 'Pengecoran Cetakan';
                                                            break;
                                                        case 4:
                                                            $device_description = 'Perenggangan Tulangan';
                                                            break;
                                                        case 5:
                                                            $device_description = 'Pemutaran Cetakan';
                                                            break;
                                                        case 6:
                                                            $device_description = 'Pembukaan Cetakan';
                                                            break;
                                                        default:
                                                            $device_description = 'Unknown Device Number';
                                                            break;
                                                    }
                                                @endphp
                                                {{ $device_description }}
                                            </td>
                                        @foreach ($dates as $date)
                                        <td class="clickable-td" 
                                            data-date="{{ $date }}" 
                                            data-activity="{{ $device_description }}" 
                                            data-snapshot="{{ isset($row->snapshot) ? $row->snapshot : '' }}"
                                            style="text-align:center">
                                            {{ isset($queryResults[$row->device_number][$currentShift][$date]['query4Total']) ? $queryResults[$row->device_number][$currentShift][$date]['query4Total'] : '-' }}%
                                        </td>
                                    @endforeach

                                        </tr>
                                    @endif
                                    @php $prevShift = $currentShift; @endphp
                                @endforeach
                        
                                @if ($prevShift !== '')
                                    <!-- Beri latar belakang abu-abu untuk baris rata-rata untuk shift terakhir -->
                                    <tr>
                                        <td class="fixed-side"></td>
                                        <td class="fixed-side" style="background-color: rgb(170, 169, 169);">{{ $averages[$prevShift]->device_number }}</td>
                                        @foreach($dates as $date)
                                            <td style="background-color: rgb(170, 169, 169); text-align: center;">
                                                {{ isset($averages[$prevShift]->{$date}) ? $averages[$prevShift]->{$date} : '-' }}%
                                            </td>
                                        @endforeach
                                    </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>
            </div>
            
            <div class="table-scroll mt-4" id="table-scroll2" style="display:none">
                <div class="table-wrap">
                        <table class="main-table table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th rowspan="2" class="fixed-side">Tanggal</th>
                                    <th rowspan="2" class="fixed-side">Aktifitas</th>   
                                    {{-- <th rowspan="2" class="fixed-side">Rata-Rata</th> --}}
                               
                                    @foreach ($dates2 as $date)
                                        <th class="text-center">{{ $date }}</th>
                                    @endforeach
                                    {{-- @foreach ($dates2 as $date)
                                        <th class="text-center">{{ $date }}</th>
                                    @endforeach --}}
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $prevShift = '';
                                @endphp
                                @foreach ($data2 as $row)
                                    @php 
                                        $currentShift = $row->shift; 
                                    @endphp
                                    @if ($prevShift !== '' && $prevShift !== $currentShift)
                                        <!-- Baris untuk rata-rata -->
                                        <tr>
                                            <td class="fixed-side"></td>
                                            <td class="fixed-side" style="background-color: rgb(170, 169, 169);">{{ $averages2[$prevShift]->device_number }}</td>
                                            @foreach($dates2 as $date)
                                                <td style="background-color: rgb(170, 169, 169); text-align: center;">
                                                    {{ isset($averages2[$prevShift]->{$date}) ? $averages2[$prevShift]->{$date} : '-' }}%
                                                </td>
                                            @endforeach
                                        </tr>
                                    @endif
                        
                                    @if ($prevShift !== $currentShift)
                                        <!-- Tampilkan nama shift hanya saat berganti -->
                                        <tr>
                                            <td class="fixed-side" rowspan="{{ $rowspanCount2[$currentShift] }}" style="text-align: center;">{{ $currentShift }}</td>
                                            <td class="fixed-side" style="text-align: center;">
                                                @php
                                                    // Mendapatkan deskripsi aktifitas berdasarkan device_number
                                                    $device_description = '';
                                                    switch ($row->device_number) {
                                                        case 0:
                                                            $device_description = 'Persiapan Rakitan Tulangan';
                                                            break;
                                                        case 1:
                                                            $device_description = 'Stok Rakitan Tulangan';
                                                            break;
                                                        case 2:
                                                            $device_description = 'Perakitan Tulangan';
                                                            break;
                                                        case 3:
                                                            $device_description = 'Pengecoran Cetakan';
                                                            break;
                                                        case 4:
                                                            $device_description = 'Perenggangan Tulangan';
                                                            break;
                                                        case 5:
                                                            $device_description = 'Pemutaran Cetakan';
                                                            break;
                                                        case 6:
                                                            $device_description = 'Pembukaan Cetakan';
                                                            break;
                                                        default:
                                                            $device_description = 'Unknown Device Number';
                                                            break;
                                                    }
                                                @endphp
                                                {{ $device_description }}
                                            </td>
                                         
    
                                               @foreach ($dates2 as $date)
                                            <td class="clickable-td" 
                                                data-date="{{ $date }}" 
                                                data-activity="{{ $device_description }}" 
                                                data-snapshot="{{ isset($row->snapshot) ? $row->snapshot : '' }}"
                                                style="text-align:center">
                                                {{ isset($queryResults2[$row->device_number][$currentShift][$date]['query9Total']) ? $queryResults2[$row->device_number][$currentShift][$date]['query9Total'] : '-' }}%
                                            </td>
                                        @endforeach
                                        </tr>
                                    @else
                                        <!-- Hanya tampilkan nomor perangkat dan data untuk shift yang sama -->
                                        <tr>
                                            <td class="fixed-side" style="text-align: center;">
                                                @php
                                                    $device_description = '';
                                                    switch ($row->device_number) {
                                                        case 0:
                                                            $device_description = 'Persiapan Rakitan Tulangan';
                                                            break;
                                                        case 1:
                                                            $device_description = 'Stok Rakitan Tulangan';
                                                            break;
                                                        case 2:
                                                            $device_description = 'Perakitan Tulangan';
                                                            break;
                                                        case 3:
                                                            $device_description = 'Pengecoran Cetakan';
                                                            break;
                                                        case 4:
                                                            $device_description = 'Perenggangan Tulangan';
                                                            break;
                                                        case 5:
                                                            $device_description = 'Pemutaran Cetakan';
                                                            break;
                                                        case 6:
                                                            $device_description = 'Pembukaan Cetakan';
                                                            break;
                                                        default:
                                                            $device_description = 'Unknown Device Number';
                                                            break;
                                                    }
                                                @endphp
                                                {{ $device_description }}
                                            </td>
                                               @foreach ($dates2 as $date)
                                            <td class="clickable-td" 
                                                data-date="{{ $date }}" 
                                                data-activity="{{ $device_description }}" 
                                                data-snapshot="{{ isset($row->snapshot) ? $row->snapshot : '' }}"
                                                style="text-align:center">
                                                {{ isset($queryResults2[$row->device_number][$currentShift][$date]['query9Total']) ? $queryResults2[$row->device_number][$currentShift][$date]['query9Total'] : '-' }}%
                                            </td>
                                        @endforeach
                                        </tr>
                                    @endif
                                    @php $prevShift = $currentShift; @endphp
                                @endforeach
                        
                                @if ($prevShift !== '')
                                    <!-- Beri latar belakang abu-abu untuk baris rata-rata untuk shift terakhir -->
                                    <tr>
                                        <td class="fixed-side"></td>
                                        <td class="fixed-side" style="background-color: rgb(170, 169, 169);">{{ $averages2[$prevShift]->device_number }}</td>
                                        @foreach($dates2 as $date)
                                            <td style="background-color: rgb(170, 169, 169); text-align: center;">
                                                {{ isset($averages2[$prevShift]->{$date}) ? $averages2[$prevShift]->{$date} : '-' }}%
                                            </td>
                                        @endforeach
                                    </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
    </div>
</div>






   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        const tableScroll = $('#table-scroll');
        const tableScroll2 = $('#table-scroll2');
        const compareButton = $('#compareButton');
        const snapshotModal = $('#snapshotModal');

        // Sembunyikan kedua tabel saat halaman dimuat
        tableScroll.hide();
        tableScroll2.hide();

        // Event listener untuk tombol Compare
        compareButton.click(function() {
            var isComparing = compareButton.data('comparing');

            if (isComparing) {
                // If currently comparing, revert changes
                $('#comparisonFields').hide();
                $('#validasibandingkan').val(0);
                tableScroll.removeClass('small');
                tableScroll2.removeClass('taller').hide();
                compareButton.html('<span class="fa fa-exchange"></span> Compare');
            } else {
                // If not currently comparing, apply changes
                $('#comparisonFields').show();
                $('#validasibandingkan').val(1);
                tableScroll.addClass('small');
                tableScroll2.addClass('taller').show();
                compareButton.html('<span class="fa fa-times"></span> Cancel');
            }

            compareButton.data('comparing', !isComparing);
        });

        // Form submission via AJAX
        $('#searchForm').submit(function(event) {
            event.preventDefault();
            var formData = $(this).serialize();

            var $submitButton = $('.button-submit'); // Cache the submit button

            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: formData,
                beforeSend: function() {
                    // Disable submit button
                    $submitButton.prop('disabled', true);
                    // Optionally, change button text or add a spinner icon
                    $submitButton.html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...');
                },
                success: function(response) {
                    // Update table content
                    var $responseHtml = $(response);
                    // Update main-table in table-scroll
                    $('#table-scroll .main-table').html($responseHtml.find('#table-scroll .main-table').html());
                    // Show table-scroll after updating content
                    $('#table-scroll').show();

                    // Check if Compare button was toggled on
                    if ($('#validasibandingkan').val() == '1') {
                        // Update main-table in table-scroll2
                        $('#table-scroll2 .main-table').html($responseHtml.find('#table-scroll2 .main-table').html());
                        // Show table-scroll2 if visible
                        $('#table-scroll2').show();
                    } else {
                        // Hide table-scroll2 if not visible
                        $('#table-scroll2').hide();
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                    // Handle error
                },
                complete: function() {
                    // Re-enable submit button
                    $submitButton.prop('disabled', false);
                    // Restore button text or remove spinner icon
                    $submitButton.html('Search'); // Adjust as needed
                }
            }); 
        });

        // Handle the click event on the cells
        $(document).on('click', '.clickable-td', function() {
    var date = $(this).data('date');
    var activity = $(this).data('activity');
    var snapshot = $(this).data('snapshot'); // Mengambil nilai snapshot dari data-snapshot pada td

    // Anda dapat memuat snapshot dari data atau sumber lain sesuai kebutuhan
    // Misalnya, menambahkan gambar snapshot dengan menggunakan nilai yang telah didapat
    if (snapshot) {
        snapshot = '<img src="/even_workers/' + snapshot + '" alt="Snapshot Image" style="width:100px">';
    } else {
        snapshot = '<p>No snapshot available</p>';
    }

    // Populate the modal with the relevant data including snapshot
    snapshotModal.find('.modal-body').html('<p>Date: ' + date + '</p><p>Activity: ' + activity + '</p>' + snapshot);

    // Show the modal
    snapshotModal.modal('show');
});


    });
      // Clone main table
      $(".main-table").clone(true).appendTo('#table-scroll').addClass('clone');
        $(".main-table").clone(true).appendTo('#table-scroll2').addClass('clone');
</script>
</script>



@endsection
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
                <!-- Konten snapshot akan dimuat oleh JavaScript -->
            </div>
        </div>
    </div>
</div>
