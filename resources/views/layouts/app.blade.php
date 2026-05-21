<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMIS Pro</title>

    <!-- BOOTSTRAP 5 CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>

<body>

<div class="app-wrapper d-flex">

    <!-- SIDEBAR -->
    <div class="sidebar">
        @include('partials.sidebar')
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content flex-grow-1 p-3">

        

        @if(session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        <!-- PAGE CONTENT -->
        <div class="content">
            @yield('content')
        </div>

    </div>

</div>

<!-- BOOTSTRAP JS BUNDLE -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- YOUR JS -->
<script src="{{ asset('js/app.js') }}"></script>
<script src="{{ asset('js/personnel.js') }}"></script>

</body>
</html>