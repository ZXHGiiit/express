<%--
  Created by IntelliJ IDEA.
  User: mingxin.wang
  Date: 16/7/5
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="mingxin.wang">
    <!-- Bootstrap Core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">

    <title> System Email Template</title>
    <style>
        #popupcontent{
            position: absolute;
            visibility: hidden;
            overflow: hidden;
            border:1px solid #CCC;
            background-color:#F9F9F9;
            border:1px solid #333;
            padding:5px;
            width:300px; height:200px;position:absolute; left:50%; top:50%; margin-left: -150px; margin-top: -100px;}
        }
    </style>
    <script>
    function showPopup(){
        var popUp = document.getElementById("popupcontent");
        popUp.style.visibility = "visible";
    }

    function hidePopup(){
        var popUp = document.getElementById("popupcontent");
        popUp.style.visibility = "hidden";
        window.location.reload();
    }

    function addUser(){
        var name = $("#name").val();
        if(name == ""){
            alert("name must be filled!");
            return;
        }
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/adminUser/add",
            data : {
                "name":name
            },
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success : function(data) {
                if(null != data && "" != data){
                    $('#popupcontent').append('添加成功，结果如下');
                    $('#popupcontent').append('<div>'+'账号='+data.account+', 密码='+data.password+', 姓名='+data.name+'</div>');
                    $('#popupcontent').append("<div id='statusbar'><button onclick='hidePopup();'>Close window</button></div>");
                    showPopup();
                } else {
                    $('#popupcontent').append('添加失败');
                    $('#popupcontent').append("<div id='statusbar'><button onclick='hidePopup();'>Close window</button></div>");
                    showPopup();
                }

            },
            error : function(data) {
                $('#popupcontent').append('添加失败');
                $('#popupcontent').append("<div id='statusbar'><button onclick='hidePopup();'>Close window</button></div>");
                showPopup();
            }
        });
    }

    function reset(userId){
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/adminUser/reset",
            data : {
                "id":userId
            },
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success : function(data) {
                if(null != data && "" != data){
                    $('#popupcontent').append('添加成功，结果如下');
                    $('#popupcontent').append('<div>'+'新的密码为：'+data+'</div>');
                    $('#popupcontent').append("<div id='statusbar'><button onclick='hidePopup();'>Close window</button></div>");
                    showPopup();
                } else {
                    $('#popupcontent').append('添加失败');
                    $('#popupcontent').append("<div id='statusbar'><button onclick='hidePopup();'>Close window</button></div>");
                    showPopup();
                }

            },
            error : function(data) {
                $('#popupcontent').append('添加失败');
                $('#popupcontent').append("<div id='statusbar'><button onclick='hidePopup();'>Close window</button></div>");
                showPopup();
            }
        });
    }

    </script>
</head>
<body>

<table class="table table-hover">
    <div id = "email_template_table">
        <tr>
            <th>账号</th>
            <th>姓名</th>
            <th>创建时间</th>
            <th>是否冻结</th>
            <th>操作</th>
            <c:if test="${not empty admins}">
                <c:forEach items="${admins}" var="user" >
                    <tr>
                        <th>${user.account}</th>
                        <th>${user.name}</th>
                        <th>${user.createTime}</th>
                        <c:choose>
                        <c:when test="${user.isDelete}">
                            <th>是</th>
                        </c:when>
                        <c:otherwise>
                            <th>否</th>
                        </c:otherwise>
                        </c:choose>
                        <th>
                            <table>
                                <tr>
                                    <th>
                                        <a onclick="reset(${user.id})" class="btn btn-default">重置密码</a>
                                    </th>
                                    <th>
                                        <c:choose>
                                        <c:when test="${user.isDelete}">
                                            <a href="<%=request.getContextPath()%>/adminUser/rmDelete?id=${user.id}" class="btn btn-default">解冻</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<%=request.getContextPath()%>/adminUser/delete?id=${user.id}" class="btn btn-default">冻结</a>
                                        </c:otherwise>
                                        </c:choose>
                                    </th>
                                </tr>
                            </table>
                        </th>
                    </tr>
                </c:forEach>
            </c:if>
        </tr>
    </div>
</table>

<form class="form-inline">
    <div class="form-group">
        <label for="userId">姓名</label>
        <input type="text" class="form-control" id="name" placeholder="Enter your name as your identity">
    </div>
    <button type="button" class="btn btn-primary btn-lg" onclick="addUser()">添加管理员</button>
    <br/>
    <div id="popupcontent" style="overflow:auto"></div>
</form>


<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</body>
</html>
