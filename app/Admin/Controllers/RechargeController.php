<?php

namespace App\Admin\Controllers;

use App\Recharge;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class RechargeController extends Controller
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
            ->header('充值管理')
            ->description('')
            ->body($this->grid());
    }


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Recharge);

        $grid->order_no('订单编号');
        $grid->user()->username('用户名');
        $grid->project()->name('充值类型');
        $grid->amount('充值金额')->display(function ($amount) {
            return '¥ ' . ($amount / 100);
        });
        $grid->status('充值状态')->display(function ($status) {
            $color = array_get(Recharge::$color, $status);
            $status = array_get(Recharge::$status, $status);

            return "<span class='badge bg-$color'>$status</span>";
        });
        $grid->created_at('充值时间');
        $grid->paid_at('成功时间');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('order_no', '订单编号');
            $filter->between('created_at', '充值时间')->datetime();
            $filter->between('paid_at', '成功时间')->datetime();
            $filter->scope('status', '已支付')->where('status', 'PAID');
        });

        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->disableRowSelector();
        $grid->disableActions();

        return $grid;
    }

}
