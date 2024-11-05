<form id='create' action="" enctype="multipart/form-data" method="post" accept-charset="utf-8" class="needs-validation" novalidate>
    <div id="status"></div>
    <b style="display: block;text-align: center; margin-bottom: 20px; font-size:20px;">CLIENT </b>
    <fieldset class="form-group border p-3" style="box-shadow: 0 2px 5px rgba(0,0,0,0.2),-2px 0 5px rgba(0,0,0,0.2),  2px 0 5px rgba(0,0,0,0.2);margin-top:-17px;">
    <div class="row">
        {{-- <div class="form-group col-md-6">
            <label for="id_parent">Id</label>
            <input type="text" class="form-control" id="id_parent" value="" placeholder="id_parent" required>
            <span id="error_code" class="has-error"></span>
        </div> --}}
        <div class="form-group col-md-6">
            <label for="id_parent">Nama Modul</label>
            <input type="int" class="form-control" id="id_parent" name="id_parent" value="" placeholder="Client Name" required>
            <span id="error_name_module" class="has-error"></span>
        </div>
        <div class="form-group col-md-6">
            <label for="name_module">Nama Modul</label>
            <input type="text" class="form-control" id="name_module" name="name_module" value="" placeholder="Client Name" required>
            <span id="error_name_module" class="has-error"></span>
        </div>
        <div class="form-group col-md-6">
            <label for="name_controller">Nama Controller</label>
            <input type="text" class="form-control" id="name_controller" name="name_controller" value="" placeholder="nama_controller" required>
            <span id="error_name_controller" class="has-error"></span>
        </div>
        <div class="form-group col-md-6">
            <label for="sort">sort</label>
            <input type="text" class="form-control" id="sort" name="sort" value="" placeholder="" required>
            <span id="error_sort" class="has-error"></span>
        </div>
    </div>
    </fieldset>
    <div class="clearfix"></div>
    <div class="form-group col-md-12">
        <button type="submit" class="btn btn-success button-submit" data-loading-text="Loading..."><span class="fa fa-save fa-fw"></span> Save</button>
    </div>
</form>


<script>
    $('.button-submit').click(function () {
        // route name
        ajax_submit_store('module')
    });

</script>