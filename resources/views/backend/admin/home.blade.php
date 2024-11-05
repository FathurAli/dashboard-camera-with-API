@extends('backend.layouts.master')
@section('title', 'Dashboard')
@section('content')
<style>
    .card-panel {
        margin: 10px 10px 15px 10px;
        border: 1px solid #ddd;
        transition: box-shadow 0.3s ease;
    }
    .card-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .card-body {
        padding-top: 20px;
        background: white;
    }
    .chart {
        width: 100%;
        height: 350px;
        display: flex;
        /*align-items: center;
        justify-content: center;*/
        color: #888;
    }
    .inner-card {
        width: 100%;
    }


    .olcards,
    .olcards * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      height: 35px;
      width: 100%;
    }

    .olcards {
      list-style: none;
      counter-reset: cardCount;
      font-family: sans-serif;
      display: flex;
      flex-direction: column;
      --cardsGap: 1rem;
      gap: var(--cardsGap);
      padding-bottom: var(--cardsGap);
    }
    .olcards li {
      counter-increment: cardCount;
      display: flex;
      color: white;
      --labelOffset: 1rem;
      --arrowClipSize: 1.5rem;
    }

    .olcards li::before {
      content: counter(cardCount, decimal-leading-zero);
      background: white;
      color: var(--cardColor);
      font-size: 2em;
      font-weight: 700;
      transform: translateY(calc(-1 * var(--labelOffset)));
      margin-right: calc(-1 * var(--labelOffset));
      z-index: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding-inline: 0.5em;
    }

    .olcards li .content {
      background-color: var(--cardColor);
      --inlinePadding: 1em;
      --boxPadding: 13px;
/*      display: grid;*/
      padding: var(--boxPadding) calc(var(--inlinePadding) + var(--arrowClipSize))
        var(--boxPadding) calc(var(--inlinePadding) + var(--labelOffset));
      grid-template-areas: "judul";
      gap: 0.25em 1em;
      /*clip-path: polygon(
        0 0,
        calc(100% - var(--arrowClipSize)) 0,
        100% 50%,
        calc(100% - var(--arrowClipSize)) 100%,
        calc(100% - var(--arrowClipSize)) calc(100% + var(--cardsGap)),
        0 calc(100% + var(--cardsGap))
      );*/
      position: relative;
    }
    .olcards li .content::before {
      content: "";
      position: absolute;
      width: var(--labelOffset);
      height: var(--labelOffset);
      background: var(--cardColor);
      left: 0;
      bottom: 0;
      clip-path: polygon(0 0, 100% 0, 0 100%);
      filter: brightness(0.75);
    }
    .olcards li .content::after {
      content: "";
      position: absolute;
      height: var(--cardsGap);
      width: var(--cardsGap);
      background: linear-gradient(to right, rgba(0, 0, 0, 0.25), transparent 50%);
      left: 0;
      top: 100%;
    }
    .olcards li .judul {
      grid-area: judul;
      align-self: center;
      font-size: 1rem;
    }


</style>
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="fa fa-dashboard icon-gradient bg-mean-fruit"></i>
            </div>
            <div>
                <b>Dashboard</b>
            </div>
        </div>
    </div>
</div>
<div class="col-md-12">
    <div class="main-card mb-5 card">
        <div class="card-body">
            <form action="" enctype="multipart/form-data" method="post" accept-charset="utf-8" class="needs-validation" novalidate>

                <div class="form-row">
                    <div class="col-md-3">
                        <div class="form-group d-flex align-items-center">
                            <label for="start_date" class="col-md-4" style="font-weight: bold;">Start Date</label>
                            <input type="date" class="col-md-8 form-control" id="start_date" name="start_date" value="" placeholder="">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group d-flex align-items-center">
                            <label for="end_date" class="col-md-4" style="font-weight: bold;">End Date</label>
                            <input type="date" class="col-md-8 form-control" id="end_date" name="end_date" value="" placeholder="">
                        </div>
                    </div>
                </div>

                <div class="form-group col-md-2 offset-sm-2" style="margin-left: 7.3%;">
                    <button type="submit" class="btn btn-primary button-submit" data-loading-text="Loading...">
                        <span class="fa fa-search fa-fw"></span> Search
                    </button>
                </div>

            </form>
        </div>
    </div>

    <div class="main-card mb-5 card">
        <div class="card-body">

            <div class="form-row">
                <div class="col-md-8">
                    <div class="card card-panel">
                        <div class="card-header">Produktivitas Plant 8</div>
                        <div class="card-body">
                            <div class="chart">
                                <div id="chartgrafik" style="width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-panel">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <div class="chart"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card card-panel">
                        <div class="card-header">Shift Berdasarkan Aktivitas</div>
                        <div class="card-body">
                            <div id="chartbar" style="width: 100%;"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-panel">
                        <div class="card-header">Lajur</div>
                        <div class="card-body" style="background: white;">
                            <div class="chart">
                                <ol class="olcards">
                                    <a href="{{ route('admin.dashboardlajur', ['id_titiklajur' => 1]) }}">
                                        <li style="--cardColor:#2c8fa4">
                                            <div class="content">
                                                <div class="judul">Persiapan Rakitan Tulangan</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="{{ route('admin.dashboardlajur', ['id_titiklajur' => 2]) }}">
                                        <li style="--cardColor:#2c93a9">
                                            <div class="content">
                                                <div class="judul">Stok Rakitan Tulangan</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="{{ route('admin.dashboardlajur', ['id_titiklajur' => 3]) }}">
                                        <li style="--cardColor:#2c97ae">
                                            <div class="content">
                                                <div class="judul">Perakitan Tulangan</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="{{ route('admin.dashboardlajur', ['id_titiklajur' => 4]) }}">
                                        <li style="--cardColor:#2c9bb3">
                                            <div class="content">
                                                <div class="judul">Pengecoran</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="{{ route('admin.dashboardlajur', ['id_titiklajur' => 5]) }}">
                                        <li style="--cardColor:#2c9fb8">
                                            <div class="content">
                                                <div class="judul">Perenggangan Tulangan</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="{{ route('admin.dashboardlajur', ['id_titiklajur' => 6]) }}">
                                        <li style="--cardColor:#2ca3bd">
                                            <div class="content">
                                                <div class="judul">Pemutaran Cetakan & UAP</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="{{ route('admin.dashboardlajur', ['id_titiklajur' => 7]) }}">
                                        <li style="--cardColor:#2ca7c2">
                                            <div class="content">
                                                <div class="judul">Pembukaan Cetakan</div>
                                            </div>
                                        </li>
                                    </a>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script type="text/javascript">
    var options = {
        series: [{
            name: "Produktif",
            data: [0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0]
        }, {
            name: "Non-Produktif",
            data: [0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0]
        }],
        chart: {
            height: 350,
            type: 'line',
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true,
                tools: {
                    download: false
                }
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'straight'
        },
        title: {
            text: '',
            align: 'center'
        },
        grid: {
            row: {
                colors: ['#f3f3f3'], // takes an array which will be repeated on columns
                opacity: 0.5
            },

        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Des'],
        },
        colors: ['#008FFB', '#FF4560'] // Merah, kuning, dan biru
    };

    var chart = new ApexCharts(document.querySelector("#chartgrafik"), options);
    chart.render();



    var options = {
        series: [{
        name: 'Persiapan Rakitan Tulangan',
            data: [44]
        }, {
        name: 'Stok Rakitan Tulangan',
            data: [21]
        }, {
        name: 'Perakitan Tulangan',
            data: [66]
        }, {
        name: 'Pengecoran',
            data: [33]
        }, {
        name: 'Perenggangan Tulangan',
            data: [10]
        }, {
        
        name: 'Pemutaran Cetakan & UAP',
            data: [87]
        }, {
        name: 'Pembukaan Cetakan',
            data: [43]
        }],
        chart: {
            type: 'bar',
            height: 335,
            toolbar: {
                show: true,
                tools: {
                    download: false
                }
            }
        },
        plotOptions: {
            bar: {
                horizontal: true,
                dataLabels: {
                    position: 'top',
                },
            }
        },
        dataLabels: {
            enabled: true,
            offsetX: -6,
            style: {
                fontSize: '12px',
                colors: ['#fff']
            }
        },
        stroke: {
            show: true,
            width: 1,
            colors: ['#fff']
        },
        tooltip: {
            shared: true,
            intersect: false
        },
        
        yaxis: {
            axisBorder: {
                show: false
            },
            axisTicks: {
                show: false
            },
            labels: {
                show: false
            },
            title: {
                text: 'LAJUR',
            },
        },

    };

    var chart = new ApexCharts(document.querySelector("#chartbar"), options);
    chart.render();

</script>
@endsection