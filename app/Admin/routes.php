<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->resource('user', UserController::class);
    $router->resource('category', CategoryController::class);
    $router->resource('project', ProjectController::class);
    $router->resource('recharge', RechargeController::class);
    $router->resource('video', VideoController::class);

});
