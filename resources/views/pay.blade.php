
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Last-Modified" content="3201811082225">
    <meta name="viewport" content="width=device-width,user-scalable=no,target-densitydpi=medium-dpi,initial-scale=1.0"/>

    <script src="{{ asset('js/jquery-3.3.1.min.js?v=3201811082225') }}"></script>
    <script src="{{ asset('js/jquery.qrcode.js?v=3201811082225') }}"></script>
    <script src="{{ asset('js/utf.js?v=3201811082225') }}"></script>

    <title>字符串转二维码</title>
</head>

<body class="bodyPay">

<div id="qrcodeCanvas"></div>
<img id="ImgPayQrcode"></img>

<script>
    $("#qrcodeCanvas").empty();
    $("#qrcodeCanvas").qrcode({
        render : "canvas",    //设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
        text : "alipays://platformapi/startapp?appId=09999988&actionType=toAccount&goBack=NO&amount=0.01&userId=2088432780927455&memo=271353",    //扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
        width : "200",               //二维码的宽度
        height : "200",              //二维码的高度
        background : "#ffffff",       //二维码的后景色
        foreground : "#000000",        //二维码的前景色
        src: "./demo_qrcode/Img/alipay.png",             //二维码中间的图片
        cb: function(){
            $('#qrcodeCanvas').hide();
            var canvas=$('#qrcodeCanvas').find('canvas').get(0);
            $('#ImgPayQrcode').attr('src',canvas.toDataURL('image/png'));
        }
    });
</script>

</body>
</html>