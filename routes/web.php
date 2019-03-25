<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::group(['middleware' => 'auth.singleLogin'], function() {
    Route::get('/', 'HomeController@index');
    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/video', 'HomeController@video')->name('video');
    Route::get('/user', 'HomeController@user')->name('user');
    Route::get('/iframe/{id}', 'HomeController@iframe')->name('iframe');
    Route::get('/videos/{id}', 'HomeController@videos')->name('videos');
    Route::get('/videos-list/{id}', 'HomeController@videosList');
    Route::post('/suggest', 'HomeController@suggest');
    Route::post('/recharge', 'HomeController@recharge');
    Route::get('/call-back', 'HomeController@callBack');
});


