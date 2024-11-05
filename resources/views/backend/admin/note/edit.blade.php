@extends('backend.layouts.master')
@section('title', 'Edit Note')
@section('content')

<head>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
    <style>
        #content {
            width: 100%; /* Memastikan lebar 100% dari kontainer */
            height: 800px; /* Mengatur tinggi sesuai kebutuhan */
        }
    </style>
</head>

<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-note2 icon-gradient bg-mean-fruit"></i>
            </div>
            <div>Edit Note</div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="main-card mb-5 card">
        <div class="card-body">
            <form id="edit" method="POST" action="{{ route('note.update', $note->id) }}">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" id="title" name="title" required value="{{ old('title', $note->title) }}">
                </div>
                <div class="form-group">
                    <label for="content">Content</label>
                    <textarea class="form-control custom-textarea" id="content" name="content" rows="10">{{ old('content', $note->content) }}</textarea>
                </div>
                <button type="submit" class="btn btn-primary">Update Note</button>
                <a href="{{ route('note.index') }}" class="btn btn-secondary" style="margin-left: 10px;">Back</a>
            </form>
        </div>
    </div>
</div>

<script>
    class MyUploadAdapter {
        constructor(loader) {
            this.loader = loader;
            this.uploadUrl = '{{ route('note.upload.image') }}';
            this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        }

        upload() {
            return this.loader.file
                .then(file => new Promise((resolve, reject) => {
                    const formData = new FormData();
                    formData.append('upload', file);

                    fetch(this.uploadUrl, {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': this.csrfToken,
                            'Accept': 'application/json'
                        },
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.url) {
                            resolve({
                                default: data.url
                            });
                        } else {
                            reject(data.error || 'Upload failed');
                        }
                    })
                    .catch(error => {
                        reject(error.message || 'Upload failed');
                    });
                }));
        }

        abort() {
            // Implementasi jika diperlukan
        }
    }

    function MyCustomUploadAdapterPlugin(editor) {
        editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
            return new MyUploadAdapter(loader);
        };
    }

    let editorInstance;

    ClassicEditor
        .create(document.querySelector('#content'), {
            extraPlugins: [MyCustomUploadAdapterPlugin],
            toolbar: [
                'heading', '|',
                'bold', 'italic', 'link', 'imageUpload',
                'blockQuote', 'insertTable', '|',
                'undo', 'redo'
            ],
        })
        .then(editor => {
            editorInstance = editor;
        })
        .catch(error => {
            console.error(error);
        });

    document.getElementById('edit').addEventListener('submit', function(e) {
        const data = editorInstance.getData();
        document.querySelector('#content').value = data;

        if (data.trim() === '') {
            e.preventDefault();
            alert('Content is required.');
        }
    });
</script>

@endsection
