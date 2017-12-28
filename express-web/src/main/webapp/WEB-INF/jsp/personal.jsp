<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人资料</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css"/>
<style>
    #popupcontent, #popupcomment{
        position: absolute;
        visibility: hidden;
        overflow: hidden;
        border:1px solid #CCC;
        background-color:#F9F9F9;
        border:1px solid #333;
        padding:5px;
        width:300px; height:100px;position:absolute; left:50%; top:50%; margin-left: -150px; margin-top: -50px;}
    }
</style>
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
               $("#msg").append("<li><span><a onclick='viewOrder("+ data[i].id +")'>"+data[i].id+"  |  " + data[i].sendAddress +" -> "+data[i].takeAddress+
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
                        +   "<li><span> 发货时间："+data.startTime+"</span>	</li>"
                        +   "<li><span> 预计送达时间："+data.endTime+"</span></li>")
            if(data.isFinish && !data.isCom) {
                $("#msg").append("<li><button type='button'  onclick='comment1("+data.id+")'>评价订单</button></li>");
            }
        },
        error : function(data) {
            alert("server error")
        }

    });
}

var comOrderId;

function comment1(orderId) {
    comOrderId = orderId;
    showPopupCom();
}

function comment2() {
    var score = $("#score").val();
    var comment = $("#comment").val();
    console.info(comment);
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/order/addComment",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{
            "score":score,
            "comment":comment,
            "orderId":comOrderId
        },
        dataType: "json",
        success : function(data) {
            alert(data);
            location.reload();
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
                        +   "<li><span> 应完成时间："+getLocalTime(data.endTime)+"</span></li>");
            if(!data.isFinish) {
                $("#msg").append("<li><button type='button'  onclick='updateTask1("+data.taskId+")'>结束任务</button></li>");
            }
        },
        error : function(data) {
            alert("server error")
        }

    });
}
var id;
function updateTask1(taskId) {
     id = taskId;
     $.ajax({
             type: "post",
             url : "<%=request.getContextPath()%>/task/sendCode",
             contentType:"application/x-www-form-urlencoded; charset=UTF-8",
             data:{
                 "taskId":id
             },
             dataType: "json",
             success : function(data) {
                if(data == "success") {
                    showPopup();
                } else {
                    alert("出现未知错误");
                }
             },
             error : function(data) {
                 alert("server error")
             }
      });
}

function updateTask2() {
    var code = $("#code").val();
    $.ajax({
            type: "post",
            url : "<%=request.getContextPath()%>/task/update/finish",
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            data:{
                "taskId":id,
                "code":code,
                "isFinish":true
            },
            dataType: "json",
            success : function(data) {
                alert(data);
                location.reload();
            },
            error : function(data) {
                alert("server error")
            }
     });
}

function listRouteRecord() {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/route/list/record",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        success : function(data) {
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $('#title').append('<span>历史行程列表</span>');
           for(var i=0;i<data.length;i++) {
               $("#msg").append("<li><span>"+data[i].startAddress + "->" + data[i].endAddress +
               " | " + getLocalTime(data[i].startTime) + "->" +getLocalTime(data[i].endTime) + " | "
               + data[i].status + "</a></span></li>");
           }

        },
        error : function(data) {
            alert("server error")
        }
    });
}

function getDoingRoute() {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/route/list/doing",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        success : function(data) {
            console.info(data);
            $("#msg").empty();
            $("#title").empty();
            $('#title').append('<span>进行中行程</span>');
           for(var i=0;i<data.length;i++) {
               $("#msg").append("<li><span>"+data[i].startAddress + "->" + data[i].endAddress +
               " | " + getLocalTime(data[i].startTime) + "->" +getLocalTime(data[i].endTime) + " | "
               + data[i].status + "</a></span>");
               if(data[i].status == "ready") {
                    $("#msg").append("<button type='button'  onclick='runRoute("+data[i].id+")'>启动行程</button>" +
                        "<button type='button'  onclick='cancleRoute("+data[i].id+")'>取消行程</button>")
               } else {
                    $("#msg").append("<li><button type='button'  onclick='finishRoute("+data[i].id+")'>结束行程</button></li>");
               }
               $("#msg").append("</li>")
           }

        },
        error : function(data) {
            alert("server error")
        }
    });
}

function runRoute(routeId) {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/route/update",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{
            "routeId":routeId,
            "status":"doing"
        },
        dataType: "json",
        success : function(data) {
            if(data == "success") {
                alert("行程已启动");
                location.reload();
            } else {
                alert("出现未知错误")
            }
        },
        error:function(data) {
            alert("server error");
        }
    });
}


function cancleRoute(routeId, status) {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/route/update",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{
            "routeId":routeId,
            "status":"cancle"
        },
        dataType: "json",
        success : function(data) {
            if(data == "success") {
                alert("行程已取消");
                location.reload();
            } else {
                alert("出现未知错误")
            }
        },
        error:function(data) {
            alert("server error");
        }
    });
}

function finishRoute(routeId, status) {
    $.ajax({
        type: "post",
        url : "<%=request.getContextPath()%>/route/update",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:{
            "routeId":routeId,
            "status":"finish"
        },
        dataType: "json",
        success : function(data) {
           if(data == "success") {
               alert("行程已结束");
               location.reload();
           } else {
               alert("出现未知错误")
           }
        },
        error:function(data) {
            alert("server error");
        }
    });

}

function userInfo() {
    $.ajax({
            type: "post",
            url : "<%=request.getContextPath()%>/user/userInfo",
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success : function(data) {
               console.info(data);
               $("#msg").empty();
               $("#title").empty();
                $('#title').append('<span>个人信息</span>');
                   $("#msg").append("<li><span>id：" +data.id+"</span></li>"
                      + "<li><span>用户名：" + data.account + "</span></li>"
                      + "<li><span>姓名：" + data.name + "</span></li>"
                      + "<li><span>身份证号：" + data.idNumber + "</span></li>"
                      + "<li><span>email：" + data.email + "</span></li>"
                      + "<li><span>电话：" + data.phone + "</span></li>"
                      + "<li><span>邮编：" + data.postCode + "</span></li>"
                      + "<li><span>银行账号：" + data.bankAccount + "</span></li>"
                      + "<li><span>地址：" + data.address + "</span></li>"
                      + "<li><span>昵称：" + data.nickName + "</span></li>"
                      + "<li><span>自我介绍：" + data.motto + "</span></li>"
                      );

            },
            error:function(data) {
                alert("server error");
            }
        });
}

function scoreInfo() {
     $.ajax({
        type: "get",
        url : "<%=request.getContextPath()%>/user/score",
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        success : function(data) {
           console.info(data);
           $("#msg").empty();
           $("#title").empty();
           $('#title').append('<span>评分信息</span>');
           $("#msg").append("<li><span>平均评分：" + data.avgScore+"分</span></li>"
               + "<li><span>最高评分：" + data.maxScore + "分</span></li>"
               + "<li><span>最低评分：" + data.maxScore + "分</span></li>"
               + "<li><span>已完成任务：" + data.countOfTask + "个</span></li>"
               + "<li><span>已被评论任务：" + data.countOfComment + "个</span></li>");

        },
        error:function(data) {
            alert("server error");
        }
    });
}

//将时间戳转换为日期
function getLocalTime(nS) {
   return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');
}

function showPopup(){
    var popUp = document.getElementById("popupcontent");
    popUp.style.visibility = "visible";
}

function hidePopup(){
    var popUp = document.getElementById("popupcontent");
    popUp.style.visibility = "hidden";
    window.location.reload();
}

function showPopupCom() {
    var popUp = document.getElementById("popupcomment");
    popUp.style.visibility = "visible";
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
                <span href="#">${user_key_heheda.account}</span>
                <a href="<%=request.getContextPath()%>/user/logout">注销</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li><a href="<%=request.getContextPath()%>/index">首页</a></li>
                <li class="now"><a href="<%=request.getContextPath()%>/personal">我的全民</a></li>
                <li class="news"><a href="<%=request.getContextPath()%>/msg/index">消息<span>${count_news_key_heheda}</span></a></li>
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
                            <strong><a onclick="userInfo()">个人资料</a></strong>
                        </li>
                        <li>
                        	<i>&nbsp;</i>
                            <strong><a href="">认证信息</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a onclick="scoreInfo()">我的评分</a></strong>
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
                            <strong><a onclick="getDoingRoute()">进行中行程</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a onclick="listRouteRecord()">历史行程</a></strong>
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
<div id="popupcontent" style="overflow:auto">
    请填写发送自收件人手机的验证码，验证信息</br>
    <input id="code" type="text">
    <a onclick="updateTask2()" class="submit">确定</a>
</div>
<div id="popupcomment" style="overflow:auto">
    评分
    <input id="score" type="text" placeholder="请填写评分1~5"></br>
    评语
    <textarea id="comment" cols="22px" rows="3px"  placeholder="请填写评语"></textarea></br>
    <a onclick="comment2()" class="submit">确定</a>
</div>

</body>

<!-- jQuery -->
<script src="Assets/js/jquery-1.8.3.min.js"></script>
</html>
