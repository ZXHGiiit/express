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

</head>
<body>

<table class="table table-hover">
    <div id = "email_template_table">
        <tr>
            <th>姓名</th>
            <th>身份证号</th>
            <th>电话</th>
            <th>住址</th>
            <th>操作</th>
            <c:if test="${not empty users}">
                <c:forEach items="${users}" var="user" >
                    <tr>
                        <th>${user.name}</th>
                        <th>${user.idNumber}</th>
                        <th>${user.phone}</th>
                        <th>${user.address}</th>
                        <th>
                            <table>
                                <tr>
                                    <th>
                                        <a href="<%=request.getContextPath()%>/reviewVip/pass?id=${user.id}" class="btn btn-default">通过</a>
                                    </th>
                                    <th>
                                        <a href="<%=request.getContextPath()%>/reviewVip/refuse?id=${user.id}" class="btn btn-default">撤回</a>
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


<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</body>
</html>
