@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1>我的信息</h1>
                <div class="card card-video">
                    <div class="card-header">
                        <a href="##">流浪地球</a>
                        <a href="##" style="float: right">播放</a>
                    </div>

                    <div class="card-body" style="padding: 0">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/1.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/2.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/3.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/4.jpeg') }}"></div>
                            </div>
                        </div>
                        {{--<img width="100%" src="https://source.unsplash.com/random">--}}
                    </div>
                </div>

                <div class="card card-video">
                    <div class="card-header">
                        <a href="##">流浪地球</a>
                        <a href="##" style="float: right">播放</a>
                    </div>

                    <div class="card-body" style="padding: 0">
                        <img width="100%" src="https://source.unsplash.com/random/800x600">
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
