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
            <div class="modal-content" style="background-color: #000000">
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
                this.aliPlayer(response.data)
            })

            $('#video-modal').attr('src', '/videos/'+id);
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

        function aliPlayer(url){
            var player = new Aliplayer({
                    "id": "player-con",
                    "source": url,
                    "width": "100%",
                    "height": "300px",
                    "autoplay": true,
                    "isLive": false,
                    "rePlay": false,
                    "playsinline": true,
                    "preload": true,
                    "controlBarVisibility": "hover",
                    "useH5Prism": true,
                    "components": [{
                        name: 'RotateMirrorComponent',
                        type: AliPlayerComponent.RotateMirrorComponent
                    }],
                    // "components": [{
                    //     "name": "1",
                    //     "type": "1",
                    //      //第一个参数是试看时长, 单位为分钟
                    //     /* 第二个参数可以传一个 Dom 字符串, 他将会替换默认的'试看已结束...'等文字 */
                    //     args: [1]
                    //   }],
                    "skinLayout": [
                        {
                            "name": "bigPlayButton",
                            "align": "blabs",
                            "x": 30,
                            "y": 80
                        },
                        {
                            "name": "H5Loading",
                            "align": "cc"
                        },
                        {
                            "name": "infoDisplay"
                        },
                        {
                            "name": "thumbnail"
                        },
                        {
                            "name": "controlBar",
                            "align": "blabs",
                            "x": 0,
                            "y": 0,
                            "children": [
                                {
                                    "name": "progress",
                                    "align": "blabs",
                                    "x": 0,
                                    "y": 44
                                },
                                {
                                    "name": "playButton",
                                    "align": "tl",
                                    "x": 15,
                                    "y": 12
                                },
                                {
                                    "name": "timeDisplay",
                                    "align": "tl",
                                    "x": 10,
                                    "y": 7
                                },
                                {
                                    "name": "fullScreenButton",
                                    "align": "tr",
                                    "x": 10,
                                    "y": 12
                                },
                                {
                                    "name": "volume",
                                    "align": "tr",
                                    "x": 5,
                                    "y": 10
                                }
                            ]
                        }
                    ]
                }, function (player) {
                    player._switchLevel = 0;
                    console.log("播放器创建了。");
                }
            );
        }
    </script>
@endsection
