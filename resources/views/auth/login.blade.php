@extends('layouts.app')

@section('style')
<style>
    body{
        overflow:hidden;
    }

    body #app{
        position:absolute;
        width:100%;
        height:100%;
        background-image:url('http://video.test/storage/1-1.jpeg');
        background-repeat: no-repeat;
        background-size:100% 100%;
    }
</style>
@endsection

@section('content')

<div class="py-4 container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header" style="text-align: center;font-size: 2rem">{{ config('login_text') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="username" class="col-md-4 col-form-label text-md-right">用户名</label>

                            <div class="col-md-6">
                                <input id="username" type="text" class="form-control{{ $errors->has('username') ? ' is-invalid' : '' }}" name="username" value="{{ old('username') }}" required autofocus oncopy="return false" onpaste="return false" oncut="return false">

                                @if ($errors->has('username'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">密码</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required oncopy="return false" onpaste="return false" oncut="return false">

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">验证码</label>

                            <div class="col-md-6">
                                <div class="input-group">
                                    <img src="{{captcha_src()}}" onclick="this.src='{{captcha_src()}}'+Math.random()">
                                    <input type="text" class="form-control{{ $errors->has('captcha') ? ' is-invalid' : '' }}" name="captcha">
                                    @if ($errors->has('captcha'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('captcha') }}</strong>
                                    </span>
                                    @endif
                                </div>

                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    登陆
                                </button>
                                <a style="margin-left: 10px;" href="{{ url('/register') }}">去注册</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
