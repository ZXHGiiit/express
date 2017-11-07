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

    <title> Common Config </title>

</head>
<body>

<table class="table table-hover">
    <div id = "email_template_table">
        <tr>
            <th>id</th>
            <th>bizName</th>
            <th>tag</th>
            <th>描述</th>
            <th>操作</th>
            <c:if test="${not empty configs}">
            <c:forEach items="${configs}" var="config" >
        <tr>
            <th>${config.id}</th>
            <th>${config.bizName}</th>
            <th>${config.tag}</th>
            <th>${config.description}</th>
            <th>
                <table>
                    <tr>
                        <th>
                            <a href="<%=request.getContextPath()%>/commonconfig/key/detail/view?id=${config.id}" class="btn btn-default">详情</a>
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

<a href="<%=request.getContextPath()%>/commonconfig/key/add/view" class="btn btn-default" role="button"> 添加配置 </a>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</body>
</html>
