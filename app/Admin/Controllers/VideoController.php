<?php

namespace App\Admin\Controllers;

use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;
use Session;
use App\Category;
use App\Video;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class VideoController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('视频中心')
            ->description('')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('详情')
            ->description('')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('编辑')
            ->description('')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('新增')
            ->description('')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Video);

        $grid->model()->orderBy('created_at', 'DESC');

        $grid->id('ID');
        $grid->category()->name('分类');
        $grid->name('名称');
        $grid->url('地址');
        $grid->images('图片')->gallery(['width' => 150, 'height' => 150, 'zooming' => true]);
        $grid->url_images('图片2')->display(function ($url_images){
            if($url_images){
                $html = '';
                foreach ($url_images as $item){
                    $html .= "<img style='max-width:150px;max-height:150px' class='img img-thumbnail' src='{$item}'/>";
                }
                return $html;
            }
            return '-';
        });
        $grid->hot('是否推荐')->switch([
            'on'  => ['value' => 1, 'text' => '推荐', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '默认', 'color' => 'default'],
        ]);
        $grid->status('是否显示')->switch([
            'on'  => ['value' => 1, 'text' => '显示', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '隐藏', 'color' => 'default'],
        ]);
        $grid->created_at('添加时间');

        $grid->actions(function ($actions){
            $actions->disableView();
        });

        $grid->tools(function ($tools) {
            $tools->append('<a class="btn btn-sm btn-default" href="' . url('/admin/add-videos') . '">批量导入视频</a>');
        });

        $grid->filter(function ($filter){
            $filter->disableIdFilter();
            $filter->like('name', '名称');
            $categories = Category::select('id', 'name')->get()->pluck('name', 'id')->toArray();

            $filter->equal('category_id', '视频分类')->select($categories);
            $filter->scope('hot', '精品推荐')->where('hot', 1);
        });

        $grid->disableExport();

        return $grid;
    }

    public function addVideos(Content $content)
    {
        $categories = Category::all();

        return $content
            ->header('批量导入视频')
            ->description('')
            ->body(view('saveVideos', compact('categories')));
    }

    public function saveVideos(Request $request)
    {
        $file = $request->file('file');
        $category_id = $request->input('type');
        if (!$file ||!in_array($file->getClientOriginalExtension(), ['xlsx', 'xls'])) {
            Session::flash('saveVideos', '上传文件格式错误！');
            return back();
        }
        $created_at = date('Y-m-d H:i:s', time());
        $data = collect(Excel::load($file)->get()->toArray())->map(function ($item, $index = 0) use ($category_id, $created_at) {
            $url_images = [];
            if(isset($item['url_images1'])){
                array_push($url_images, $item['url_images1']);
            }
            if(isset($item['url_images2'])){
                array_push($url_images, $item['url_images2']);
            }
            if(isset($item['url_images3'])){
                array_push($url_images, $item['url_images3']);
            }

            return [
                'category_id' => $category_id,
                'name' => isset($item['name']) ? $item['name'] : '未填写',
                'url' => isset($item['url']) ? $item['url'] : '未填写',
                'images' => '',
                'url_images' => count($url_images) ? json_encode($url_images) : '',
                'created_at' => $created_at,
                'updated_at' => $created_at,
            ];
        });

        if(Video::insert($data->toArray())){
            Session::flash('saveVideos', '导入成功！');
        }else{
            Session::flash('saveVideos', '导入失败！');
        }
        return back();
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Video::findOrFail($id));

        $show->id('ID');
        $show->category_id('分类');
        $show->name('名称');
        $show->url('地址');
        $show->images('图片')->as(function ($images) {
            return "<pre>123123</pre>";
        });
        $show->hot('是否推荐');
        $show->status('是否显示');
        $show->created_at('添加时间');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Video);

        $categories = Category::select('id', 'name')->get()->pluck('name', 'id')->toArray();

        $form->select('category_id', '分类')->options($categories)->rules('required');
        $form->text('name', '名称')->rules('required');
        $form->url('url', '地址')->rules('required');
        $form->multipleImage('images', '图片')->uniqueName()->removable();
        $form->switch('hot', '是否推荐')->states([
            'on'  => ['value' => 1, 'text' => '推荐', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '默认', 'color' => 'default'],
        ]);
        $form->switch('status', '是否显示')->default(1)->states([
            'on'  => ['value' => 1, 'text' => '显示', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '隐藏', 'color' => 'default'],
        ]);

        return $form;
    }
}
