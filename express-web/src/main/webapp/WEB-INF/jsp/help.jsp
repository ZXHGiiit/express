<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>帮助与支持</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css"/>
<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#left_menu li ul").css("display","block");
	$("#left_menu li .yiji").click(function(){
		$(this).parents("li").find(".erji").toggle();
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
                <a href="<%=request.getContextPath()%>/logout">注销</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li><a href="<%=request.getContextPath()%>/index">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
                <li class="news"><a href="<%=request.getContextPath()%>/news">消息<span>12</span></a></li>
                <li><a href="">网站地图</a></li>
                <li class="now"><a href="<%=request.getContextPath()%>/help">帮助与支持</a></li>
                <li><a href="<%=request.getContextPath()%>/about">关于全民</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<!--新闻列表-->
    <div class="person clearfix">
    	<div class="order_l person_l">
        	<ul id="left_menu" class="left_menu">
            	<li>
                	<a class="yiji"><span>新手指南</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong><a href="">如何注册</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">如何追踪货物</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">如何在线支付</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">如何网上下单</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span>常见问题</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong><a href="">寄送货物</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">追踪货物</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">接收货物</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">结算支付</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">账户管理</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span>下载中心</span></a>
                </li>
                <li>
                	<a class="yiji"><span>咨询/建议/投诉</span></a>
                </li>
            </ul>
        </div>
        <div class="person_r">
        	<div class="person_h">
            	<span>新手指南</span>
            </div>
            <div class="person_rmain">
            	<ul class="new_list">
                	<li>
                    	<span><a href="">重货轻货有什么区别？</a></span>
                    </li>
                    <li>
                    	<span><a href="">如何填写运单号？</a></span>
                    </li>
                    <li>
                    	<span><a href="">如何计算价格与时效？</a></span>
                    </li>
                    <li>
                    	<span><a href="">如何查找最近的营业网点？</a></span>
                    </li>
                    <li>
                    	<span><a href="">如何正确包装？</a></span>
                    </li>
                    <li>
                    	<span><a href="">德邦能提供什么样的包装服务？</a></span>
                    </li>
                    <li>
                    	<span><a href="">如何填写托运单？</a></span>
                    </li>
                </ul>
                <div class="space_hx">&nbsp;</div>
                <!--分页-->
                <div class="fenye">
                	<span>页码：1/1</span>
                    <span>总计：2</span>
                    <a href="">首 页</a>|
                    <a href="">上一页</a>|
                    <a href="">下一页</a>|
                    <a href="">尾 页</a>
                    <span>转到：
                    	<select name="">
                        	<option>-1-</option>
                            <option>-2-</option>
                            <option>-3-</option>
                        </select>
                    </span>
                </div>
                <!--分页-->
            </div>
        </div>
    </div>
    <!--新闻列表-->
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
