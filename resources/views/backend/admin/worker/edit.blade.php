<form id="edit" action="{{ url('admin/worker/'.$worker->id) }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
    @csrf
    {{ method_field('PATCH') }}
    <b style="display: block;text-align: center; margin-bottom: 20px; font-size:20px;">USER</b>
    <fieldset class="form-group border p-3" style="box-shadow: 0 2px 5px rgba(0,0,0,0.2);margin-top:-17px;">
        <div id="status"></div>
        <div class="form-row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" id="id" name="id" value="{{ $worker->id }}" readonly>
                    <span id="error_id" class="has-error"></span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="{{ $worker->name }}">
                    <span id="error_name" class="has-error"></span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="image">Image (Optional)</label>
                    <input type="file" class="form-control" id="image" name="image" accept="image/*">
                    <span id="error_image" class="has-error"></span>
                </div>
            </div>
        </div>
    </fieldset>
    <div class="clearfix"></div>
    <div class="form-group col-md-12">
        <button type="submit" class="btn btn-success button-submit"><span class="fa fa-save fa-fw"></span> Save</button>
    </div>
</form>

<script>
    $(document).ready(function() {
        var potoFilePath = "{{ asset($worker->poto) }}";
        if (potoFilePath !== "{{ asset('assets/images/worker/') }}") {
            $('#previewpoto').show();
        }

        $('input[id=image]').change(function() {
            var fileName = $(this).val().split('\\').pop();
            $('#previewpoto').show();
            readURL(this, '#previewpoto');
        });

        $('#edit').on('submit', function(e) {
            let nameValue = $('#name').val().trim();
            if (nameValue === '') {
                e.preventDefault(); // Mencegah pengiriman form
                $('#error_name').text('Name is required.'); // Tampilkan pesan kesalahan
                return;
            }
        });
    });

    function readURL(input, imgSelector) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $(imgSelector).attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
