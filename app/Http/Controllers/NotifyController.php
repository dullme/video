<?php
/**
 * Created by PhpStorm.
 * User: jinjialei
 * Date: 2019-03-26
 * Time: 17:05
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Log;

class NotifyController
{

    /**
     * 异步回调
     * @param Request $request
     */
    public function notify(Request $request)
    {

        Log::info(json_encode($request->all(),true));

//        //订单号
//        $out_trade_no = $_POST['playerId'];
//        $out_trade_no = substr($out_trade_no,0,strpos($out_trade_no, '-'));
//        //支付金额/分
//        $payPrice = $_POST['payPrice'];
//        // if($payPrice <> '39900'){
//        // 	exit('error!');
//        // }
//
//        $type="支付宝"; //支付方式
//
//        echo "success";//验证成功
//        exit();
//        echo "fail";//验证失败
    }
}
