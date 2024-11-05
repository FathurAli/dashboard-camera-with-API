<form id='edit' action="" enctype="multipart/form-data" method="post" accept-charset="utf-8">
    <b style="display: block;text-align: center; margin-bottom: 20px; font-size:20px;">module </b>
    <fieldset class="form-group border p-3" style="box-shadow: 0 2px 5px rgba(0,0,0,0.2),-2px 0 5px rgba(0,0,0,0.2),  2px 0 5px rgba(0,0,0,0.2);margin-top:-17px;">
    <div id="status"></div>
    {{method_field('PATCH')}}
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="id_parent">id_parent</label>
            <input type="text" class="form-control" id="id_parent" name="id_parent" value="{{ $module->id_parent }}" placeholder="id_parent" required>
            <span id="error_id_parent" class="has-error"></span>
        </div>

        <div class="clearfix"></div>
        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-success button-submit" data-loading-text="Loading..."><span class="fa fa-save fa-fw"></span> Save</button>
        </div>
    </div>
</form>

<script>
    $('.button-submit').click(function () {
        ajax_submit_update('module', "{{ $module->id_module }}")
    });

</script>
