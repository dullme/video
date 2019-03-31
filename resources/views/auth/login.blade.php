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
        background-image:url('{{ config('login_image') }}');
        background-repeat: no-repeat;
        background-size:100% 100%;
    }
</style>
@endsection

@section('content')

<div class="py-4 container">
    <div class="row justify-content-center">
        <div class="col-md-8 news">
            <div class="card">
                <div class="card-header" style="text-align: center;font-size: 2rem;color: white">{{ config('login_text') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend"><i class="fa fa-user"></i></span>
                                    </div>
                                    <input id="username" type="text" class="form-control{{ $errors->has('username') ? ' is-invalid' : '' }}" name="username" value="{{ old('username') }}" required autofocus oncopy="return false" onpaste="return false" oncut="return false" placeholder="用户名">
                                    @if ($errors->has('username'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend"><i class="fa fa-unlock-alt"></i></span>
                                    </div>
                                    <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required oncopy="return false" onpaste="return false" oncut="return false" placeholder="密码">
                                    @if ($errors->has('password'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <img src="{{captcha_src()}}" onclick="this.src='{{captcha_src()}}'+Math.random()">
                                    </div>
                                    <input type="text" class="form-control{{ $errors->has('captcha') ? ' is-invalid' : '' }}" name="captcha" placeholder="验证码">
                                    @if ($errors->has('captcha'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('captcha') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-12 text-right">
                                <button type="submit" class="btn btn-primary btn-block">
                                    登陆
                                </button>
                                <a style="display: block;margin-top: 1rem;color: white;" href="{{ url('/register') }}">去注册</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
