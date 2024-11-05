@extends('backend.layouts.master')
@section('title', 'Note')
@section('content')
    <div class="app-page-title">
        <div class="page-title-wrapper">
            <div class="page-title-heading">
                <div class="page-title-icon">
                    <i class="pe-7s-note2 icon-gradient bg-mean-fruit"></i>
                </div>
                <div>All Notes</div>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="main-card mb-5 card">
            <div class="d-flex justify-content-end mt-2">
                {{-- <a href="{{ url('/download/template') }}" class="btn btn-primary mr-2">Download Template</a>
                <button class="btn btn-success mr-2" onclick="ajax_submit_data()">
                    <i class="fa fa-upload"></i> Import
                </button> --}}
                <a href="{{ route('note.create') }}" class="btn btn-success mr-2">
                    <i class="fa fa-plus"></i> New Note
                </a>
                {{-- <a href="{{ route('export.pdf') }}" class="btn btn-xs btn-success" target="_blank" title="PDF">
                    <i class="fa fa-print"></i> Export PDF
                </a> --}}
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table id="Note-table" class="align-middle mb-0 table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Content</th>
                                <th style="width: 150px;">Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Edit Note -->
    <div class="modal fade" id="editNoteModal" tabindex="-1" role="dialog" aria-labelledby="editNoteModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <form id="editNoteForm">
          @csrf
          @method('PUT')
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="editNoteModalLabel">Edit Note</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            
            <div class="modal-body">
              <input type="hidden" id="edit-note-id" name="id">
              
              <div class="form-group">
                <label for="edit-title">Title</label>
                <input type="text" class="form-control" id="edit-title" name="title" required>
              </div>
              
              <div class="form-group">
                <label for="edit-content">Content</label>
                <textarea class="form-control" id="edit-content" name="content" rows="5" required></textarea>
              </div>
            </div>
            
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Update Note</button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function () {
            // Setup CSRF Token for AJAX
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            // Initialize DataTable
            var table = $('#Note-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{ route("note.all") }}',
                columns: [
                    {data: 'id', name: 'id'},
                    {data: 'title', name: 'title'},
                    {
                        data: 'content',
                        name: 'content',
                        render: function (data) {
                            return data ? data : ''; // Render HTML content
                        }
                    },
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ],
                columnDefs: [
                    {className: "", targets: "_all"}
                ],
                autoWidth: false,
            });

            $('.dataTables_filter input[type="search"]').attr('placeholder', 'Type here to search...').css({
                'width': '220px',
                'height': '30px'
            });

            // Handle Edit Note Button Click
            $('#Note-table').on('click', '.edit-note', function () {
                var noteId = $(this).data('id');
                $.ajax({
                    url: '/note/' + noteId + '/edit',
                    type: 'GET',
                    success: function (response) {
                        if(response.success) {
                            $('#edit-note-id').val(response.note.id);
                            $('#edit-title').val(response.note.title);
                            $('#edit-content').val(response.note.content);
                            $('#editNoteModal').modal('show');
                        } else {
                            alert('Failed to fetch note data.');
                        }
                    },
                    error: function () {
                        alert('Error fetching note data.');
                    }
                });
            });

            // Handle Update Note Form Submission
            $('#editNoteForm').on('submit', function (event) {
                event.preventDefault(); // Prevent default form submission
                var formData = $(this).serialize(); // Serialize form data
                var noteId = $('#edit-note-id').val(); // Get note ID

                $.ajax({
                    url: '/note/' + noteId,
                    type: 'PUT',
                    data: formData,
                    success: function (response) {
                        if (response.success) {
                            $('#editNoteModal').modal('hide');
                            $('#Note-table').DataTable().ajax.reload(); // Reload DataTable
                            alert(response.message);
                        } else {
                            alert('Failed to update note.');
                        }
                    },
                    error: function () {
                        alert('Error updating note.');
                    }
                });
            });

            // Handle Delete Note Button Click
            window.deleteNote = function(id) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ url("note") }}/' + id,
                            type: 'DELETE',
                            data: {
                                "_token": "{{ csrf_token() }}",
                            },
                            success: function(response) {
                                if (response.success) {
                                    // Reload DataTable
                                    $('#Note-table').DataTable().ajax.reload();
                                    Swal.fire(
                                        'Deleted!',
                                        response.message,
                                        'success'
                                    );
                                }
                            },
                            error: function(response) {
                                Swal.fire(
                                    'Error!',
                                    'An error occurred while deleting the note.',
                                    'error'
                                );
                            }
                        });
                    }
                });
            }
        });
    </script>
@endsection
