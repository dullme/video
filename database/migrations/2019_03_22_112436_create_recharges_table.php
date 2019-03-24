<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRechargesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recharges', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->unsigned();
            $table->integer('project_id')->unsigned();
            $table->string('order_no')->comment('订单编号');
            $table->string('channel')->nullable()->comment('支付渠道');
            $table->unsignedBigInteger('amount')->comment('充值金额');
            $table->string('status')->default('UNPAID')->comment('充值状态,PAID:已支付;UNPAID:未支付');
            $table->timestamp('paid_at')->nullable()->comment('支付成功时间');
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
        Schema::dropIfExists('recharges');
    }
}
