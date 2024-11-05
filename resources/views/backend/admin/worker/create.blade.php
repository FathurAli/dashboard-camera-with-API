<form id='create' action="{{ route('worker.store') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8" class="needs-validation" novalidate>
    @csrf
    <fieldset class="form-group border p-3">
        <div class="form-row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" id="id" name="id" placeholder="Your ID" required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="image">Image</label>
                    <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
                </div>
            </div>                                   
        </div>
    </fieldset>     
    <div class="form-group col-md-12">
        <button type="submit" class="btn btn-success">Save</button>
    </div>
</form>

<script>
    $('.button-submit').click(function (e) {
        e.preventDefault(); // Cegah submit default
        ajax_submit_store('worker'); // Panggil fungsi untuk mengirim data
    });

    function ajax_submit_store(route) {
        var form = $('#create');
        $.ajax({
            type: 'POST',
            url: route,
            data: new FormData(form[0]), // Menggunakan FormData untuk mengirim file
            processData: false,
            contentType: false,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            success: function(response) {
                if (response.type === 'success') {
                    alert(response.message);
                    $('#myModal').modal('hide');
                    // Reload or update table here
                }
            },
            error: function(xhr) {
                if (xhr.status === 422) {
                    var errors = xhr.responseJSON.message;
                    alert(errors);
                } else {
                    alert('Error saving data. Please try again.');
                }
            }
        });
    }
</script>
