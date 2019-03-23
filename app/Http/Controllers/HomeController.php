<?php

namespace App\Http\Controllers;

use App\Category;
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
}
