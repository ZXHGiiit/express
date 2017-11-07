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
  <title> Common Config </title>
  <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
  <!-- jQuery -->
  <script src="//cdn.bootcss.com/jquery/1.9.1/jquery.js"></script>
  <script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
  <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="//cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
  <script>

    function edit(){

      var id = ${config.id};
      var bizName = $("#bizName").val();
      var description = $("#description").val();
      var body = $("#body").val();

      if(bizName == ""){
        alert("bizName must be filled!");
        return;
      }

      $.ajax({
        type : "POST",
        url : "<%=request.getContextPath()%>/commonconfig/key/edit",
        data : {
          "id":id,
          "bizName":bizName,
          "description":description,
          "body":body
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
    <span class="input-group-addon" >id:</span>
    <input type="text" class="form-control" id="id" value="${config.id}" disabled/>
  </div>

  <div class="input-group input-group-lg">
    <span class="input-group-addon">bizGroup:</span>
    <input type="text" class="form-control" id="bizGroup" value="${config.bizGroup}" aria-describedby="sizing-addon2" disabled/>
  </div>

  <div class="input-group input-group-lg">
    <span class="input-group-addon">bizName:</span>
    <input type="text" class="form-control" id="bizName" value="${config.bizName}" />
  </div>

  <div class="input-group input-group-lg">
    <span class="input-group-addon">tag:</span>
    <input type="text" class="form-control" id="tag" value="${config.tag}" disabled/>
  </div>

  <div class="input-group input-group-lg">
    <span class="input-group-addon">description:</span>
    <input type="text" class="form-control" id="description" value="${config.description}"/>
  </div>

  <div class="input-group input-group-lg">
    <span class="input-group-addon">bodyVer:</span>
    <input type="text" class="form-control" id="bodyVer" value="${config.bodyVer}" disabled/>
  </div>

  <div class="form-group">
    <label for="body">body:</label>
    <br>
    <textarea class="form-control" rows="50" cols="20" id="body">${config.body}</textarea>
  </div>
  <button type="button" class="btn btn-primary btn-lg" onclick="edit()">Submit</button>
</form>
</body>
</html>
