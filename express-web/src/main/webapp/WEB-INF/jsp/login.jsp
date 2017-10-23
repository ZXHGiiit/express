<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css"/>

<script>
    function register(){
        var email = $("#email").val();
        var password = $("#password").val();
        var checkcode = $("#checkcode").val();
        if(email == "" || password == "" || checkcode == ""){
            alert("注册项不能为空");
            return;
        }

        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/user/register",
            data : {
                "email":email,
                "password":password,
            },
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success : function(data) {
                alter("注册成功！");
            }
        });
    }


    function login(){
        var account = $("#account").val();
        var password = $("#passwordLogin").val();
        if(account == "" || password == ""){
            alert("登录名或密码不能为空");
            return;
        }

        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/user/login",
            data : {
                "account":account,
                "password":password,
            },
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success : function(data) {
                alter("登陆成功！");
            }
        });
    }
</script>


</head>

<body>
<!--头部-->
<div class="head_bg">
	<div class="head clearfix">
    	<div class="logo"><a href=""><img src="Assets/images/logo.png" alt=""/></a></div>
        <div class="menu">
            <div class="head_top">
                <a href="<%=request.getContextPath()%>/login">登录</a>
                <a href="<%=request.getContextPath()%>/login">注册</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li><a href="<%=request.getContextPath()%>/index">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
                <li class="news"><a href="<%=request.getContextPath()%>/news">消息<span>12</span></a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="<%=request.getContextPath()%>/help">帮助与支持</a></li>
                <li><a href="<%=request.getContextPath()%>/about">关于全民</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main clearfix">
    <div class="login_reg clearfix">
    	<!--邮箱注册-->
        <div class="reg">
        	<div class="lore_top">
            	<span>
                	<em>邮箱注册</em>
                </span>
            </div>
        	<form action="" method="post">
        	<ul>
            	<li>
                	<span>电子邮箱：</span>
                    <input name="email" type="text" id="email" placeholder="请输入常用邮箱，用于找回密码">
                </li>
                <li>
                	<span>密码：</span>
                    <input name="password" type="password" id="password" placeholder="6-16个字符">
                </li>
                <li>
                	<span>确认密码：</span>
                    <input name="password" type="password" placeholder="和密码一致">
                </li>
                <li>
                	<span>验证码：</span>
                    <input name="" type="text" placeholder="">
                    <a href="" class="yzm">获取验证码</a>
                </li>
                <li>
                	<input name="checkcode" class="check" type="checkbox" value="" checked="checked">
                    已阅读
                    <a href="">找物流网上服务协议</a>
                </li>
                <li class="tijiao">
                	 <button type="button" class="submit" onclick="register()">注册</button>
                </li>
                
            </ul>
            </form>
        </div>
        <!--邮箱注册-->
    	<!--登录-->
        <div class="login">
        	<div class="lore_top">
            	<span>
                	<em>马上登录</em>
                </span>
            </div>
        	<form action="" method="post">
        	<ul>
            	<li>
                	<span>用户名：</span>
                    <input name="account" id="account" type="text" placeholder="账号/邮箱">
                </li>
                <li>
                	<span>密码：</span>
                    <input name="password" id="passwordLogin"  type="password" placeholder="6-16个字符">
                </li>
                <li class="tijiao">
                	<button type="button" class="submit" onclick="login()">登陆</button>
                </li>
                <li>
                	<p>
                    	使用合作帐号登录：
                        <a href=""><img src="Assets/images/icon10.png"/></a>
                        <a href=""><img src="Assets/images/icon12.png"/></a>
                        <a href=""><img src="Assets/images/icon13.png"/></a>
                    </p>
                </li>
            </ul>
            </form>
        </div>
        <!--登录-->
    </div>
    <div class="space_hx">&nbsp;</div>
    <div class="f_main clearfix">
    	<ul>
        	<li class="title">
            	<span>快捷下单</span>
            </li>
            <li>
            	<a href="">收发货人管理，快速选择下单</a>
            </li>
            <li>
            	<a href="">按模板下单，无需重复填写</a>
            </li>
            <li>
            	<a href="">便捷城市选择控件</a>
            </li>
        </ul>
        <ul>
        	<li class="title">
            	<span>掌控物流</span>
            </li>
            <li>
            	<a href="">实时追踪，邮件提醒</a>
            </li>
            <li>
            	<a href="">”我的订单状态一览“</a>
            </li>
            <li>
            	<a href="">管理历史订单，按需导出</a>
            </li>
        </ul>
        <ul>
        	<li class="title">
            	<span>在线支付</span>
            </li>
            <li>
            	<a href="">批量支付，一键完成</a>
            </li>
            <li>
            	<a href="">在线支付，安全快捷</a>
            </li>
            <li>
            	<a href="">收发货人均可支付</a>
            </li>
        </ul>
        <ul>
        	<li class="title">
            	<span>在线理赔</span>
            </li>
            <li>
            	<a href="">首届物流在线理赔</a>
            </li>
            <li>
            	<a href="">线上提交，专人受理</a>
            </li>
        </ul>
    </div>
</div>
<!--中间部分-->
<div class="space_hx">&nbsp;</div>
<!--底部-->
<div class="foot_bg">
	<div class="foot">
    	<div class="foot_t">
        	<a href="">业务介绍</a>
            <a href="">联系我们</a>
        </div>
        <div class="copy">
        	Copyright&copy;&nbsp;2012-2015&nbsp; 找物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved. &nbsp;&nbsp;粤ICP备10005645
        </div>
    </div>	
</div>
<!--底部-->
</body>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</html>
