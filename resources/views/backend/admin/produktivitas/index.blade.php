@extends('backend.layouts.master')
@section('title', 'Laporan Produktivitas')
@section('content')

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
        <form action="{{ URL :: to('/admin/filterdata') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8" class="needs-validation" novalidate>
          @csrf

          <div class="form-row">
            <font style="font-size: 15px; color: red;">*Data Wajib Diisi</font>
          </div>
          <br>
          <div class="form-row">
            
            <div class="col-md-4">
              <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="start_date" class="col-md-4">Start Date</label>
                    <input type="date" class="col-md-6 form-control" id="start_date" name="start_date" value="" placeholder="" required>
                </div>
                <span id="error_start_date" class="has-error"></span>
              </div>
              <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="end_date" class="col-md-4">End Date</label>
                    <input type="date" class="col-md-6 form-control" id="end_date" name="end_date" value="" placeholder="" required>
                </div>
                <span id="error_end_date" class="has-error"></span>
              </div>
              <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="shift" class="col-md-4">Shift</label>
                    <select name="shift" id="shift" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                        <option value="Selected" selected disabled hidden>Selected</option>
                        <option value="All">All</option>
                        <option value="Shift 1">Shift 1</option>
                        <option value="Shift 2">Shift 2</option>
                        <option value="Shift 3">Shift 3</option>
                    </select>
                </div>
                <span id="error_shift" class="has-error"></span>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="actifitas" class="col-md-4">Actifitas</label>
                    <select name="actifitas" id="actifitas" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                        <option value="Selected" selected disabled hidden>Selected</option>
                        <option value="All">All</option>
                        <option value="7">Persiapan Rakitan Tulangan</option>
                        <option value="8">Stok Rakitan Tulangan</option>
                        <option value="6">Perakitan Tulangan</option>
                        <option value="5">Pengecoran Cetakan</option>
                        <option value="2">Perenggangan Tulangan</option>
                        <option value="1">Pemutaran Cetakan</option>
                        <option value="4">Pembukaan Cetakan</option>
                    </select>
                </div>
                <span id="error_actifitas" class="has-error"></span>
            </div>            
            </div>

            <div class="col-md-4" id="comparisonFields" style="display:none;">
              <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="start_date2" class="col-md-3">Start Date</label>
                    <input type="date" class="col-md-6 form-control" id="start_date2" name="start_date2" value="" placeholder="">
                </div>
                <span id="error_start_date2" class="has-error"></span>
              </div>
              <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="end_date2" class="col-md-3">End Date</label>
                    <input type="date" class="col-md-6 form-control" id="end_date2" name="end_date2" value="" placeholder="">
                </div>
                <span id="error_end_date2" class="has-error"></span>
              </div>
              <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="shift2" class="col-md-3">Shift</label>
                    <select name="shift2" id="shift2" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                      <option value="">Selected</option>
                      <option value="All">All</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                    </select>
                </div>
                <span id="error_shift2" class="has-error"></span>
              </div>
              <div class="form-row">
                <div class="form-group col-md-12 col-sm-12 d-flex align-items-center">
                    <label for="actifitas2" class="col-md-3">Actifitas</label>
                    <select name="actifitas2" id="actifitas2" class="col-md-6 form-control" style="width: 100%;" placeholder="">
                      <option value="">Selected</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                    </select>
                </div>
                <span id="error_actifitas2" class="has-error"></span>
              </div>
            </div>
            <input type="text" class="col-md-1 form-control" id="idvalidasibandingkan" name="validasibandingkan" value="0" style="display:none;">
          </div>


          <div class="form-group col-md-6 offset-sm-2" style="margin-left: 7.3%;">
            <button type="submit" class="btn btn-primary button-submit" data-loading-text="Loading...">
              <span class="fa fa-search fa-fw"></span> Search
            </button>

            <button type="button" class="btn btn-warning button-submit" id="compareButton">
              <span class="fa fa-exchange"></span> Bandingkan
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
      document.getElementById('compareButton').addEventListener('click', function() {
        var comparisonFields = document.getElementById('comparisonFields');
        var validasiBandingkan = document.getElementById('idvalidasibandingkan');

        if (comparisonFields.style.display === 'none') {
          comparisonFields.style.display = 'block';
          validasiBandingkan.value = '1';
          this.innerHTML = '<span class="fa fa-exchange"></span> Batalkan';
          resetComparisonFields();
        } else {
          comparisonFields.style.display = 'none';
          validasiBandingkan.value = '0';
          this.innerHTML = '<span class="fa fa-exchange"></span> Bandingkan';
        }
      });

      function resetComparisonFields() {
        document.getElementById('start_date2').value = '';
        document.getElementById('end_date2').value = '';
        document.getElementById('shift2').value = '';
        document.getElementById('actifitas2').value = '';
      }
    });
  </script>
@stop