<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>关于找物流</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css"/>

</head>

<body>
<!--头部-->
<div class="head_bg">
	<div class="head clearfix">
    	<div class="logo"><a href=""><img src="Assets/images/logo.png" alt=""/></a></div>
        <div class="menu">
            <div class="head_top">
                <span href="#">${user_key_heheda.account}</span>
                <a href="<%=request.getContextPath()%>/user/logout">注销</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li><a href="<%=request.getContextPath()%>/index">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
                <li class="news"><a href="<%=request.getContextPath()%>/mag/index">消息<span>${count_news_key_heheda}</span></a></li>
                <li><a href="<%=request.getContextPath()%>/help">帮助与支持</a></li>
                <li class="now"><a href="<%=request.getContextPath()%>/about">关于全民</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<div class="page">
    	<div class="page_h">
        	<span>关于找物流</span>
        </div>
        <div class="content">
        	<img src="Assets/upload/about.jpg" alt=""/>
            <p>
            	全民速递软件是天涯网络科技有限公司设计的一款联系全民的物品运送软件。旨在利用人们的出行，同城或跨城地运送物品至目的地，带给有运送需求者便利的同时使出行者获利。不依赖快递公司，出行者自由选择接单使得全民速递软件相对于传统快递尤其是跨区域快递有速度更快，成本更低的明显优势，便民利民，服务于大众生活，前景广阔。

            </p>
        </div>
    </div>
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
