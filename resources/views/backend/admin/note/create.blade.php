@extends('backend.layouts.master')
@section('title', 'Create Note')
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
            <div>Create Note</div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="main-card mb-5 card">
        <div class="card-body">
            <form id="create" method="POST" action="{{ route('note.store') }}">
                @csrf
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" id="title" name="title" required value="{{ old('title') }}">
                </div>
                <div class="form-group">
                    <label for="content">Content</label>
                    <textarea class="form-control custom-textarea" id="content" name="content" rows="10">{{ old('content') }}</textarea>
                </div>
                <button type="submit" class="btn btn-primary">Save Note</button>
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

        // Mengembalikan promise yang akan menyelesaikan upload
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

        // Mengabaikan pembatalan upload
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
            // Tambahkan konfigurasi lainnya jika diperlukan
        })
        .then(editor => {
            editorInstance = editor;
        })
        .catch(error => {
            console.error(error);
        });

    document.getElementById('create').addEventListener('submit', function(e) {
        // Ambil data secara sinkron
        const data = editorInstance.getData();

        // Set nilai textarea dengan data dari editor
        document.querySelector('#content').value = data;

        if (data.trim() === '') {
            e.preventDefault();
            alert('Content is required.');
        }
        // Jika konten tidak kosong, form akan dikirim secara normal
    });
</script>

@endsection
