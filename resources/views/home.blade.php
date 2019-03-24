@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1>精品推荐</h1>
                <div class="video-lists">
                    @if($videos)
                        @foreach($videos as $video)
                            <div class="card card-video">
                                <div class="card-header video-url" style="cursor: pointer" data-url="{{ url('/videos/'.$video->id) }}">
                                    <a>{{ $video->name }}</a>
                                    <a style="float: right"><i class="fa fa-play fa-lg"></i></a>
                                </div>
                                @if($video->images)
                                    <div class="card-body">
                                        <div class="swiper-container">
                                            <div class="swiper-wrapper">
                                                @foreach($video->images as $image)
                                                    <div class="swiper-slide"><img width="100%" src="{{ url($image) }}"></div>
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
    </script>
@endsection
