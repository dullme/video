<?php

namespace App\Http\Controllers;

use App\Category;
use App\Project;
use App\Recharge;
use App\Suggest;
use App\Video;
use Carbon\Carbon;
use http\Env\Response;
use Session;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $videos = Video::where('hot', 1)->where('status', 1)->orderBy('created_at', 'DESC')->get();

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
        if(is_null(Auth()->user()->expire_at) || Auth()->user()->expire_at <= Carbon::now()){
            return response()->json([
                'status' => false,
                'url' => '',
            ]);
        }

        $video = Video::findOrFail($id);

        $redirect_to = $video->url;

        return response()->json([
            'status' => true,
            'url' => $redirect_to,
        ]);
    }

    public function videosList($id)
    {
        $videos_list = Video::where('category_id', $id)->where('status', 1)->orderBy('created_at', 'DESC')->paginate(20);

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

    public function tencent()
    {
        return view('tencent');
    }

    public function unpay()
    {
        return view('unpay');
    }

    public function searchVideo(Request $request)
    {
        $keyword = trim($request->input('keyword'));
        $page = intval($request->input('page'));
        set_time_limit(0);

        $url = "https://www.35pan.com/plaza/search/'" . urlencode($keyword) . "'/1/10";

        $pattern_find = '/<table([\s\S]+?)<\/table>/i';
        $pattern_replace = '/\s{2,}|\n|<br>| class="O3_8h_dn"/i';

        $html = file_get_contents($url);
        $reg = "/<a href=\"javascript:search_query((.*),(.*))\" >/i";
        if(preg_match($reg, $html, $on)){
            preg_match($reg, $html, $on);
            $num = str_replace(")", "", $on[3]);

            if (!$num) {
                $reg = "/<a href=\"javascript:search_query((.*),(.*))\">\d+<\/a>/i";
                preg_match($reg, $html, $on);
                $num = str_replace(")", "", $on[3]);
            }

            if (!$num) {
                $num = 1;
            }
            $data = ['number' => 0, 'list' => [], 'code' => '200', 'total' => $num];
            if ($page > $num) {
                echo json_encode(['code' => '201', 'msg' => '最大页数为' . $num], JSON_UNESCAPED_UNICODE);
                die();
            }
            // for ($i = 1; $i <= $num; $i++) {
            $url = "https://www.35pan.com/plaza/search/'" . urlencode($keyword) . "'/" . $page . "/10";
            // echo $url;die();
            $gtd = new SearchController($url, $pattern_find, $pattern_replace, '');
            $result = $gtd->getTableJson();
            $result = $result[1];
            unset($result[0]);
            $data['number'] = $data['number'] + count($result);

            foreach ($result as $k => $r) {
                $rule = '/<a href="(.*)" target="_blank"><i class="fa fa-file fa-lg"><\/i>(.*)<\/a>/i';
                preg_match($rule, $r[1], $match);
                $name = trim($match[2]);
                $url = trim($match[1]);
                //如果需要flash地址一起返回，则用下面地址
                // --------------------------------------------------
                // $ret = @file_get_contents($url);
                // $rule2 = '/var huiid = "(.*)";/';
                // preg_match($rule2, $ret, $match2);
                // $uri = $match2[1];
                // $data['list'][] = ['name' => $name, 'url' => $uri,'bfurl '=>$url ];
                // --------------------------------------------------
                // 只返回flash播放地址，由真正播放时去解析出m3u8地址，减少采集时不必要的正则消耗
                $data['list'][] = ['name' => $name, 'bfurl' => $url];
            }

            return response()->json($data);
        }else{
            return response()->json(false);
        }

    }

    function videoGet(Request $request){
        $url = $request->input('url');
        $ret = @file_get_contents($url);
        $rule2 = '/var huiid = "(.*)";/';
        preg_match($rule2, $ret, $match2);
        $uri = $match2[1];

        return response()->json([
            'status' => true,
            'uri' => $uri,
        ]);
    }
}
