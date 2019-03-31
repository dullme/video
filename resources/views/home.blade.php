@extends('layouts.app')

@section('content')
    @include('layouts.announcement')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1>精品推荐</h1>
                <div class="video-lists">
                    @if($videos)
                        @foreach($videos as $video)
                            <div class="card card-video">
                                <div class="card-header" style="cursor: pointer" onclick="show({{ $video->id }})">
                                    <a>{{ $video->name }}</a>
                                    <a style="float: right"><i class="fa fa-play fa-lg"></i></a>
                                </div>
                                @if($video->images)
                                    <div class="card-body">
                                        <div class="swiper-container swiper-hot">
                                            <div class="swiper-wrapper">
                                                @foreach($video->images as $image)
                                                    <div class="swiper-slide"><img width="100%" src="{{ url('uploads/'.$image) }}"></div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background-color: #000000; min-height: 260px">
                <div class="prism-player" id="player-con"></div>
            </div>
        </div>
    </div>

    @include('layouts.footer')
@endsection

@section('script')
    <script>
        function show(id){
            axios.get('/videos/'+id).then(response=>{
                console.log(response.data)
                if(response.data.status == true){
                    this.videoPlayer(response.data.url)
                }else{
                    $('#player-con').html('<h1 style="color: white;text-align: center;line-height: 260px;">成为会员即可观看</h1>')
                    $('#exampleModal').modal('hide')
                }

            })
            $('#exampleModal').modal('show')
        }

        $('#exampleModal').on('hide.bs.modal', function () {
            $('.modal-content').html('<div class="prism-player" id="player-con"></div>');
        })

        $(function () {
            var mySwiper = new Swiper('.swiper-hot', {
                // loop: true,
                // autoplay: {
                //     delay: 4000,//4秒切换一次
                //     disableOnInteraction : false,
                // },
            })
        })

        function videoPlayer(url) {
            var player = cyberplayer("player-con").setup({
                width: "100%",
                height: 260,
                stretching: "uniform",
                file: url,
                autostart: true,
                repeat: false,
                volume: 100,
                controls: true,
                ak: '4668eda105344271a13de896a78f3fa6' // 公有云平台注册即可获得accessKey
            });
        }

    </script>
@endsection
