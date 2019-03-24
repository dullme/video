<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Recharge extends Model
{
    protected $fillable = [
        'user_id',
        'project_id',
        'order_no',
        'amount',
        'status',
        'channel',
        'paid_at'
    ];

    static $color = ['PAID' => 'green', 'UNPAID' => 'darkgrey'];
    static $status = ['PAID' => '已支付','UNPAID' => '未支付'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
