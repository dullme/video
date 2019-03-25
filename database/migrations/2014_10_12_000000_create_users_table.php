<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('username')->unique();
            $table->string('nickname')->nullable();
            $table->string('password');
            $table->integer('type')->default(0)->comment('类型0主动注册;1后台生成');
            $table->integer('validity_period')->default(0)->comment('有效期/天');
            $table->string('real_password')->nullable()->comment('系统生成的初始密码');
            $table->string('remarks')->comment('备注');
            $table->timestamp('first_login')->nullable();
            $table->timestamp('expire_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
