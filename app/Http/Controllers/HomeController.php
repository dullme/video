<?php

namespace App\Http\Controllers;

use App\Category;
use App\Project;
use App\Recharge;
use App\Suggest;
use App\Video;
use Carbon\Carbon;
use Session;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $videos = Video::where('hot', 1)->where('status', 1)->get();

        return view('home', compact('videos'));
    }

    public function user()
    {
        $project = Project::all();

        return view('user', compact('project'));
    }

    public function video()
    {
        $categories = Category::where('status', 1)->select('id', 'name')->get();

        return view('video', compact('categories'));
    }

    public function videos($id)
    {
        $video = Video::findOrFail($id);

        $redirect_to = $video->url;

        return redirect()->to($redirect_to);
    }

    public function videosList($id)
    {
        $videos_list = Video::where('category_id', $id)->where('status', 1)->simplePaginate(3);

        return response()->json($videos_list);
    }

    /**
     * 意见建议
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function suggest(Request $request)
    {
        $request->validate([
            'content' => 'required|min:5|max:255'
        ]);

        $suggest = Suggest::where('user_id', Auth()->user()->id)
            ->where('created_at', '>=', Carbon::today())
            ->where('created_at', '<=', Carbon::tomorrow())
            ->count();

        if($suggest >= 1){
            Session::flash('suggest', '您今天已提交过意见或建议了！');
        }else{
            $suggest = Suggest::create([
                'user_id' => Auth()->user()->id,
                'content' => $request->input('content'),
            ]);

            if($suggest){
                Session::flash('suggest', '提交成功！');
            }
        }

        return redirect()->to(url('/user'));
    }

    /**
     * 续费会员
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function recharge(Request $request)
    {
        $request->validate([
            'project' => 'required'
        ]);

        $project = Project::findOrFail($request->input('project'));
        $order_no = makeOrderNumber(Auth()->user()->id);//订单编号
        $amount = $project->amount;//支付金额

        $recharge = Recharge::create([
            'user_id' => Auth()->user()->id,
            'project_id' => $project->id,
            'order_no' => $order_no,
            'amount' => $amount,
            'status' => 'UNPAID',//未支付
        ]);

        if($recharge){
            $call_back = url('/call-back');//支付成功同步回调地址
            $goods_name = $project->name;//支付成功同步回调地址
            $app_id = config('appid');//appId
            $alipay_real_name = config('alipay_real_name');//收款支付宝实名

            $url = "/pay-page-any/ddpay.html?playerId={$order_no}&payTo=alipay_any&appId={$app_id}&goodsName={$goods_name}&alipayRealName={$alipay_real_name}&goodsPrice={$amount}&succOpenUrl={$call_back}";

            return redirect()->to(url($url));
        }else{

            return redirect()->back();
        }
    }

    /**
     * 同步回调
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function callBack()
    {
        return view('callBack');
    }

    /**
     * 异步回调
     */
    public function notify()
    {
        //订单号
        $out_trade_no = $_POST['playerId'];
        $out_trade_no = substr($out_trade_no,0,strpos($out_trade_no, '-'));
        //支付金额/分
        $payPrice = $_POST['payPrice'];
        // if($payPrice <> '39900'){
        // 	exit('error!');
        // }

        $type="支付宝"; //支付方式

        echo "success";//验证成功
        exit();
        echo "fail";//验证失败
    }
}
