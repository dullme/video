@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1>视频中心</h1>

                <div id="video-class" style="margin-top: 1rem;overflow: auto;overflow-x:hidden">
                    <div class="video-swiper-container">
                        <div class="swiper-wrapper" style="text-align: center">
                            <div class="swiper-slide active"><a href="##">电视剧</a></div>
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
                        <a class="video-url" data-url="https://hkwycc.com/v/V2eiXtAg" style="float: right"><i class="fa fa-play fa-lg"></i></a>
                    </div>
                    <div class="card-body">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/1-1.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/1-2.jpeg') }}"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-video">
                    <div class="card-header">
                        <a href="##">新喜剧之王</a>
                        <a class="video-url" data-url="https://www.baidu.com" style="float: right"><i class="fa fa-play fa-lg"></i></a>
                    </div>
                    <div class="card-body">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/2-1.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/2-2.jpeg') }}"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-video">
                    <div class="card-header">
                        <a href="##">流浪地球</a>
                        <a href="##" style="float: right"><i class="fa fa-play fa-lg"></i></a>
                    </div>
                    <div class="card-body">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/3.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/4.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/1.jpeg') }}"></div>
                                <div class="swiper-slide"><img width="100%" src="{{ asset('images/2.jpeg') }}"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background-color: #000000">
                <iframe id="video-modal" src="" width="100%" style="border: none"></iframe>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        $('.video-url').on('click', function () {
            $('#video-modal').attr('src', this.dataset.url);
            $('#exampleModal').modal('show')
        })

        $('#exampleModal').on('hide.bs.modal', function () {
            $('#video-modal').attr('src', '');
        })

        var mySwiper = new Swiper ('.video-swiper-container',  {
            pagination: '.swiper-pagination',
            paginationClickable: false,
            slidesPerView: 5,
            spaceBetween: 0,
        })
    </script>
@endsection
