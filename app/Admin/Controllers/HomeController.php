<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Recharge;
use App\Suggest;
use App\User;
use App\Video;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\InfoBox;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        $content->row(function ($row) {
            $users = User::all()->count();
            $videos = Video::all()->count();
            $recharge = Recharge::where('status', 'PAID')->sum('amount');
            $suggests = Suggest::all()->count();

            $row->column(3, new InfoBox('会员总数', 'users', 'aqua', '/admin/user', $users));
            $row->column(3, new InfoBox('视频总数', 'video-camera', 'green', '/admin/video', $videos));
            $row->column(3, new InfoBox('充值总金额', 'cc-visa', 'yellow', '/admin/recharge', $recharge/100));
            $row->column(3, new InfoBox('意见建议', 'file', 'red', '/admin/suggest', $suggests));
        });

        return $content;
    }
}
