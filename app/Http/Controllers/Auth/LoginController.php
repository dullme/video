<?php

namespace App\Http\Controllers\Auth;

use App\Foundation\SingleLoginAuthenticatesUsers;
use App\Http\Controllers\Controller;
use App\User;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers, SingleLoginAuthenticatesUsers{
        SingleLoginAuthenticatesUsers::sendLoginResponse insteadof AuthenticatesUsers;
    }

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function username()
    {
        return 'username';
    }

    protected function validateLogin(Request $request)
    {
        $request->validate([
            $this->username() => 'required|string',
            'password' => 'required|string',
            'captcha' => 'required|captcha',
        ]);
    }

    public function login(Request $request)
    {
        $this->validateLogin($request);

        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.
        if ($this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);

            return $this->sendLockoutResponse($request);
        }


        $user = User::where('username', strtoupper($request->input('username')))->first()->makeVisible('password');
        if(md5($request->input('password')) == $user->password){
            if($user->type == 1 && $user->expire_at == null && $user->first_login == null){
                $user->first_login = Carbon::now();
                $user->expire_at = Carbon::now()->addDays($user->validity_period);
                $user->save();
            }elseif($user->first_login == null){
                $user->first_login = Carbon::now();
                $user->save();
            }

            \Auth::login($user);

            return $this->sendLoginResponse($request);
        }
//        
//
//        if ($this->attemptLogin($request)) {
//
//            return $this->sendLoginResponse($request);
//        }

        // If the login attempt was unsuccessful we will increment the number of attempts
        // to login and redirect the user back to the login form. Of course, when this
        // user surpasses their maximum number of attempts they will get locked out.
        $this->incrementLoginAttempts($request);

        return $this->sendFailedLoginResponse($request);
    }
}
