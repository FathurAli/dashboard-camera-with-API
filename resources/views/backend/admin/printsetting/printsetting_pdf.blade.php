<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tanda Terima</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 10px;
        }
        .receipt {
            width: 100%;
			height:50%;
            margin: auto;
            border: 1px solid #ccc;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .receipt-header {
            text-align: center;
        }
        .receipt-items {
            margin-top: 20px;
        }
        .item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div style="margin-top: -35px;margin-left: -35px;">
        <img src="assets/images/logo/ss_nigma.png" style="max-height: 90px; max-width: 270px;">
    </div>
    <br>
    <div style="text-align: center;">
        <span style="border:0px solid black;font-size: 25px;">
            Tanda Terima
        </span>
    </div>
    <br>    
	<div class="receipt">
        <div class="receipt-header">
            
        </div>
        <div class="receipt-items">
            <div class="item">
                <span>{!! $data->description !!}</span>
                <span></span>
            </div>
            
            <!-- Tambahkan item lainnya sesuai kebutuhan -->
        </div>
        
    </div>
	<div style="padding-top: 20px;">
		<table style="width:100%; font-size: 14px;">
			<thead>
				<tr>
					<td style="width: 33%; text-align:center;"><u style="border-bottom: 1px dotted #000;text-decoration: none;">{{ date('d  F  Y', strtotime($data->date))}}</u></td>
					<td style="width: 33%; text-align:center;"></td>
					<td style="width: 33%; text-align:center;"></td>
				</tr>
				<tr>
					<td style="text-align:center;"></td>
					<td style="text-align:center;"></td>
					<td style="text-align:center;"></td>
				</tr>
			</thead>
		</table>
	</div>
	<br>
	<div style="padding-top: 10px;">
		<table style="width:100%; font-size: 14px;">
			<thead>
				<tr>
					<td style="width: 33%; text-align:center;">Yang Menyerahkan,</td>
					<td style="width: 33%; text-align:center;"></td>
					<td style="width: 53%; text-align:center;">Yang Menerima,</td>
				</tr>
				<tr>
					<td style="padding-top: 45%;">&nbsp;</td>
					<td style="padding-top: 45%;">&nbsp;</td>
					<td style="padding-top: 45%;">&nbsp;</td>
				</tr>
				<tr>
					<td style="text-align:center;">( <u style="border-bottom: 1px dotted #000;text-decoration: none;">{{ $data->pengirim }}</u> )</td>
					<td style="text-align:center;"></td>
					<td style="text-align:center;">( <u style="border-bottom: 1px dotted #000;text-decoration: none;">{{ $data->penerima }}</u> )</td>
				</tr>
			</thead>
		</table>
	</div>
    <div style="padding-top: 40px;">
		<table style="width:100%; font-size: 11px;">
			<thead>
				<tr>
					<td style="width: 33%; text-align:center;"></td>
					<td style="width: 43%; text-align:center;"></td>
					<td style="width: 23%; text-align:right;">www.nigmagrid.net<br>Puri Botanical H9-8<br>Jakarta Barat 11640<br>Indonesia<br>62 21 589066608</td>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>