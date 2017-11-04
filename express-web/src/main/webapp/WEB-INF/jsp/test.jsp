<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>jquery倒计时按钮常用于验证码倒计时 - 懒人建站，服务于【个人站长】【网页设计师】和【web开发从业者】的代码素材与设计素材网站。</title>
</head>
<body style="padding:50px;">
<h1>jquery倒计时按钮常用于验证码倒计时演示</h1>
<h3>使用演示 显示为 秒</h3>
<p style="margin-bottom: 40px;">
    <button type="button" id="test1">获取验证码</button>
    <button type="button" id="test1-clear">清理验证码</button>
</p>
<h3>使用演示 显示为 分:秒</h3>
<p style="margin-bottom: 40px;">
    <button type="button" id="test2">获取验证码</button>
</p>
<h3>使用演示 显示为 天:时:分:秒</h3>
<p style="margin-bottom: 40px;">
    <button type="button" id="test3">获取验证码</button>
</p>
<h3>使用演示 显示为 天:时:分:秒</h3>
<p style="margin-bottom: 40px;">
    <button type="button" id="test4">获取验证码</button>
</p>
<p>
    <a href="http://www.51xuediannao.com/">懒人建站</a>，<br/><br/>服务于【个人站长】【网页设计师】和【web开发从业者】的代码素材与设计素材网站。
</p>
<script src="http://lib.sinaapp.com/js/jquery/1.12.4/jquery-1.12.4.min.js"></script>
<script>
    //懒人建站，服务于【个人站长】【网页设计师】和【web开发从业者】的代码素材与设计素材网站。
    //懒人建站http://www.51xuediannao.com/
    //jquery倒计时按钮常用于验证码倒计
    function buttonCountdown($el, msNum, timeFormat) {
        var text = $el.data("text") || $el.text(),
                timer = 0;
        $el.prop("disabled", true).addClass("disabled")
                .on("bc.clear", function () {
                    clearTime();
                });

        (function countdown() {
            var time = showTime(msNum)[timeFormat];
            $el.text(time + '后失效');
            if (msNum <= 0) {
                msNum = 0;
                clearTime();
            } else {
                msNum -= 1000;
                timer = setTimeout(arguments.callee, 1000);
            }
        })();

        function clearTime() {
            clearTimeout(timer);
            $el.prop("disabled", false).removeClass("disabled").text(text);
        }

        function showTime(ms) {
            var d = Math.floor(ms / 1000 / 60 / 60 / 24),
                    h = Math.floor(ms / 1000 / 60 / 60 % 24),
                    m = Math.floor(ms / 1000 / 60 % 60),
                    s = Math.floor(ms / 1000 % 60),
                    ss = Math.floor(ms / 1000);

            return {
                d: d + "天",
                h: h + "小时",
                m: m + "分",
                ss: ss + "秒",
                "d:h:m:s": d + "天" + h + "小时" + m + "分" + s + "秒",
                "h:m:s": h + "小时" + m + "分" + s + "秒",
                "m:s": m + "分" + s + "秒"
            };
        }

        return this;
    }

    //使用演示 显示为 秒
    $("#test1").on("click",function(){
        buttonCountdown($(this), 1000 * 60 * 3, "ss");
    });

    //使用演示 显示为 分:秒
    $("#test2").on("click",function(){
        buttonCountdown($(this), 1000 * 60 * 3, "m:s");
    });

    //使用演示 显示为 时:分:秒
    $("#test3").on("click",function(){
        buttonCountdown($(this), 1000 * 60 * 3, "h:m:s");
    });

    //使用演示 显示为 天:时:分:秒
    $("#test4").on("click",function(){
        buttonCountdown($(this), 1000 * 60 * 3, "d:h:m:s");
    });

    //清理$("#test1")的倒计时  比如请求出错或者什么原因要清理倒计时按钮
    $("#test1-clear").on("click",function(){
        $("#test1").trigger("bc.clear");
    });
</script>
</body>
</html>