<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1>视频中心</h1>

                <div id="video-class" style="margin-top: 1rem;overflow: auto;overflow-x:hidden">
                    <div class="video-swiper-container">
                        <div class="swiper-wrapper" style="text-align: center">
                            <div v-for="item in category_list" class="swiper-slide" :class="current_category == item.id ? 'active':''">
                                <a v-on:click="getVideos(item.id)" style="cursor: pointer">{{ item.name }}</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="video-lists">
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

                <div style="text-align: center; padding: 1rem 0">
                    <span class="btn btn-default" v-if="loading"><i class="fa fa-spinner fa-pulse"></i></span>
                    <a style="cursor: pointer" class="btn btn-default" v-on:click="more()" v-else-if="current_page != last_page">点击加载更多</a>
                </div>

                <div style="text-align: center; padding: 1rem 0" v-if="current_page == last_page && videos.length !=0">
                    <span style="color: #00000012;">——————&nbsp;&nbsp;&nbsp;&nbsp;我是有底线的&nbsp;&nbsp;&nbsp;&nbsp;——————</span>
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
                $('#video-modal').attr('src', '');
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
                $('#video-modal').attr('src', '/videos/'+id);
                $('#exampleModal').modal('show')
            },

            more(){
                this.getVideos(this.current_category, true)
            }


        }
    }
</script>
