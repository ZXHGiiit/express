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
                <li class="now"><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
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
<div class="main">
	<!--订单中心-->
    <div class="person clearfix">
    	<div class="order_l person_l">
        	<ul id="left_menu" class="left_menu">
            	<li>
                	<a class="yiji"><span>个人中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong><a href="">个人资料</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">认证信息</a></strong>
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
        <div class="person_r">
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
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</html>
