@extends('backend.layouts.master')
@section('title', 'Proyek')
@section('content')

<style>
    #charts-container {
        display: flex;
        flex-wrap: wrap;
        padding: 10px;
        justify-content: space-between;
    }
    
    #charts-container > * {
        flex-basis: calc(32% - 10px); /* Mengatur lebar setiap elemen menjadi sedikit lebih kecil dari sepertiga */
        margin: 5px; /* Mengurangi jarak antar elemen */
        box-sizing: border-box; /* Agar padding dan border dimasukkan dalam perhitungan lebar */
    }
    
    .chart-item {
        position: relative;
        width: calc(32% - 10px); /* Adjusted for three charts per row */
        margin-bottom: 5px; /* Mengurangi jarak bawah */
        border: 3px solid #000000;
        border-radius: 5px;
        padding: 10px;
        margin-right: 5px; /* Margin yang lebih kecil */
        margin-left: -10px; /* Margin yang lebih kecil */
        cursor: pointer;
    }
    

    .chart-title {
        position: absolute;
        bottom: 200px;
        left: 50%;
        transform: translateX(-50%);
        font-size: 14px;
        font-weight: bold;
        padding-bottom: 5px;
        width: 100%;
        text-align: center;
    }

    .filter-container {
        margin-bottom: 20px;
        text-align: center;
    }

    .modal-dialog {
        max-width: 80%;
        margin: 1.75rem auto;
    }

    #modal-chart {
        margin: 0 auto;
        width: 90%; /* Adjust the width of the modal chart */
        height: 300px; /* Adjust the height of the modal chart */
    }

    @media (max-width: 767.98px) {
        .chart-item {
            width: calc(100% - 20px); /* Adjust chart width for small screens */
            margin-left: 5px;
            margin-right: 5px;
        }
    }
</style>

<div class="filter-container">
    <form method="GET" action="">
        <label for="month">Pilih Bulan:</label>
        <input type="month" id="month" name="month" value="{{ request('month') }}">
        <button type="submit">Filter</button>
        <button type="button" onclick="window.location.href='/admin/report2'">Reset</button>
    </form>
</div>

<div id="charts-container" class="row" data-chartdata="{{ json_encode($grafikData->map(function($item) {
    return [
        'series' => [$item->produktif, $item->semi_produktif, $item->non_produktif],
        'labels' => ['Produktif', 'Semi Produktif', 'Non Produktif'],
        'colors' => ['#FF4560', '#FEB019', '#008FFB']
    ];
})->toArray(), JSON_HEX_TAG) }}" data-charttitles="{{ json_encode($grafikData->pluck('tanggal')->toArray()) }}"></div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts@latest"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var chartsContainer = document.getElementById('charts-container');
        var chartsData = JSON.parse(chartsContainer.getAttribute('data-chartdata'));
        var chartTitles = JSON.parse(chartsContainer.getAttribute('data-charttitles'));

        // Loop through the data and create charts
        for (var i = 0; i < chartsData.length; i++) {
            var chartDiv = document.createElement('div');
            chartDiv.id = 'chart' + i;
            chartDiv.className = 'chart-item col-lg-4 col-md-6';

            var chartTitle = document.createElement('h6');
            chartTitle.textContent = chartTitles[i];
            chartTitle.className = 'chart-title';
            chartDiv.appendChild(chartTitle);

            // Attach click event to show modal
            (function(index) {
                chartDiv.onclick = function() {
                    showChartModal(index);
                };
            })(i);

            chartsContainer.appendChild(chartDiv);

            var options = {
                series: chartsData[i].series,
                chart: {
                    width: 340,
                    type: 'pie',
                },
                labels: chartsData[i].labels,
                dataLabels: {
                    enabled: true,
                    position: 'bottom',
                    offsetY: 20,
                    textAnchor: 'middle',
                    dropShadow: {
                        enabled: false,
                    }
                },
                colors: chartsData[i].colors
            };

            var chart = new ApexCharts(document.querySelector("#chart" + i), options);
            chart.render();
        }
    });

    function showChartModal(chartIndex) {
        var chartsData = JSON.parse(document.getElementById('charts-container').getAttribute('data-chartdata'));
        var chartTitles = JSON.parse(document.getElementById('charts-container').getAttribute('data-charttitles'));

        var options = {
            series: chartsData[chartIndex].series,
            chart: {
                height: 400,
                type: 'pie',
            },
            labels: chartsData[chartIndex].labels,
            colors: chartsData[chartIndex].colors
        };

        var modalChart = new ApexCharts(document.querySelector("#modal-chart"), options);
        document.getElementById('chartModalLabel').textContent = chartTitles[chartIndex];
        
        // Clear any previous charts
        document.getElementById('modal-chart').innerHTML = "";
        
        modalChart.render();
        $('#chartModal').modal('show');
    }
</script>

@stop

<div class="modal fade" id="chartModal" tabindex="-1" role="dialog" aria-labelledby="chartModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="chartModalLabel">Chart Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="modal-chart"></div>
            </div>
        </div>
    </div>
</div>
