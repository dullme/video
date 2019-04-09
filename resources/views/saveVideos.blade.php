<div class="row">
    <div class="col-sm-12">
        <div class="box box-info">
            <div class="box-header" style="min-height: 45px">
                <a href="/admin/video" title="列表" class="btn btn-sm btn-default"><i class="fa fa-list"></i> <span class="hidden-xs">&nbsp;列表</span></a>
            </div>
            <form class="form-horizontal" action="/admin/add-videos" method="post" enctype="multipart/form-data">
                @csrf

                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-body">
                                <div class="fields-group">
                                    <div class="form-group"><label class="col-sm-2 control-label">类型</label>
                                        <div class="col-sm-8">
                                            <div class="input-group input-group-sm">
                                                <select class="form-control" name="type">
                                                    @foreach($categories as $category)
                                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="box-body">
                                <div class="fields-group">
                                    <div class="form-group"><label class="col-sm-2 control-label">文件</label>
                                        <div class="col-sm-8">
                                            <div class="input-group input-group-sm">
                                                <input type="file" name="file" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        @if(Session::has('saveVideos'))
                        <div class="col-md-12">
                            <div class="box-body">
                                <div class="fields-group">
                                    <div class="form-group"><label class="col-sm-2 control-label"></label>
                                        <div class="col-sm-8 text-danger">
                                                {{ Session::get('saveVideos') }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endif

                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <input class="btn btn-info pull-right" type="submit" value="导入">
                </div>
            </form>

        </div>
    </div>
</div>
