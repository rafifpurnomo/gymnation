<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Carousel Settings</title>
    <link rel="stylesheet" href="{{ asset('css/adminCarousel.css') }}" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" />
</head>

<body>
    <nav class="navbar">
        <a href="/admin/Home" class="brand">selamat datang</a>
        
        <div class="nav-container">
            <div class="nav-links">
                <a href="/admin/carouselSettings" class="nav-item"> carousel </a>
                <a href="" class="nav-item"> Laporan </a>
                <a href="" class="nav-item"> Profil </a>
            </div>
        </div>
        <div class="logout-container">
            <a href="#" class="nav-item logout"> Logout </a>
        </div>
    </nav>
    <div class="tableData">
        <h1>Data Carousel</h1>
        <table id="carouselTable">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Foto</th>
                    <th>Title</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <div class="tambahCarousel">
        <button>Tambah Data Carousel</button>
    </div>

    <script src="{{ asset('js/adminCarousel.js') }}"></script>
    <script>
        window.apiData = {
            DataCarousel: @json($dataCarousel)
        };
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>
