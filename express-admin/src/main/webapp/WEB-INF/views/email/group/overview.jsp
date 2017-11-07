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
    <script>
        function addGroup(){
            var businessName = $("#businessName").val();
            var name = $("#groupName").val();

            if(name == ""){
                alert("Group name must be filled!");
                return;
            }

            if(businessName == ""){
                alert("Group businessName must be filled!");
                return;
            }

            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/email/group/add",
                data : {
                    "name":name,
                    "businessName":businessName
                },
                contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "json",
                success : function() {
                    window.location.reload();
                }
            });
        }

    </script>
</head>
<body>

<table class="table table-hover">
    <div id = "email_template_table">
        <tr>
            <th>id</th>
            <th>名称</th>
            <th>Business Name</th>
            <th>模版列表</th>
            <c:if test="${not empty groups}">
            <c:forEach items="${groups}" var="group" >
        <tr>
            <th>${group.id}</th>
            <th>${group.name}</th>
            <th>${group.businessName}</th>
            <th><a href="<%=request.getContextPath()%>/email/group/templates/view?groupId=${group.id}" class="btn btn-default">组内模版</a></th>
        </tr>
        </c:forEach>
        </c:if>
    </div>
</table>

<form class="form-inline">
    <div class="form-group">
        <label for="groupName">Group Name</label>
        <input type="text" class="form-control" id="groupName" placeholder="Group Name">
    </div>
    <div class="form-group">
        <label for="businessName">业务名</label>
        <input type="text" class="form-control" id="businessName" placeholder="比如:lead.register">
    </div>
    <button type="button" class="btn btn-primary btn-lg" onclick="addGroup()">添加分组</button>
</form>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</body>
</html>
