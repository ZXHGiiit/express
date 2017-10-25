<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人资料</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css"/>
<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#left_menu li ul").css("display","none");
	$("#left_menu li:first ul").css("display","block");
	$("#left_menu li .yiji").click(function(){
		$(this).parents("li").find(".erji").css("display","block");
		$(this).parent("li").siblings("li").find(".erji").css("display","none");
	});
})
</script>
</head>

<body>





<div class="person_h">
    <span>个人资料设置</span>
</div>
<div class="person_rmain">
    <strong>帐户信息</strong>
    <ul>
        <li>
            <span>登陆帐户：</span>
            <em>2817820247@qq.com</em>
        </li>
        <li>
            <span>所属公司：</span>
            <a href="">请填写公司资料申请成为供应商</a>
        </li>
        <!--<li class="jifen">
            <span>我的积分：</span>
            <i>0分</i>|<a href="">礼品兑换</a>|<a href="">如何获取积分</a>
        </li>-->
    </ul>
    <div class="space_hx">&nbsp;</div>
    <strong>安全信息</strong>
    <ul class="p_news">
        <!--<li>
            <span>绑定手机：</span>
            <em>18825089267</em>
            <a href="" class="anniu">修改</a>
        </li>-->
        <li>
            <span>绑定邮箱：</span>
            <em>2817820247@qq.com</em>
            <a href="" class="anniu">修改</a>
        </li>
        <li>
            <span>密码强度：</span>
            <em><img src="Assets/images/icon16.jpg"/></em>
            <a href="" class="anniu">修改密码</a>
        </li>
    </ul>
    <div class="space_hx">&nbsp;</div>
    <strong>基本信息</strong>
    <form action="" method="post">
    <ul>
        <li>
            <span>姓名：</span>
            <input name="" type="text">
        </li>
        <li>
            <span>手机：</span>
            <input name="" type="text">
        </li>
        <li>
            <span>固定电话：</span>
            <input name="" type="text">
        </li>
        <li>
            <span>发货地址：</span>
            <input name="" type="text">
            <input name="" type="text">
        </li>
        <li>
            <a href="" class="submit">保存</a>
        </li>
    </ul>
    </form>
</div>



</body>