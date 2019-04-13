<?php

namespace App\Foundation;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;

trait SingleLoginAuthenticatesUsers
{

    /**
     * Send the response after the user was authenticated.
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    protected function sendLoginResponse(Request $request)
    {
        $request->session()->regenerate();

        $this->clearLoginAttempts($request);
        #这里来做登录后的操作
        $this->singleLogin($request);
        return $this->authenticated($request, $this->guard()->user())
            ?: redirect()->intended($this->redirectPath());
    }

    /**
     * 执行单用户登录, 存储必要数据
     * @param Request $request
     * @throws \Exception
     */
    protected function singleLogin(Request $request)
    {
        try {
            $timeStampNow = time();
//            $userLoginIp = $request->getClientIp();
            $user = Auth::user();
            $singleToken = md5($user->id . $timeStampNow);
            Redis::set('SINGLE_TOKEN_' . $user->id, $timeStampNow);
            session(['SINGLE_TOKEN' => $singleToken]);
        } catch (\Exception $exception) {
            throw new \Exception($exception);
        }
    }
}