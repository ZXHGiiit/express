<%--
  Created by IntelliJ IDEA.
  User: mingxin.wang
  Date: 16/7/5
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="xiaoxue.wang">
    <!-- Bootstrap Core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">

    <title> Team Member Info</title>

</head>
<body>
<h2>Team Member</h2>
<div class="container-fluid">

    <%--更新lead--%>
    <div class="row">
        <div class="col-md-3">
            <input type="text" class="form-control" id="memberAccount"
                   placeholder="Enter Member Email"/>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-default" onclick="getMemberInfo();"> 获取Member
                Info
            </button>
        </div>
    </div>

    <h3>当前team member 信息: </h3>
    <div class="row">
        <div class="col-md-5" id="curMemberInfo">

        </div>
    </div>

    <h3>Team Creator 信息: </h3>
    <div class="row">
        <div class="col-md-5" id="creatorInfo">

        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <input type="text" class="form-control" id="reloadMemberAccount"
                   placeholder="Enter Member Email Or UserId"/>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-default" onclick="reloadUser();"> Reload Member
                Rredis Info
            </button>
        </div>
    </div>

</div>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
<script>
    function getMemberInfo() {
        var memberAccount = $("#memberAccount").val();
        $.ajax({
                   type: "POST",
                   url: "<%=request.getContextPath()%>/agentsite/detail",
                   data: {
                       "email": memberAccount
                   },
                   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                   dataType: "json",
                   success: function (data) {
                       var jsonData = eval(data);
                       var status = jsonData.status.code;
                       var curMemberInfo = "";

                       var creatorInfo = "";
                       if (status == 0) {
                           var memberInfo = jsonData.data;
                           curMemberInfo = "Current Team Member Id: " + memberInfo.curId + "<br>";
                           curMemberInfo +=
                               "Current Team Member Name: " + memberInfo.curName + "<br>";
                           curMemberInfo +=
                               "Current Team Member Email: " + memberInfo.curEmail + "<br>";
                           curMemberInfo +=
                               "Current Team Member Crm: <a href='" + memberInfo.crmUrl
                               + "'> member crm<a><br>";

                           creatorInfo += "Creator Id: " + memberInfo.creatorId + "<br>";
                           creatorInfo += "Creator Name: " + memberInfo.creatorName + "<br>";
                           creatorInfo += "Creator Email: " + memberInfo.creatorEmail + "<br>";
                           creatorInfo +=
                               "Creator Crm: <a href='" + memberInfo.creatorCrmUrl
                               + "'> creator crm<a><br>";
                       } else {
                           curMemberInfo = "Get Team Member Info Failed."
                       }

                       $("#curMemberInfo").html(curMemberInfo);
                       $("#creatorInfo").html(creatorInfo);

                   }
               });
    }

    function reloadUser() {
        var memberAccount = $("#reloadMemberAccount").val();
        $.ajax({
                   type: "POST",
                   url: "<%=request.getContextPath()%>/agentsite/reloadRedis",
                   data: {
                       "email": memberAccount
                   },
                   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                   dataType: "json",
                   success: function (data) {
                       var jsonData = eval(data);
                       var status = jsonData.status.code;
                       if (status == 0) {
                           alert("Reload Success.");
                       } else {
                           alert("Reload Failed.");
                       }
                   }
               });
    }


</script>
</body>
</html>
