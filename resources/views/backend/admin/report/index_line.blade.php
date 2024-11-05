@extends('backend.layouts.master')
@section('title', 'Proyek')
@section('content')

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Line Charts</title>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>

<div>
    <label for="month-filter">Select Month:</label>
    <select id="month-filter">
        <option value="">-- Select Month --</option>
        <option value="Jan">January</option>
        <option value="Feb">February</option>
        <option value="Mar">March</option>
        <option value="Apr">April</option>
        <option value="May">May</option>
        <option value="Jun">June</option>
        <option value="Jul">July</option>
        <option value="Aug">August</option>
        <option value="Sep">September</option>
        <option value="Oct">October</option>
        <option value="Nov">November</option>
        <option value="Dec">December</option>
    </select>
</div>

<div>
    <button onclick="submitFilter()">Submit</button>
    <button onclick="resetCharts()">Reset</button>
</div>

<div id="chart-month"></div>
<div id="chart-date" style="display: none;"></div>

<style>
    @media screen and (min-width: 768px) {
        #myModal .modal-dialog {
            width: 90%;
            border-radius: 5px;
        }
    }
</style>

<script>
    var data = {
        Produktif: [10, 40, 35, 36, 56, 67, 93, 40, null, null, null, null],
        'Semi-Produktif': [10, 41, 35, 51, 49, 62, 69, 91, null, null, null, null],
        'Non-Produktif': [24, 41, 67, 78, 34, 26, 90, 21, null, null, null, null]
    };

    var dateData = {
        Produktif: [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 31, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null],
        'Semi-Produktif': [11, 13, 15, 17, 19, 21, 23, 25, 27, 29, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null],
        'Non-Produktif': [9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]
    };

    var optionsMonth = {
        series: [{
            name: "Produktif",
            data: data.Produktif
        }, {
            name: "Semi-Produktif",
            data: data['Semi-Produktif']
        }, {
            name: "Non-Produktif",
            data: data['Non-Produktif']
        }],
        chart: {
            height: 350,
            type: 'line',
            zoom: {
                enabled: false
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'straight'
        },
        title: {
            text: 'Product Trends by Month',
            align: 'left'
        },
        grid: {
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        },
        colors: ['#FF4560', '#FEB019', '#008FFB']
    };

    var chartMonth = new ApexCharts(document.querySelector("#chart-month"), optionsMonth);
    chartMonth.render();

    var optionsDate = {
        series: [{
            name: "Produktif",
            data: []
        }, {
            name: "Semi-Produktif",
            data: []
        }, {
            name: "Non-Produktif",
            data: []
        }],
        chart: {
            height: 350,
            type: 'line',
            zoom: {
                enabled: false
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'straight'
        },
        title: {
            text: 'Product Trends by Date',
            align: 'left'
        },
        grid: {
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
        },
        xaxis: {
            categories: [],
        },
        colors: ['#FF4560', '#FEB019', '#008FFB']
    };

    var chartDate = new ApexCharts(document.querySelector("#chart-date"), optionsDate);
    chartDate.render();

    function getDaysInMonth(month) {
        var days = 31;
        if (month === 'Feb') {
            days = 28;
        } else if (['Apr', 'Jun', 'Sep', 'Nov'].includes(month)) {
            days = 30;
        }
        return days;
    }

    function submitFilter() {
        var selectedMonth = document.getElementById('month-filter').value;
        if (selectedMonth) {
            document.getElementById('chart-month').style.display = 'none';
            document.getElementById('chart-date').style.display = 'block';

            var daysInMonth = getDaysInMonth(selectedMonth);
            var dateCategories = Array.from({ length: daysInMonth }, (_, i) => (i + 1).toString());

            var filteredDateData = {
                Produktif: dateData.Produktif.slice(0, daysInMonth),
                'Semi-Produktif': dateData['Semi-Produktif'].slice(0, daysInMonth),
                'Non-Produktif': dateData['Non-Produktif'].slice(0, daysInMonth)
            };

            chartDate.updateOptions({
                xaxis: {
                    categories: dateCategories
                }
            });

            chartDate.updateSeries([
                { name: "Produktif", data: filteredDateData.Produktif },
                { name: "Semi-Produktif", data: filteredDateData['Semi-Produktif'] },
                { name: "Non-Produktif", data: filteredDateData['Non-Produktif'] }
            ]);
        } else {
            document.getElementById('chart-month').style.display = 'block';
            document.getElementById('chart-date').style.display = 'none';
            chartMonth.updateSeries([
                { name: "Produktif", data: data.Produktif },
                { name: "Semi-Produktif", data: data['Semi-Produktif'] },
                { name: "Non-Produktif", data: data['Non-Produktif'] }
            ]);
        }
    }

    function resetCharts() {
        document.getElementById('month-filter').value = '';
        document.getElementById('chart-month').style.display = 'block';
        document.getElementById('chart-date').style.display = 'none';
        chartMonth.updateSeries([
            { name: "Produktif", data: data.Produktif },
            { name: "Semi-Produktif", data: data['Semi-Produktif'] },
            { name: "Non-Produktif", data: data['Non-Produktif'] }
        ]);
    }
</script>
@stop
