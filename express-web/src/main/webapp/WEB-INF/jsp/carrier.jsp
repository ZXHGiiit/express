<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>承运商申请</title>
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
            <a href="<%=request.getContextPath()%>/logout">注销</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li class="now"><a href="<%=request.getContextPath()%>/index">首页</a></li>
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
<div class="main">
	<div class="main_top">
    	<img src="Assets/images/pic1.jpg" alt=""/>
    </div>
    <div class="space_hx">&nbsp;</div>
    <div class="chengyun clearfix">
    	<!--个人信息-->
        <div class="cy_left">
        	<div class="cy_head">
            	<span>个人信息</span>
            </div>
            <form action="" method="get">
            <ul class="cy_body">
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>个人名称</em>
                    </span>	
                    <input name="" type="text">
                    <p>（个人名称必须与个人身份保证完全相同）</p>
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>邮政编码</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>固定电话</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>传真</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>手机号码</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>银行帐号</em>
                    </span>	
                    <input name="" type="text">
                    <p>（认证时候不能修改，请仔细填写）</p>
                </li>
                <li>
                	<span>
                        <em>个人介绍</em>
                    </span>	
                    <textarea name="" cols="" rows=""></textarea>
                </li>
                <li>
                	<a href="" class="file">资质文件上传</a>
                </li>
                <li>
                	<a href="" class="submit">提交</a>
                </li>
            </ul>
            </form>
        </div>
        <!--个人信息-->
    	<!--公司信息-->
        <div class="cy_right">
        	<div class="cy_head">
            	<span>公司信息</span>
            </div>
            <form action="" method="get">
            <ul class="cy_body">
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司名称</em>
                    </span>	
                    <input name="" type="text">
                    <p>（公司名称必须与营业执照完全相同）</p>
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>办公地址</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>邮政编码</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司电话</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司传真</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司开户行</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>银行账号</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司法定代表人</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>税务登记号</em>
                    </span>	
                    <input name="" type="text">
                    <p>（认证时候不能修改，请仔细填写）</p>
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>财务邮箱</em>
                    </span>	
                    <input name="" type="text">
                </li>
                <li>
                	<span>
                        <em>公司介绍</em>
                    </span>	
                    <textarea name="" cols="" rows=""></textarea>
                </li>
                <li>
                	<a href="" class="file">资质文件上传</a>
                </li>
                <li>
                	<a href="" class="submit">提交</a>
                </li>
            </ul>
            </form>
        </div>
        <!--公司信息-->
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
