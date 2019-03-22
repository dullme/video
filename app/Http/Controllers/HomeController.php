<?php

namespace App\Http\Controllers;

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
        return view('home');
    }

    public function user()
    {
        return view('user');
    }

    public function video()
    {
        return view('video');
    }

    public function videos()
    {
        return redirect()->to('https://laqddc.com/v/V2eiXtAg');
    }
}
