<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div>
                    <h1>视频中心</h1>
                    <div class="form-inline">
                        <input style="width: 80%; border-right: 0; border-radius: 0;" class="form-control" type="search" v-model="keyword" placeholder="输入您想看的电影" aria-label="Search">
                        <button v-on:click="searchVideo()" style="width: 20%;border-radius: 0;" class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                </div>

                <div id="video-class" style="margin-top: 1rem;overflow: auto;overflow-x:hidden" :class="is_search ? 'display-hidden' :''">
                    <div class="video-swiper-container">
                        <div class="swiper-wrapper" style="text-align: center">
                            <div v-for="item in category_list" class="swiper-slide" :class="current_category == item.id ? 'active':''">
                                <a v-on:click="getVideos(item.id)" style="cursor: pointer">{{ item.name }}</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="margin-top: 1rem" class="search-lists" v-if="is_search">
                    <div class="no-video" v-if="search_list.length == 0 && !search_loading">
                        <span>暂无视频</span>
                    </div>

                    <div class="card card-video" style="margin-bottom: 1rem" v-for="item in search_list">
                        <div style="cursor: pointer" v-on:click="videosGet(item.bfurl)">
                            <div class="card-header">
                                <a href="##" style="display:inline-block;width: 90%;overflow: hidden;word-break: keep-all;white-space: nowrap;text-overflow: ellipsis;">{{ item.name }}</a>
                                <a style="float: right"><i class="fa fa-play fa-lg"></i></a>
                            </div>
                        </div>
                    </div>

                </div>
                <div v-else class="video-lists">
                    <div class="no-video" v-if="videos.length == 0 && !loading">
                        <span>暂无视频</span>
                    </div>
                    <div class="card card-video" v-for="item in videos">
                        <div style="cursor: pointer" v-on:click="show( item.id)">
                            <div class="card-header">
                                <a href="##">{{ item.name }}</a>
                                <a style="float: right"><i class="fa fa-play fa-lg"></i></a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="swiper-container swiper-videos">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide" v-for="image in item.images"><img width="100%" :src="'uploads/'+image"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="text-align: center; padding: 1rem 0" v-if="is_search">
                    <span class="btn btn-default" v-if="search_loading"><i class="fa fa-spinner fa-pulse"></i></span>
                    <a style="cursor: pointer" class="btn btn-default" v-on:click="searchNext()" v-else-if="search_list.length < search_list_total">点击加载更多</a>
                </div>

                <div style="text-align: center; padding: 1rem 0" v-else>
                    <span class="btn btn-default" v-if="loading"><i class="fa fa-spinner fa-pulse"></i></span>
                    <a style="cursor: pointer" class="btn btn-default" v-on:click="more()" v-else-if="current_page != last_page">点击加载更多</a>
                </div>

                <div style="text-align: center; padding: 1rem 0" v-if="is_search && !search_loading && search_list.length >= search_list_total && search_list.length!=0">
                    <span style="color: #00000012;">——————&nbsp;&nbsp;&nbsp;&nbsp;我是有底线的&nbsp;&nbsp;&nbsp;&nbsp;——————</span>
                </div>

                <div style="text-align: center; padding: 1rem 0" v-if="!is_search && current_page == last_page && videos.length !=0">
                    <span style="color: #00000012;">——————&nbsp;&nbsp;&nbsp;&nbsp;我是有底线的&nbsp;&nbsp;&nbsp;&nbsp;——————</span>
                </div>


            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="background-color: #000000;min-height: 260px">
                    <div class="prism-player" id="player-con"></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                videos :[],
                current_category :'',
                current_page :1, //当前页
                last_page :1, //总页数
                next_page_url :'', //下一页
                category_list :[],
                loading :false,
                search_loading :false,
                keyword :'',
                search_list:[],
                search_list_total:'',
                search_list_page:1,
                is_search:false
            }
        },

        props: [
            'categories',
        ],

        created() {
            this.category_list = JSON.parse(this.categories);
            this.current_category = this.category_list[0].id
            this.getVideos(this.current_category)
        },

        mounted() {
            $('#exampleModal').on('hide.bs.modal', function () {
                $('.modal-content').html('<div class="prism-player" id="player-con"></div>');
            })

            new Swiper ('.video-swiper-container',  {
                pagination: '.swiper-pagination',
                paginationClickable: false,
                slidesPerView: 5,
                spaceBetween: 0,
            })
        },

        methods: {
            getVideos(id, next){
                this.loading = true;
                if(this.current_category != id){
                    this.current_category = id;
                    this.videos = [];
                }

                let path= "/videos-list/" + id

                if(!next){
                    this.videos = [];
                }

                if(next && (this.current_page + 1) <= this.last_page){
                    path += "/?page=" + (this.current_page + 1)
                }

                axios.get(path).then(response => {
                    this.current_page = response.data.current_page //当前页
                    this.last_page = response.data.last_page //总页数
                    this.next_page_url = response.data.next_page_url //下一页
                    if(this.current_page == this.last_page){
                        this.underline = true;
                    }

                    let videos = response.data.data;
                    videos.forEach((video) => {
                        this.videos.push(video);
                    })
                    this.loading = false;
                    this.$nextTick(()=>{
                        var mySwiper = new Swiper('.swiper-videos')
                    })
                }).catch(error => {
                    console.log(error.response.data);
                    this.loading = false;
                });
            },

            show(id){
                axios.get('/videos/'+id).then(response=>{
                    if(response.data.status == true){
                        this.videoPlayer(response.data.url)
                    }else{
                        $('#player-con').html('<h1 style="color: white;text-align: center;line-height: 260px;">成为会员即可观看</h1>')
                        $('#exampleModal').modal('hide')
                    }
                })

                $('#exampleModal').modal('show')
            },

            more(){
                this.getVideos(this.current_category, true)
            },

            videoPlayer(url) {
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
            },

            searchVideo(){
                this.search_list = [];
                this.search_list_total='';
                this.search_list_page=1;
                this.is_search = true;
                this.search_loading = true;
                axios.post('/search-video', {
                    'keyword':this.keyword,
                    'page':1,
                }).then(response=>{
                    this.search_loading = false;

                    if(response.data){
                        this.search_list_total = response.data.total

                        let videos = response.data.list;
                        videos.forEach((video) => {
                            this.search_list.push(video);
                        })
                    }else{
                        this.search_list = [];
                    }
                }).catch(error => {
                    console.log(error.response.data);
                    this.search_loading = false;
                });
            },

            searchNext(){
                if(this.search_list.length < this.search_list_total){
                    this.search_list_page = this.search_list_page + 1

                    this.is_search = true;
                    this.search_loading = true;
                    axios.post('/search-video', {
                        'keyword':this.keyword,
                        'page':this.search_list_page,
                    }).then(response=>{
                        this.search_loading = false;

                        if(response.data){
                            let videos = response.data.list;
                            videos.forEach((video) => {
                                this.search_list.push(video);
                            })
                        }
                    }).catch(error => {
                        console.log(error.response.data);
                        this.search_loading = false;
                    });
                }
            },

            videosGet(url){
                $('#exampleModal').modal('show')

                axios.post('/video-get',{
                    'url' : url
                }).then(response=>{
                    if(response.data.status == true){
                        this.videoPlayer(response.data.uri)
                    }else{
                        $('#player-con').html('<h1 style="color: white;text-align: center;line-height: 260px;">成为会员即可观看</h1>')
                        $('#exampleModal').modal('hide')
                    }
                }).catch(error => {
                    console.log(error.response.data);
                });
            }


        }
    }
</script>
