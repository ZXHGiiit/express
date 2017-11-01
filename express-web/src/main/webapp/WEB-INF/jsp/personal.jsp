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


function listOrder(isFinish) {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/order/listOrder",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{"isFinish":isFinish},
        dataType: "json",
        success : function(data) {
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $('#title').append('<span>订单列表</span>');
           for(var i=0;i<data.length;i++) {
               $("#msg").append("<li><span><a onclick='viewOrder("+ data[i].id +")'>"+data[i].id+"  |  " + data[i].takeAddress +" -> "+data[i].sendAddress+
                "  |   "+getLocalTime(data[i].createTime)+"</a></span></li>");
           }

        },
        error : function(data) {
            alert("server error")
        }

    });
}

function viewOrder(orderId) {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/order/getInfo",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{"orderId":orderId},
        dataType: "json",
        success : function(data) {
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $('#title').append('<span>订单详情</span>');
            $("#msg").append("<li> <span> 订单编号："+data.id+"</span>	</li>"
                        +"<li> <span> 发货地址："+data.sendAdd+"</span>	</li>"
                        +	"<li><span> 取货地址："+data.takeAdd+"</span>	</li>"
                        +   "<li><span> 发货人："+data.sendName+"</span></li>"
                        +   "<li><span> 收件人："+data.takeName+"</span></li>"
                        +   "<li><span> 物品名称："+data.goodsName+"</span></li>"
                        +	"<li><span> 路径："+data.route+"</span></li>"
                        +   "<li><span> 是否送达："+data.isFinishCN+"</span></li>"
                        +   "<li><span> 发货时间："+getLocalTime(data.startTime)+"</span>	</li>"
                        +   "<li><span> 送达时间："+getLocalTime(data.endTime)+"</span></li>")

        },
        error : function(data) {
            alert("server error")
        }

    });
}


function listTask(isFinish) {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/task/listTask",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{"isFinish":isFinish},
        dataType: "json",
        success : function(data) {
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $('#title').append('<span>任务列表</span>');
           for(var i=0;i<data.length;i++) {
               $("#msg").append("<li><span><a onclick='viewTask("+ data[i].orderId +")'>收件人："+data[i].takeName+"  |  接收于" +getLocalTime(data[i].createTime)+"</a></span></li>");
           }

        },
        error : function(data) {
            alert("server error")
        }

    });
}

function viewTask(orderId) {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/order/getInfo",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{"orderId":orderId},
        dataType: "json",
        success : function(data) {
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $('#title').append('<span>任务详情</span>');
            $("#msg").append("<li> <span> 货物名称："+data.goodsName+"</span>	</li>"
                        +"<li> <span> 发货地址："+data.sendAdd+"</span>	</li>"
                        +	"<li><span> 取货地址："+data.takeAdd+"</span>	</li>"
                        +   "<li><span> 发货人："+data.sendName+"</span></li>"
                        +   "<li><span> 收件人："+data.takeName+"</span></li>"
                        +   "<li><span> 收件人电话："+data.takePhone+"</span></li>"
                        +   "<li><span> 物品名称："+data.goodsName+"</span></li>"
                        +   "<li><span> 接单时间："+getLocalTime(data.createTime)+"</span>	</li>"
                        +   "<li><span> 应完成时间："+getLocalTime(data.endTime)+"</span></li>")

        },
        error : function(data) {
            alert("server error")
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
    	<div class="logo"><a href=""><img src="Assets/images/logo.png" alt=""/></a></div>
        <div class="menu">
            <div class="head_top">
                <a href="<%=request.getContextPath()%>/user/logout">注销</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li><a href="<%=request.getContextPath()%>/index">首页</a></li>
                <li class="now"><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
                <li class="news"><a href="<%=request.getContextPath()%>/news">消息<span>${count_news_key_heheda}</span></a></li>
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
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">我的评分</a></strong>
                        </li>
                         <li>
                            <i>&nbsp;</i>
                            <strong><a href="">常用联系人</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span>订单中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li>
                        	<i>&nbsp;</i>
                            <strong> <a onclick="listOrder(false)">进行中订单</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a onclick="listOrder(true)">已完成订单</a></strong>
                        </li>

                    </ul>
                </li>
                <li>
                    <a class="yiji"><span>任务中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a onclick="listTask(false)">进行中任务</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a onclick="listTask(true)">已完成任务</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="yiji"><span>行程中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">进行中行程</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">历史行程</a></strong>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="person_r">
                <div class="person_h" id="title">
                </div>
                <div class="person_rmain">
                    <ul class="new_list" id="msg">

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

<!-- jQuery -->
<script src="Assets/js/jquery-1.8.3.min.js"></script>
</html>
