<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上下订单</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css"/>


<script type="text/javascript">

function getRoute(){
	var startAdd=$("#startAdd").val();
	var endAdd = $("#endAdd").val();
	if(startAdd== "" || endAdd==""){
	    alert("不能为空");
	    return;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/route/getRoute",
		type:"post",
		dataType:"json",
		data:{
		    "startAdd":startAdd,
            "endAdd" : endAdd
        },
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			$("#routeList").empty();
            $("#routeList").append("<tr><th colspan='11' scope='col'><span>排序：</span><a href=''>星级</a><a href=''>泡货价</a><a href=''>重泡货价</a><a href=''>重货价</a><a href=''>最低收费</a>"
            + "<a href=''>时效</a><a href=''>承运票数</a><a href=''>总费用</a></th></tr>"
            + "<tr class='wl_title'><td width='50' class='tubiao'>&nbsp;</td><td width='85'>物流商</td><td width='150'>线路</td><td width='90'>泡货<em>元/公斤</em></td><td width='90'>重泡货<em>元/公斤</em></td>"
            + "<td width='90'>重货<em>元/公斤</em></td><td width='90'>最低收费</td><td width='70'>时效</td><td width='85'>承运票数</td><td width='65'>总费用</td><td width='67'>下单</td></tr>");
			console.info(data);
			for(var i=0;i<data.length;i++){
			    console.info(data[i]);
				$("#routeList").append("<tr><td><input type='checkbox' class='fav' name='test' value='"+data[i].routeId+"' />&nbsp;</a></td>"
				+ "<td class='left'>" + data[i].taskUserName+"</br>评分:" + data[i].avgScore +"</td>"
				+ "<td class='left'><span>从：" +startAdd+"</span><span>到："+endAdd+"</span></td>"
				+ "<td><i>0.13</i></td><td><i>0.15</i></td><td><i>0.12</i></td>"
				+ "<td><i>" + data[i].price + "</i>元</td>"
				+ "<td><span>24小时</span><span>定时达</span></td>"
				+ "<td>" + data[i].taskSize + "票</td>"
				+ "<td><a href=''>下单</a></td><tr>");
			}
        }
	});
}

function createOrder() {
    var obj=document.getElementsByName('test'); //选择所有name="'test'"的对象，返回数组
    //取到对象数组后，我们来循环检测它是不是被选中
    var routeId;
    for(var i=0; i<obj.length; i++){
    if(obj[i].checked) routeId = obj[i].value; //如果选中，将value添加到变量s中
    }

    var takeName = $("#takeName").val();
    var takePhone = $("#takePhone").val();
    var takeAdd = $("#takeAdd").val();
    var takeAddex = $("#takeAddex").val();
    var sendName = $("#sendName").val();
    var sendPhone = $("#sendPhone").val();
    var sendAdd = $("#sendAdd").val();
    var sendAddex = $("#sendAddex").val();
    var goodsName = $("#goodsName").val();
    var goodsWeight = $("#goodsWeight").val();
    if(takeName == "" || takePhone == "" || takeAdd == "" || takeAddex == "" || takeAddex == "" ||
    sendName == "" || sendPhone == "" || sendAdd == "" || sendAddex == "" || goodsName == "" ||
    goodsWeight == "") {
        alert("标星项不能为空");
        return;
    }
    $.ajax({
    		url:"${pageContext.request.contextPath}/order/createOrder",
    		type:"post",
    		dataType:"json",
    		data:{
    		    "routeId":parseInt(routeId),
    		    "takeName":takeName,
    		    "takePhone":parseInt(takePhone),
    		    "takeAddress":takeAdd + takeAddex,
    		    "sendName":sendName,
    		    "sendPhone":parseInt(sendPhone),
    		    "sendAddress":sendAdd + sendAddex,
    		    "goodsName":goodsName,
    		    "goodsWeight":goodsWeight
            },
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
    		success:function(data){
    		    alert("create order success!!!")
    		},
    		error:function(data) {
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
                <a href="<%=request.getContextPath()%>/user/logout">注销</a>
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
	<div class="book">
    	<div class="tabBox_t">
            <div class="tabBox">
              <ul class="tabNav">
                <li class="now"><em>网上下单</em><span>&nbsp;</span></li>
                <li><a href="">网点查询</a></li>
                <li><a href="">货物追踪</a></li>
              </ul>
              <div class="tabCont" style="display:block;">
              	<div class="book_m">
                	<div class="space_hx">&nbsp;</div>
                	<div class="shunxu">
                    	<img src="Assets/images/icon6.jpg" alt=""/>
                    </div>
                    <div class="space_hx">&nbsp;</div>
                    <form action="" method="post">
                    <div class="fahuo">
                    	<span>
                    	发货城市<input id="startAdd" type="text" placeholder="请输入城市名（中文/拼音）">
                        到达城市<input id="endAdd" type="text" placeholder="请输入城市名（中文/拼音）">
                        <a onclick="getRoute()" class="sousuo">搜索比价</a>
                        </span>
                    </div>
                    <div class="space_hx">&nbsp;</div>
                    <ul class="xinxi">
                    	<li>
                        	货物名称
                            <input name="" id="goodsName" type="text" class="wenben">
                        </li>
                        <li>
                            货物重量
                            <input name="" id="goodsWeight" type="text" class="wenben">
                            g
                        </li>
                        <li>
                            <input name="" class="check" type="checkbox" value="">
                            保险（0.15%）&nbsp;&nbsp;
                        	<input name="" class="check" type="checkbox" value="">
                            上门取货&nbsp;&nbsp;
                            <input name="" class="check" type="checkbox" value="">
                            送货上门
                        </li>
                        <li class="shuxing">
                        	<span>增值服务</span>
                            <input name="" class="check" type="checkbox" value="">
                            防倾斜
                            <input name="" class="check" type="checkbox" value="">
                            防撞
                            <input name="" class="check" type="checkbox" value="">
                            易碎
                            <input name="" class="check" type="checkbox" value="">
                            不能堆叠
                            <input name="" class="check" type="checkbox" value="">
                            不能分拆
                            <input name="" class="check" type="checkbox" value="">
                            不能倒置
                            <input name="" class="check" type="checkbox" value="">
                            正本回单
                            <input name="" class="check" type="checkbox" value="">
                            高价值
                        </li>
                    </ul>
                    <div class="space_hx">&nbsp;</div>
                    <!--route信息填充-->
                    <table cellpadding="0" cellspacing="0" id = "routeList">
                      <tr>
                        <th colspan="11" scope="col">
                        	<span>排序：</span>
                            <a href="">星级</a>
                            <a href="">泡货价</a>
                            <a href="">重泡货价</a>
                            <a href="">重货价</a>
                            <a href="">最低收费</a>
                            <a href="">时效</a>
                            <a href="">承运票数</a>
                            <a href="">总费用</a>
                        </th>
                      </tr>
                      <tr class="wl_title">
                        <td width="50" class="tubiao">&nbsp;</td>
                        <td width="85">物流商</td>
                        <td width="150">线路</td>
                        <td width="90">泡货<em>元/公斤</em></td>
                        <td width="90">重泡货<em>元/公斤</em></td>
                        <td width="90">重货<em>元/公斤</em></td>
                        <td width="90">最低收费</td>
                        <td width="70">时效</td>
                        <td width="85">承运票数</td>
                        <td width="65">总费用</td>
                        <td width="67">下单</td>
                      </tr>


                    </table>
                    <div class="space_hx">&nbsp;</div>
                    <div class="txxx clearfix">
                    	<!--发货人信息-->
                        <div class="txxx_l">
                        	<div class="txxx_h">
                            	<span>发货人信息</span>
                            </div>
                            <ul>
                            	<li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        发货人
                                    </span>
                                    <input name="" id="sendName" type="text">
                                </li>
                                <li>
                                	<span>
                                	    <i>&nbsp;</i>
                                        手机
                                    </span>
                                    <input name="" id="sendPhone" type="text">
                                </li>
                                <li>
                                	<span>
                                        固定电话
                                    </span>
                                    <input name="" type="text">
                                    <p><i>&nbsp;</i>手机号码与固定电话必须填写一项</p>
                                </li>
                                <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        发货地址
                                    </span>
                                    <input name="" id="sendAdd" type="text" placeholder="请选择/输入城市名称">
                                    <input class="jiedao" name="" id="sendAddex" type="text" placeholder="请输入街道地址">
                                </li>
                            </ul>
                        </div>
                        <!--发货人信息-->
                        
                        <!--收货人信息-->
                        <div class="txxx_r">
                        	<div class="txxx_h">
                            	<span>收货人信息</span>
                            </div>
                            <ul>
                            	<li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        收件人
                                    </span>
                                    <input name="" id="takeName" type="text">
                                </li>
                                <li>
                                	<span>
                                	    <i>&nbsp;</i>
                                        手机
                                    </span>
                                    <input name="" id="takePhone" type="text">
                                </li>
                                <li>
                                	<span>
                                        固定电话
                                    </span>
                                    <input name="" type="text">
                                    <p><i>&nbsp;</i>手机号码与固定电话必须填写一项</p>
                                </li>
                                <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        收货地址
                                    </span>
                                    <input name="" id="takeAdd" type="text" placeholder="请选择/输入城市名称">
                                    <input class="jiedao" name="" id="takeAddex" type="text" placeholder="请输入街道地址">
                                </li>
                            </ul>
                        </div>
                        <!--收货人信息-->
                    </div>
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
                    	<a onclick="createOrder()" class="sub">立刻下单</a>
                        <a href="" class="qux">取消</a>
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

<!-- jQuery -->
<script src="Assets/js/jquery-1.8.3.min.js"></script>
</html>
