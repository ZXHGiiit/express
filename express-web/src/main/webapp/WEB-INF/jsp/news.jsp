<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单中心</title>
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
<!--头部-->
<div class="head_bg">
	<div class="head clearfix">
    	<div class="logo"><a href=""><img src="Assets/images/logo.png" alt=""/></a></div>
        <div class="menu">
            <div class="head_top">
                <a href="<%=request.getContextPath()%>/user/logout">注销</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li><a href="<%=request.getContextPath()%>/index">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
                <li class="now"><a href="<%=request.getContextPath()%>/news">消息</a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="<%=request.getContextPath()%>/help">帮助与支持</a></li>
                <li><a href="<%=request.getContextPath()%>/about">关于全民</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<!--订单中心-->
    <div class="order clearfix">
    	<div class="order_l">
        	<ul id="left_menu" class="left_menu">
            	<li>
                	<a class="yiji"><span>个人中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong><a href="<%=request.getContextPath()%>/personal">个人资料</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">公司信息</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span>订单中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong><a href="">我的订单</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">我的账单</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">代收货款</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">资金流水</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">询价历史</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">常发货物</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">常用联系人</a></strong>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="order_r">
        	<div class="order_h">
            	<span>欢迎光临找物流</span>
            </div>
            <ul class="my_zil">
            	<li>
                	<span>所属公司：</span>
                    <a href="">请填写公司资料申请成为供应商</a>
                </li>
                <!--<li>
                	<span>我的积分：</span>
                    <i>0分</i>|<a href="">礼品兑换</a>|<a href="">如何获取积分</a>
                </li>-->
                <li>
                	<span>资金监管帐号：</span>
                    <a href="">申请</a>|<a href="">说明</a>
                </li>
            </ul>
            <p>
            	<strong>我的订单：</strong>
                <a href="">草稿(<em>0</em>)</a>
                <a href="">预约(<em>0</em>)</a>
                <a href="">待确认费用(<em>0</em>)</a>
                <a href="">已签收(<em>0</em>)</a>
                <a href="">已拒绝(<em>0</em>)</a>
            </p>
            <p>
            	<strong>我的投诉：</strong>
                <a href="">待处理(<em>0</em>)</a>
            </p>
            <div class="space_hx">&nbsp;</div>
            <div class="order_news">
            	<span>我的消息</span>
            </div>
            <ul class="news_mine">
            	<li>
                	<a href="">我的物流待处理的信息</a>
                </li>
                <li>
                	<a href="">我的物流待处理的信息</a>
                </li>
                <li>
                	<a href="">我的物流待处理的信息</a>
                </li>
            </ul>
        </div>
    </div>
    <!--订单中心-->
    <div class="space_hx">&nbsp;</div>
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
<script src="Assets/js/jquery-1.8.3.min.js"></script>
</html>
