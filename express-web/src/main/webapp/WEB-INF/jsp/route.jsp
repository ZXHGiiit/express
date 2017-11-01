<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上下订单</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css"/>
<link rel="stylesheet" href="Assets/css/BeatPicker.min.css"/>
<link rel="stylesheet" href="Assets/css/demos.css"/>
<link rel="stylesheet" href="Assets/css/prism.css"/>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="Assets/js/BeatPicker.min.js"></script>
<script src="Assets/js/prism.js"></script>


<script type="text/javascript">
function test() {
    location.reload();
}

function createRoute(){
	var startAdd=$("#startAdd").val();
	var endAdd = $("#endAdd").val();
	var startTime=$("#startTime").val();
	var endTime=$("#endTime").val();
	var price=$("#price").val();
	if(startAdd== "" || endAdd=="" || startTime=="" || endTime=="" || price==""){
	    alert("不能为空");
	    return;
	}
	alert(typeof(endTime));
	$.ajax({
		url:"${pageContext.request.contextPath}/route/create",
		type:"post",
		dataType:"json",
		data:{
		    "startAdd":startAdd,
            "endAdd" : endAdd,
            "startTime" : startTime,
            "endTime" : endTime,
            "price" : parseFloat(price)
        },
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			alert("发布成功")
			location.reload();
        }
	});
}


</script>
</head>

<body>
<input type="text" data-beatpicker="true"/>
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
                <li class="now"><a href="<%=request.getContextPath()%>/index">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
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
	<div class="book">
    	<div class="tabBox_t">
            <div class="tabBox">
              <ul class="tabNav">
                <li><a href="">网上下单</a></li>
                <li class="now"><em>发布行程</em><span>&nbsp;</span></li>
                <li><a href="">货物追踪</a></li>
              </ul>
              <div class="tabCont" style="display:block;">
              	<div class="book_m">
                	<div class="space_hx">&nbsp;</div>
                    <div class="space_hx">&nbsp;</div>
                    <form action="" method="post">
                    <div class="fahuo">
                    	<span>
                    	开始城市<input id="startAdd" type="text" placeholder="请输入城市名（中文/拼音）">
                        到达城市<input id="endAdd" type="text" placeholder="请输入城市名（中文/拼音）">
                        </span>
                    </div>
                    <div class="fahuo">
                        <span>
                        送货价格<input id="price" type="text" placeholder="请输入价钱（数字）">
                        </span>
                    </div>
                     预计开始时间<input id="startTime" type="text" data-beatpicker="true">
                  预计到达时间<input id="endTime" type="text" data-beatpicker="true">
                    <div class="space_hx">&nbsp;</div>
                    <div class="tiaok">
                    	<span><input name="" type="checkbox" value="" checked>统一服务条款</span>
                        <textarea name="" cols="" rows="">
1.托运人应准确填写本单，如实告知承运人所托运货物的名称、性质、重量、数量、价值等必要情况；托与人应对所托运获取按照行业标准妥善包装，使其适合运输.
2.托运人应准确填写本单，如实告知承运人所托运货物的名称、性质、重量、数量、价值等必要情况；托与人应对所托运获取按照行业标准妥善包装，使其适合运输.
3.托运人应准确填写本单，如实告知承运人所托运货物的名称、性质、重量、数量、价值等必要情况；托与人应对所托运获取按照行业标准妥善包装，使其适合运输.
4.托运人应准确填写本单，如实告知承运人所托运货物的名称、性质、重量、数量、价值等必要情况；托与人应对所托运获取按照行业标准妥善包装，使其适合运输.
                        </textarea>
                    </div>
                    <div class="space_hx">&nbsp;</div>
                    <div class="xiadan_btn">
                    	<a onclick="createRoute()" class="sub">立刻发布</a>
                        <a onclick="test()"class="qux">取消</a>
                    </div>
                    </form>
                </div>
              </div>
            </div>
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


</html>
