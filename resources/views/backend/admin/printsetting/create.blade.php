<form id='create' action="" enctype="multipart/form-data" method="post" accept-charset="utf-8" class="needs-validation"
      novalidate>
    <div id="status"></div>
    <div class="form-row">
        <div class="col-md-12 mb-3">
            <label for="photo">Logo (Header)</label>
            <div class="input-group">
                <input id="photo" type="file" name="photo" style="display:none">
                <div class="input-group-prepend">
                    <a class="btn btn-secondary text-white" onclick="$('input[id=photo]').click();">Browse</a>
                </div>
                <input type="text" name="SelectedFileName" class="form-control" id="SelectedFileName"
                       value="" readonly>
            </div>
            <script type="text/javascript">
                $('input[id=photo]').change(function () {
                    $('#SelectedFileName').val($(this).val());
                });
            </script>
            <span id="error_photo" class="has-error"></span>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-md-12 col-sm-12">
            <label for=""> Footer </label>
            <textarea rows="4" type="text" class="form-control" id="editor" name="footer" value=""
                      placeholder="" ></textarea>
            <span id="error_description" class="has-error"></span>
        </div>
        
        <div class="clearfix"></div>
        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-success button-submit"
                    data-loading-text="Loading..."><span class="fa fa-save fa-fw"></span> Save
            </button>
        </div>
    </div>
</form>
<!-- <script src="{{ asset('/assets/plugins/ckeditor/ckeditor.js') }}"></script> -->
<script src="{{ asset('/assets/plugins/tinymce/js/tinymce/tinymce.min.js') }}"></script>
<script>

    $('.button-submit').click(function () {
        // route name
        ajax_submit_store('printsetting')
    });
    
    tinymce.init({
        selector: '#editor',
        images_upload_handler: function (blobInfo, success, failure) {
            var xhr, formData;
            xhr = new XMLHttpRequest();
            xhr.withCredentials = false;
            xhr.open('POST', '/upload');
            var token = '{{ csrf_token() }}';
            xhr.setRequestHeader("X-CSRF-Token", token);
            xhr.onload = function() {
                var json;
                if (xhr.status != 200) {
                    failure('HTTP Error: ' + xhr.status);
                    return;
                }
                json = JSON.parse(xhr.responseText);

                if (!json || typeof json.location != 'string') {
                    failure('Invalid JSON: ' + xhr.responseText);
                    return;
                }
                success(json.location);
            };
            formData = new FormData();
            formData.append('file', blobInfo.blob(), blobInfo.filename());
            xhr.send(formData);
        }
    });

    // menggunakan ck editor
    // ClassicEditor
    //     .create( document.querySelector( '#description' ) )
    //     .catch( error => {
    //         console.error( error );
    // } );
</script>