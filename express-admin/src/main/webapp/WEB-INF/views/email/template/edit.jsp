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
    <script src="//cdn.bootcss.com/jquery/1.9.1/jquery.js"></script>
    <script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="//cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
  <script>

    function edit(){

      var id = ${template.id};
      var subject = $("#subject").val();
      var businessName = $("#businessName").val();
      var groupId = $("#groupId").val();
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
        url : "<%=request.getContextPath()%>/email/template/edit",
        data : {
//          "id":id,
//          "subject":encodeURI(subject),
//          "businessName":businessName,
//          "groupId":groupId,
//          "description":encodeURI(description),
//          "bodyContent":encodeURI(bodyContent)
          "id":id,
          "subject":subject,
          "businessName":businessName,
          "groupId":groupId,
          "description":description,
          "bodyContent":bodyContent
        },
        contentType:"application/x-www-form-urlencoded;charset=UTF-8",
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

    <div class="input-group input-group-lg">
      <span class="input-group-addon" >subject:</span>
      <input type="text" class="form-control" id="subject" value="${template.subject}"/>
    </div>

    <div class="input-group input-group-lg">
      <span class="input-group-addon">businessName:</span>
      <input type="text" class="form-control" id="businessName" value="${template.businessName}" aria-describedby="sizing-addon2"/>
    </div>

    <div class="input-group input-group-lg">
      <span class="input-group-addon">groupId:</span>
      <input type="text" class="form-control" id="groupId" value="${template.groupId}" disabled/>
    </div>

    <div class="input-group input-group-lg">
      <span class="input-group-addon">tag:</span>
      <input type="text" class="form-control" id="tag" value="${template.tag}" disabled/>
    </div>

    <div class="input-group input-group-lg">
      <span class="input-group-addon">description:</span>
      <input type="text" class="form-control" id="description" value="${template.description}"/>
    </div>

    <div class="form-group">
      <label for="bodyContent">bodyContent:</label>
      <br>
      <textarea class="form-control" rows="50" cols="150" id="bodyContent">${template.bodyContent}</textarea>
    </div>
    <button type="button" class="btn btn-primary btn-lg" onclick="edit()">Submit</button>
  </form>
</body>
</html>
