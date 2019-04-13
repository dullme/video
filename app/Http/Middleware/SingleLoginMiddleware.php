<?php

namespace App\Http\Middleware;

use Carbon\Carbon;
use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;

class SingleLoginMiddleware
{

    /**
     * Handle an incoming request.
     * @param $request
     * @param Closure $next
     * @param null $guard
     * @return \Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->guest()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response('Unauthorized.', 401);
            } else {
                return redirect()->guest('/login');
            }
        }


        if ($this->isRelogin($request)) {
            //清空登录数据, 重定向
            $request->session()->flush();
            $request->session()->regenerate();
            return redirect()->guest('/login');
        }

        return $next($request);
    }

    /**
     * 判断用户是否 重复登录
     * @param $request
     * @return bool
     */
    protected function isRelogin($request)
    {
        $user = Auth::user();
        if ($user) {
            $cookieSingleToken = session('SINGLE_TOKEN');
            if ($cookieSingleToken) {
                // 从 Redis 获取 time
                $lastLoginTimestamp = Redis::get('SINGLE_TOKEN_' . $user->id);
                // 重新获取加密参数加密

//                $ip = $request->getClientIp();
                $redisSingleToken = md5($user->id . $lastLoginTimestamp);

                if ($cookieSingleToken != $redisSingleToken) {
                    //认定为重复登录了
                    return true;
                }
                return false;
            }
        }
        return false;
    }
}
