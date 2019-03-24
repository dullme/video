<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <!-- Styles -->
    <link href="{{ asset('css/swiper.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('font-awesome/css/font-awesome.css') }}" rel="stylesheet"/>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        {{--<nav class="navbar navbar-expand-md navbar-light navbar-laravel">--}}
            {{--<div class="container">--}}
                {{--<a class="navbar-brand" href="{{ url('/') }}">--}}
                    {{--{{ config('app.name', 'Laravel') }}--}}
                {{--</a>--}}
                {{--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">--}}
                    {{--<span class="navbar-toggler-icon"></span>--}}
                {{--</button>--}}

                {{--<div class="collapse navbar-collapse" id="navbarSupportedContent">--}}
                    {{--<!-- Left Side Of Navbar -->--}}
                    {{--<ul class="navbar-nav mr-auto">--}}

                    {{--</ul>--}}

                    {{--<!-- Right Side Of Navbar -->--}}
                    {{--<ul class="navbar-nav ml-auto">--}}
                        {{--<!-- Authentication Links -->--}}
                        {{--@guest--}}
                            {{--<li class="nav-item">--}}
                                {{--<a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>--}}
                            {{--</li>--}}
                            {{--@if (Route::has('register'))--}}
                                {{--<li class="nav-item">--}}
                                    {{--<a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>--}}
                                {{--</li>--}}
                            {{--@endif--}}
                        {{--@else--}}
                            {{--<li class="nav-item dropdown">--}}
                                {{--<a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>--}}
                                    {{--{{ Auth::user()->name }} <span class="caret"></span>--}}
                                {{--</a>--}}

                                {{--<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">--}}
                                    {{--<a class="dropdown-item" href="{{ route('logout') }}"--}}
                                       {{--onclick="event.preventDefault();--}}
                                                     {{--document.getElementById('logout-form').submit();">--}}
                                        {{--{{ __('Logout') }}--}}
                                    {{--</a>--}}

                                    {{--<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">--}}
                                        {{--@csrf--}}
                                    {{--</form>--}}
                                {{--</div>--}}
                            {{--</li>--}}
                        {{--@endguest--}}
                    {{--</ul>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</nav>--}}

        @if(config('announcement') != 'null')
        <div class="scroll_news" style="vertical-align: middle;padding: 10px 0">
            <marquee scrollamount="3" scrolldelay="0" direction="left" onmouseout="this.start()" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" onmouseover="this.stop()">
                <span class="text-danger">{{ config('announcement') }}</span>
            </marquee>
        </div>
        @endif

        <main class="py-4" style="margin-bottom: 2rem">
            @yield('content')
        </main>

        <footer>
            <nav id="homeBar">
                <a href="{{ url('/home') }}">
                    <span><i class="fa fa-heartbeat fa-lg"></i><br />精品推荐</span>
                </a>
                <a href="{{ url('/video') }}">
                    <span><i class="fa fa-youtube-play fa-lg"></i><br />视频中心</span>
                </a>
                <a href="{{ url('/user') }}">
                    <span><i class="fa fa-user-circle-o fa-lg"></i><br />我的信息</span>
                </a>
            </nav>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="{{ asset('js/swiper.min.js') }}"></script>
    <script src="{{ asset('js/app.js') }}"></script>

    <script>
        $(function () {
            var currentMenu = $('#homeBar a[href="'+window.location.origin + window.location.pathname+'"]:first');
            if (currentMenu) currentMenu.addClass('active');
            var mySwiper = new Swiper ('.swiper-container', {
                // loop: true,
                // autoplay: {
                //     delay: 4000,//4秒切换一次
                //     disableOnInteraction : false,
                // },
            })
        })
    </script>
    @yield('script')
</body>
</html>
