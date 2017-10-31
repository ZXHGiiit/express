<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Assets/css/thems.css"/>>
<script type="text/javascript" src="${pageContext.request.contextPath}/Assets/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#left_menu li ul").css("display","none");
	$("#left_menu li:first ul").css("display","block");
	$("#left_menu li .yiji").click(function(){
		$(this).parents("li").find(".erji").css("display","block");
		$(this).parent("li").siblings("li").find(".erji").css("display","none");
	});
})

function listMsg(isView, isSys) {
    $.ajax({
        url:"${pageContext.request.contextPath}/msg/list/msg",
        type:"post",
        dataType:"json",
        async:"false",
        data:{
            "isView":isView,
            "isSys":isSys
        },
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        success:function(data){
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $("#title").append("<span>消息列表</span>")
            for(var i=0;i<data.length;i++) {
                $("#msg").append("<li><span><a onclick='viewMsg("+ data[i].id +")'>" + data[i].title + "</a></span></li>");
            }
        },
        error: function () {
            alert("服务器内部错误");
        }
    });
}

function viewMsg(msgId) {
    $.ajax({
        url:"${pageContext.request.contextPath}/msg/view/msg",
        type:"post",
        dataType:"json",
        async:"false",
        data:{
           "msgId":msgId
        },
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        success:function(data){
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $("#title").append("<span>消息详情-"+data.title+"</span>");
            $("#msg").append("<span>"+data.msg + "</span></br></br>"
                    + "<span>发送于" + getLocalTime(data.createTime) + "</span>");
        },
        error: function () {
            alert("服务器内部错误");
        }
    });
}

//将时间戳转换为日期
function getLocalTime(nS) {
   return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');
}

</script>
</head>

<body>
<!--头部-->
<div class="head_bg">
	<div class="head clearfix">
    	<div class="logo"><a href=""><img src="${pageContext.request.contextPath}/Assets/images/logo.png" alt=""/></a></div>
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
                <li class="news now"><a href="<%=request.getContextPath()%>/news">消息<span>${count_news_key_heheda}</span></a></li>
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
                	<a class="yiji"><span>个人消息</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong><a  onclick="listMsg(false, false)">未读消息(${countNotView})</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a  onclick="listMsg(true, false)">已读消息(${countView})</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span>系统消息</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong><a href="" onclick="listMsg(false, true)">未读消息(${countNotViewSys})</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="" onclick="listMsg(true, true)">已读消息(${countViewSys})</a></strong>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="person_r">
                	<div class="person_h" id="title">
                    	<span>消息列表</span>
                    </div>
                    <div class="person_rmain">
                    	<ul class="new_list" id="msg">
                        	<li>
                            	<span><a href="">重货轻货有什么区别？</a></span>
                            </li>
                        </ul>
                        <div class="space_hx">&nbsp;</div>
                        <!--分页-->
                        <div class="fenye" id="fenye">
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
</html>
