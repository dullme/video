@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1>会员中心</h1>
                <div class="form-group row">
                    <label for="name" class="col-md-4 col-form-label text-md-right">账号:</label>
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="form-control" style="background-color: #ced4da;">{{ Auth()->user()->username }}</span>
                            <span class="input-group-btn">
                                <a href="{{ route('logout') }}" class="btn btn-dark" style="color: #FFFFFF;border-bottom-left-radius: 0;border-top-left-radius: 0" onclick="event.preventDefault();document.getElementById('logout-form').submit();">注销</a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-md-4 col-form-label text-md-right">首次登陆时间:</label>
                    <div class="col-md-6">
                        <span class="form-control" style="background-color: #ced4da;">{{ Auth()->user()->first_login }}</span>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-md-4 col-form-label text-md-right">账号到期时间:</label>
                    <div class="col-md-6">
                        <span class="form-control" style="background-color: #ced4da;">{{ Auth()->user()->expire_at }}</span>
                    </div>
                </div>
                @if(config('recharge') != 'off')
                    <form action="{{ url('/recharge') }}" method="POST" style="margin-bottom: 1rem">
                        @csrf
                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">续费:</label>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control" style="border-right: 0;" name="project">
                                        @foreach($project as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-success" style="color: #FFFFFF;border-bottom-left-radius: 0;border-top-left-radius: 0">前往续费</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </form>
                @endif
                <form action="{{ url('/suggest') }}" method="POST" style="margin-bottom: 1rem">
                    @csrf
                    <div class="form-group row">
                        <label for="name" class="col-md-4 col-form-label text-md-right">意见或建议:
                            @if(Session::has('suggest'))
                                <span class="text-danger">{{ Session::get('suggest') }}</span>
                            @endif
                        </label>
                        <div class="col-md-6">
                            <textarea class="form-control{{ $errors->has('content') ? ' is-invalid' : '' }}" rows="6" name="content">{{ old('content') }}</textarea>
                            @if ($errors->has('content'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('content') }}</strong>
                                    </span>
                            @endif
                        </div>
                    </div>
                    <div class="form-group row mb-0">
                        <div class="col-md-6 offset-md-4">
                            <button type="submit" class="btn btn-primary btn-block">
                                提交
                            </button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
@endsection
