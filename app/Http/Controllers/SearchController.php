<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SearchController extends Controller
{
    public $url;
    public $pattern_find;
    public $pattern_replace;
    public $timeout;

    /**
     * @param url 需要抓取的url链接
     * @param pattern_find 需要匹配的字段正则表达式
     * @param pattern_replace 需要替换的字符正则表达式
     * @param timeout 设置超时阻断程序执行，默认10秒，这个字段一般留空
     */

    public function __construct($url, $pattern_find, $pattern_replace, $timeout)
    {
        $this->url = $url;
        $this->pattern_find = $pattern_find;
        $this->pattern_replace = $pattern_replace;
        $this->timeout = 10;
    }

    // 获取网页源代码
    public function getHtml()
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36'); //模拟浏览器，防止被拦截
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $this->timeout);
        $html = curl_exec($ch);
        // 匹配需要的大的字段，例如一段table，取出来之后再一行一行做匹配
        preg_match($this->pattern_find, $html, $match);

        //判断是否有传入替换的正则表达式，如果有就进行匹配替换，并返回替换后的字符串，如果没有，则直接返回匹配出来的大段，例如整个table表格
        // echo "<pre>";
        // print_r($match);
        // echo "</pre>";
        // exit;
        if (!empty($this->pattern_replace)) {
            return preg_replace($this->pattern_replace, '', $match[0]);
        } else {
            return $match[0];
        }
    }

    // 传入正则和需要处理的字符串，返回的是匹配到的数组
    public function prgMatche($pre_all, $strs)
    {
        if (!is_string($strs)) {
            echo '传入的不是字符串！请检查！<br>';
            echo "<pre>";
            print_r($strs);
            echo "</pre>";
            exit;
        }
        preg_match_all($pre_all, $strs, $matches);
        return $matches;
    }

    // 获取表格表头
    public function getTableJson()
    {
        $res = $this->getHtml();

        // 获取一行一行tr
        $trs = $this->prgMatche('/<tr([\s\S]+?)<\/tr>/i', $res);

        // 获取表头
        $ths = $this->prgMatche('/<th>([\s\S]+?)<\/th>/i', $trs[1][0]);

        // 获取行数，循环匹配的时候需要用到
        $num = sizeof($trs[1]);
        // echo $num;
        // 一行一行匹配表格数据
        for ($i = 1; $i < $num; $i++) {
            $tr = $this->prgMatche('/td>([\s\S]+?)<\/td>/i', $trs[1][$i]);
            $tds[] = $tr[1];
        }
        if (empty($tds)) {
            echo json_encode(['number' => 0, 'list' => [], 'code' => '200'], JSON_UNESCAPED_UNICODE);
            die();
        }
        // 把表头和表数据存入json
        array_unshift($tds, $ths[1]);
        // 返回一个数组，0为json格式数据，1为数组格式数据
        return [json_encode($tds), $tds];
    }
}