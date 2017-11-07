<%--
  Created by IntelliJ IDEA.
  User: mingxin
  Date: 16/7/6
  Time: 下午12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title> Edit Template </title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="//cdn.bootcss.com/jquery/1.12.1/jquery.js"></script>
    <script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <script src="//cdn.bootcss.com/metisMenu/1.1.3/metisMenu.js"></script>
    <script>

        <%--$(document).ready(function(){--%>
            <%--$.ajax({--%>
                <%--type:"POST",--%>
                <%--url:"<%=request.getContextPath()%>/group/getAll",--%>
                <%--contentType:"application/x-www-form-urlencoded; charset=UTF-8",--%>
                <%--dataType: "json",--%>
                <%--success : function(msg) {--%>
                    <%--var groups = JSON.stringify(msg.data);--%>
                    <%--$.each(groups, function(i, item) {--%>
                        <%--$("#mytable").append();--%>
                    <%--});--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>

        function addTemplate(){
            var subject = $("#subject").val();
            var businessName = $("#businessName").val();
            var groupId = $("#groupId").find("option:selected").val();
            var description = $("#description").val();
            var bodyContent = $("#bodyContent").val();

            if(subject == ""){
                alert("Subject must be filled!");
                return;
            }

            if(businessName == ""){
                alert("BusinessName must be filled!");
                return;
            }

            if(description == ""){
                alert("Description must be filled!");
                return;
            }

            if(bodyContent == ""){
                alert("BodyContent must be filled!");
                return;
            }

            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/email/template/add",
                data : {
                    "subject":subject,
                    "businessName":businessName,
                    "groupId":groupId,
                    "description":description,
                    "bodyContent":bodyContent
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

<form>

    <div class="form-group">
        <label for="subject">subject:</label>
        <input type="text" class="form-control" id="subject" placeholder="subject"/>
    </div>

    <div class="form-group">
        <label for="businessName">businessName:</label>
        <input type="text" class="form-control" id="businessName" placeholder="businessName"/>
    </div>

    <div class="form-group">
        <label for="groupId">groupId:</label>
        <%--<div id = "groupSelect">--%>

        <%--</div>--%>
        <select class="form-control" id="groupId">
            <c:if test="${not empty groups}">
                <c:forEach items="${groups}" var="group">
                    <option value="${group.id}">${group.name}</option>
                </c:forEach>
            </c:if>
        </select>
    </div>

    <div class="form-group">
        <label for="description">description:</label>
        <input type="text" class="form-control" id="description" placeholder="description"/>
    </div>

    <div class="form-group">
        <label for="bodyContent">bodyContent:</label>
        <br>
      <textarea class="form-control" rows="50" cols="150" id="bodyContent" placeholder="在这里填写模版主体内容..."></textarea>
    </div>

    <button type="button" class="btn btn-primary btn-lg" onclick="addTemplate()">添加模版</button>

</form>
<br>
</body>
</html>
