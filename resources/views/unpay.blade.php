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
    <p style="margin-top: 4rem;text-align:center;font-size:4rem;">
{{--        <img src="{{ asset('images/success.png') }}">--}}
        <i class="fa fa-exclamation-circle text-danger" aria-hidden="true"></i>
    </p>
    <p style="text-align:center;font-size:1rem;color:#212121;">
        您已取消此次支付
    </p>
    <p style="margin-top: 2rem;text-align:center;font-size:1rem;color:#212121;">
        <a class="btn btn-primary" href="{{ url('/user') }}">返回</a>
    </p>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}"></script>
    @yield('script')
</body>
</html>
