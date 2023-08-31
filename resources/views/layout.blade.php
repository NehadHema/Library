<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/style.css')}}">
    @yield('css')
    <title>@yield('title')</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse main-menu-item justify-content-end"
            id="navbarSupportedContent">
            <ul class="navbar-nav align-items-center">
                @guest
                <li class="nav-item active"><a class="nav-link" href="{{url('register')}}">Register</a></li>
                <li class="nav-item active"><a class="nav-link" href="{{url('login')}}">Login</a></li>
                 @endguest
             
                 @auth
                 <li class="nav-item active">
                    <form class="me-auto mt-5" action="{{url('logout')}}" method="post">
                        @csrf
                        <button type="submit" class="btn btn-danger">logout</button>
                    </form>
                 </li>
                 @endauth
             
            </ul>
        </div>
    </nav>
    @yield('content')

    <script src="{{asset('js/bootstrap.min.js')}}"></script>

</body>
</html>