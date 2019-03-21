@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1>视频中心</h1>

                <div id="video-class" style="overflow: auto">
                    <div class="video-swiper-container">
                        <div class="swiper-wrapper" style="text-align: center">
                            <div class="swiper-slide"><a href="##">电视剧</a></div>
                            <div class="swiper-slide"><a href="##">电影</a></div>
                            <div class="swiper-slide"><a href="##">VIP精选</a></div>
                            <div class="swiper-slide"><a href="##">综艺</a></div>
                            <div class="swiper-slide"><a href="##">动漫</a></div>
                            <div class="swiper-slide"><a href="##">娱乐</a></div>
                            <div class="swiper-slide"><a href="##">体育</a></div>
                        </div>
                    </div>
                </div>

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

@section('script')
    <script>
        var mySwiper = new Swiper ('.video-swiper-container',  {
            pagination: '.swiper-pagination',
            paginationClickable: false,
            slidesPerView: 5,
            spaceBetween: 0,
        })
    </script>
@endsection
