<?php

/**
 * 生成订单号
 * @param $id
 * @return string
 */
function makeOrderNumber($id){
    return $id.'U'.rand(1000000000,time());
}

/**
 * 生成账号
 * @return string
 */
function makeAccount() {
    $code = 'ABCDEFGHJKLMNPQRSTUVWXY';
    $rand = $code[rand(0,22)]
        .strtoupper(dechex(date('m')))
        .date('d')
        .substr(time(),-5)
        .substr(microtime(),2,5)
        .sprintf('%02d',rand(0,99));
    for(
        $a = md5( $rand, true ),
        $s = '123456789ABCDEFGHJKLMNPQRSTUVWXY',
        $d = '',
        $f = 0;
        $f < 6;
        $g = ord( $a[ $f ] ),
        $d .= $s[ ( $g ^ ord( $a[ $f + 8 ] ) ) - $g & 0x1F ],
        $f++
    );
    return $d;
}
