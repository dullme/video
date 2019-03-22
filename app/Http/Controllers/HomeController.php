<?php

namespace App\Http\Controllers;

use App\Video;
use GuzzleHttp\Client;
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

    public function videos($id)
    {
        $video = Video::findOrFail($id);

        if(Auth()->user()->username != 'admin1'){
            $redirect_to = url('/');
        }

        $redirect_to = $video->url;

        return redirect()->to($redirect_to);
    }
}
