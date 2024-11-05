String.prototype.number_format = function(d) {
	var n = this;
	var c = isNaN(d = Math.abs(d)) ? 2 : d;
	var s = n < 0 ? "-" : "";
	var i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
	return s + (j ? i.substr(0, j) + ',' : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + ',') + (c ? '.' + Math.abs(n - i).toFixed(c).slice(2) : "");
}

function SumPPN(params) {
	var pajak = $("#pajak").val();
	var hasilPPN = 0;

	if(pajak != 1){
		hasilPPN = params * 11 / 100;
	}

	var hasilTotal = parseFloat(params) + parseFloat(hasilPPN);
	$("#totaltriggerPPN").val(hasilPPN.toString().number_format())
	$("#totaltrigger").val(hasilTotal.toString().number_format()) 
}