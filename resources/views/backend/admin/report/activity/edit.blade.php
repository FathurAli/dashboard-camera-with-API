<form id='edit' action="" enctype="multipart/form-data" method="post" accept-charset="utf-8">
    <div id="status"></div>
    {{method_field('PATCH')}}
    <div class="form-row">
        <div class="form-group col-md-2 col-sm-12">
            <label for=""> Worker ID </label>
            <input type="text" class="form-control" id="worker_id" name="worker_id" value="{{ $worker_id }}"
                   placeholder="" required>
            <span id="error_worker_id" class="has-error"></span>
        </div>
        <div class="form-group col-md-2 col-sm-12">
            <label for=""> Event Scene ID </label>
            <input type="text" class="form-control" id="event_scene_id" name="event_scene_id" value="{{ $event_scene_id }}"
                   placeholder="" required>
            <span id="error_event_scene_id" class="has-error"></span>
        </div>
        <div class="form-group col-md-2 col-sm-12">
            <label for=""> Activity ID </label>
            <input type="text" class="form-control" id="activity_id" name="activity_id" value="{{ $activity_id }}"
                   placeholder="" required>
            <span id="error_activity_id" class="has-error"></span>
        </div>
        <div class="form-group col-md-3 col-sm-12">
            <label for=""> Activity Name </label>
            <input type="text" class="form-control" id="activity_name" name="activity_name" value="{{ $activity_name }}"
                   placeholder="" required>
            <span id="error_activity_name" class="has-error"></span>
        </div>
        <div class="form-group col-md-3 col-sm-12">
            <label for="photo">Snapshot (File must be jpg, jpeg, png)</label>
            <div class="input-group">
                <input id="snapshot" type="file" name="snapshot" style="display:none">
                <div class="input-group-prepend">
                    <a class="btn btn-secondary text-white" onclick="$('input[id=snapshot]').click();">Browse</a>
                </div>
                <input type="text" name="SelectedFileName" class="form-control" id="SelectedFileName"
                       value="" readonly>
            </div>
            <script type="text/javascript">
                $('input[id=snapshot]').change(function () {
                    $('#SelectedFileName').val($(this).val());
                });
            </script>
            <span id="error_snapshot" class="has-error"></span>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-success button-submit"
                    data-loading-text="Loading..."><span class="fa fa-save fa-fw"></span> Save
            </button>
        </div>
    </div>
</form>
<script>
    $('input[type="radio"].flat-green').iCheck({
        radioClass: 'iradio_flat-green'
    });
    $('.button-submit').click(function () {
        // route name and record id
        ajax_submit_update('eventworkers')
    });
</script>