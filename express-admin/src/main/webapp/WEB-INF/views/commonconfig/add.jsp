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
  <script src="//cdn.bootcss.com/jquery/1.12.1/jquery.js"></script>
  <script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.js"></script>
  <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <script src="//cdn.bootcss.com/metisMenu/1.1.3/metisMenu.js"></script>
  <script>

    function addKey(){
      var bizGroup = $("#bizGroup").val();
      var bizName = $("#bizName").val();
      var description = $("#description").val();
      var body = $("#body").val();
      var bizGroupSelect = $("#bizGroups").find("option:selected").val();

      if(bizGroup == "" && bizGroupSelect == ""){
        alert("bizGroup must be filled!");
        return;
      }

      if(bizName == ""){
        alert("bizName must be filled!");
        return;
      }

      if(description == ""){
        alert("Description must be filled!");
        return;
      }

      $.ajax({
        type : "POST",
        url : "<%=request.getContextPath()%>/commonconfig/key/add",
        data : {
          "bizGroup":bizGroup,
          "bizGroupSelect":bizGroupSelect,
          "bizName":bizName,
          "description":description,
          "body":body
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
    <label for="bizGroup">bizGroup:</label>
    <input type="text" class="form-control" id="bizGroup" placeholder="bizGroup"/>
  </div>

  <div class="form-group">
    <label for="bizGroups">下拉选择group(手动输入的优先级高):</label>
    <select class="form-control" id="bizGroups">
      <c:if test="${not empty bizGroups}">
        <c:forEach items="${bizGroups}" var="bizGroupItem">
          <option value="${bizGroupItem}")">${bizGroupItem}</option>
        </c:forEach>
      </c:if>
    </select>
  </div>

  <div class="form-group">
    <label for="bizName">bizName:</label>
    <input type="text" class="form-control" id="bizName" placeholder="bizName"/>
  </div>



  <div class="form-group">
    <label for="description">description:</label>
    <input type="text" class="form-control" id="description" placeholder="description"/>
  </div>

  <div class="form-group">
    <label for="body">body:</label>
    <br>
    <textarea class="form-control" rows="50" cols="20" id="body" placeholder="在这里填写配置信息..."></textarea>
  </div>

  <button type="button" class="btn btn-primary btn-lg" onclick="addKey()">添加</button>

</form>
<br>
</body>
</html>
