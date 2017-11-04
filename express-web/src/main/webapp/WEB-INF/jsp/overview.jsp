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

    <title> White List</title>
    <style>
        #popupcontent{
            position: absolute;
            visibility: hidden;
            overflow: hidden;
            border:1px solid #CCC;
            background-color:#F9F9F9;
            border:1px solid #333;
            padding:5px;
            width:600px; height:400px;position:absolute; left:50%; top:50%; margin-left: -300px; margin-top: -200px;}
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
            var userId = $("#userId").val();
            if(userId == ""){
                alert("UserId must be filled!");
                return;
            }
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/dialer/whitelist/adduser",
                data : {
                    "userId":userId
                },
                contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "json",
                success : function(data) {
                    if(null != data && "" != data){
                        $('#popupcontent').append('添加成功，结果如下');
                        $('#popupcontent').append('<div>'+'userId='+data.userId+', account='+data.account+', userName='+data.userName+', virtualNumber='+data.lvn+', result='+data.result+'</div>');
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

        function addTeam(){
            var teamId = $("#teamId").val();
            if(teamId == ""){
                alert("TeamId must be filled!");
                return;
            }
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/dialer/whitelist/addteam",
                data : {
                    "teamId":teamId
                },
                contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "json",
                success : function(data) {
                    if(null != data && "" != data){
                        $('#popupcontent').append('添加成功，结果如下');
                        for(var i=0; i<data.length; i++) {
                            $('#popupcontent').append('<div>'+'userId='+data[i].userId+', account=' +data[i].account+', userName='+data[i].userName+', virtualNumber='+data[i].lvn+', result='+data[i].result+'</div>');
                        }
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
            <th>userId</th>
            <th>account</th>
            <th>name</th>
            <th>phoneNumber</th>
        <c:if test="${not empty userList}">
        <c:forEach items="${userList}" var="user" >
        <tr>
            <th>${user.id}</th>
            <th>${user.account}</th>
            <th>${user.fullName} </th>
            <th>${user.phoneNumber}</th>
        </tr>
        </c:forEach>
        </c:if>
    </div>
</table>

<form class="form-inline">
    <div class="form-group">
        <label for="userId">userId</label>
        <input type="text" class="form-control" id="userId" placeholder="Enter userId you want to upgrade one user from Vcall to Dialer">
    </div>
    <button type="button" class="btn btn-primary btn-lg" onclick="addUser()">添加User到白名单</button>
    <br/>
    <div class="form-group">
        <label for="teamId">creatorUserId</label>
        <input type="text" class="form-control" id="teamId" placeholder="Enter creatorUserId you
        want to upgrade one team from Vcall to Dialer">
    </div>
    <button type="button" class="btn btn-primary btn-lg" onclick="addTeam()">添加Team到白名单</button>

    <div id="popupcontent" style="overflow:auto"></div>
</form>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</body>
</html>
