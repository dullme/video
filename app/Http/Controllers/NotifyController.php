<?php
/**
 * Created by PhpStorm.
 * User: jinjialei
 * Date: 2019-03-26
 * Time: 17:05
 */

namespace App\Http\Controllers;

use App\Recharge;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Log;
use DB;

class NotifyController
{

    /**
     * 异步回调
     * @param Request $request
     */
    public function notify(Request $request)
    {

        Log::info(json_encode($request->all(),true));

        //订单号
        $order_no = $_POST['playerId'];
        $goods_id = $_POST['goodsId'];
        $sign = $_POST['sign'];
        $amount = $_POST['payPrice'];
        $paid_at = Carbon::now();

        if($this->verify($order_no, $goods_id) == $sign){   //验签成功
            $recharge = Recharge::with('project')->where('order_no', $order_no)->first();
            if($recharge){
                DB::beginTransaction(); //开启事务

                $user_id = $recharge->user_id;
                if($recharge->amount != $amount){
                    Log::info('验签成功但金额不对---------------'.json_encode($request->all(),true));
                    exit('error!');
                }
                $recharge->status = 'PAID';
                $recharge->paid_at = $paid_at;
                $saveRecharge = $recharge->save();

                $user = User::find($user_id);
                if(is_null($user->expire_at) || $user->expire_at <= Carbon::now()){
                    $user->expire_at = Carbon::now()->addDays($recharge->project->day);
                }else{
                    $expire_at = Carbon::createFromFormat('Y-m-d H:i:s', $user->expire_at);
                    $user->expire_at = $expire_at->addDays($recharge->project->day);
                }

                $saveUser = $user->save();

                if(!$saveUser || !$saveRecharge){
                    DB::rollBack(); //回滚
                    Log::info('验签成功保存失败---------------'.json_encode($request->all(),true));
                    echo "fail";
                }

                DB::commit();   //保存
                echo "success";//验证成功
            }else{
                Log::info('验签成功但找不到该笔订单---------------'.json_encode($request->all(),true));
                echo "fail";
            }
        }else{//验签失败
            Log::info('验签失败---------------'.json_encode($request->all(),true));
            echo "fail";
        }
    }

    public function verify($order_no, $goods_id)
    {
        return md5(config('secret_key') . $order_no . $goods_id);
    }
}
