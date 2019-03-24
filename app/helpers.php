<?php

/**
 * 生成订单号
 * @param $id
 * @return string
 */
function makeOrderNumber($id){
    return $id.'U'.rand(1000000000,time());
}
