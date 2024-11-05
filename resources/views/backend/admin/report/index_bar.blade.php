@extends('backend.layouts.master')
@section('title', 'Proyek')
@section('content')

<style>
    #chart-container {
        padding: 20px;
        margin-top: 20px;
        border: 3px solid #000000;
        border-radius: 5px;
    }

    .chart-title {
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .filter-container {
        margin-bottom: 20px;
        text-align: center;
    }
</style>

<div class="filter-container">
    <form method="GET" action="">
        <label for="month">Pilih Bulan:</label>
        <input type="month" id="month" name="month" value="{{ request('month') }}">
        <button type="submit">Filter</button>
        <button type="button" onclick="window.location.href='/admin/report'">Reset</button>
    </form>
</div>

<div id="chart-container">
    <div class="chart-title">Grafik Produktivitas</div>
    <div id="chart"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/apexcharts@latest"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var chartData = @json($grafikData);

        var seriesData = {
            produktif: [],
            semi_produktif: [],
            non_produktif: [],
            tanggal: []
        };

        chartData.forEach(function(item) {
            seriesData.produktif.push(item.produktif);
            seriesData.semi_produktif.push(item.semi_produktif);
            seriesData.non_produktif.push(item.non_produktif);
            seriesData.tanggal.push(item.tanggal);
        });

        var options = {
            series: [
                {
                    name: 'Non-Produktif',
                    data: seriesData.non_produktif
                },
                {
                    name: 'Semi-Produktif',
                    data: seriesData.semi_produktif
                },
                {
                    name: 'Produktif',
                    data: seriesData.produktif
                }
            ],
            chart: {
                type: 'bar',
                height: 350,
                stacked: true,
                toolbar: {
                    show: true
                },
                zoom: {
                    enabled: true
                }
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    borderRadius: 10,
                    dataLabels: {
                        total: {
                            enabled: true,
                            style: {
                                fontSize: '13px',
                                fontWeight: 900
                            }
                        }
                    }
                }
            },
            xaxis: {
                categories: seriesData.tanggal
            },
            legend: {
                position: 'right',
                offsetY: 40
            },
            fill: {
                opacity: 1
            },
            colors: ['#008FFB', '#FEB019', '#FF4560']
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
    });
</script>

@stop
