<?php

namespace App\Admin\Controllers;

use App\User;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class UserController extends Controller
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
            ->header('会员管理')
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
            ->body($this->createForm());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);
        $grid->model()->orderBy('created_at', 'DESC');
        $grid->id('ID');
        $grid->username('用户名');
        $grid->type('账号来源')->display(function ($type) {
            return $type == 0 ? '主动注册' : '后台生成';
        });
        $grid->real_password('初始密码')->display(function ($real_password) {
            return is_null($real_password) ? '-' : $real_password;
        });
        $grid->column('status', '有效期')->display(function () {
            if(is_null($this->expire_at)){
                return "<span class='badge bg-gray'>未激活</span>";
            }elseif ($this->expire_at > Carbon::now()){
                return "<span class='badge bg-green'>未到期</span>";
            }else{
                return "<span class='badge bg-red'>已过期</span>";
            }
        });
        $grid->expire_at('有效期');
        $grid->first_login('首次登陆时间');
        $grid->created_at('添加时间');
        $grid->remarks('备注');
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('username', '用户名');
            $filter->like('remarks', '备注');
            $filter->between('expire_at', '有效期')->datetime();
            $filter->between('created_at', '添加时间')->datetime();
            $filter->scope('type', '后台生成')->where('type', 1);
        });
        $grid->disableExport();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(User::findOrFail($id));

        $show->id('Id');
        $show->username('用户名');
        $show->remarks('备注');
        $show->expire_at('有效期');
        $show->first_login('激活时间');
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
        $form = new Form(new User);

        $form->text('username', '用户名');
        $form->text('remarks', '备注');
        $form->datetime('expire_at', '有效期')->default(date('Y-m-d H:i:s'));
        $form->password('password', '密码')->rules('required|confirmed')
            ->default(function ($form) {
                return $form->model()->password;
            });
        $form->password('password_confirmation', '确认密码')->rules('required')
            ->default(function ($form) {
                return $form->model()->password;
            });
        $form->ignore(['password_confirmation']);
        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = md5($form->password);
            }
        });

        return $form;
    }

    protected function createForm()
    {
        $form = new Form(new User);

        $form->number('number', '新增用户数量')->rules('required|integer|min:1|max:1000')->default(500);
        $form->number('validity_period', '有效期限/天')->rules('required|integer|min:1')->default(3);
        $form->text('remarks', '备注')->rules('required|string|min:1');

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        $form->disableViewCheck();
        $form->disableEditingCheck();

        return $form;
    }

    public function store(Request $request)
    {
        $request->validate([
            'number'          => 'required|integer|min:1|max:100000',
            'validity_period' => 'required|integer|min:1',
            'remarks' => 'required|string|min:1',
        ]);
        $datetime = Carbon::now()->toDateTimeString();
        for ($i = 0; $i < $request->get('number'); $i++) {
            $username = makeAccount();
            $password = random_int(100000, 999999);
            $data[$i]['username'] = $username;
            $data[$i]['nickname'] = $username;
            $data[$i]['password'] = md5($password);
            $data[$i]['real_password'] = $password;
            $data[$i]['remarks'] = $request->get('remarks');
            $data[$i]['created_at'] = $datetime;
            $data[$i]['updated_at'] = $datetime;
            $data[$i]['type'] = 1;
            $data[$i]['validity_period'] = $request->get('validity_period');
        }

        $data = collect($data)->unique();
        $username_list = $data->pluck('username');

        $users = User::whereIn('username', $username_list->toArray())->pluck('username');
        if(count($users)){
            $data = $data->whereNotIn('username', $users);
        }


        User::insert($data->toArray());
        $count = count($data);
        admin_toastr("创建成功{$count}个账号", 'success');
    }
}
