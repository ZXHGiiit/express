<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Agent List</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
  <%--<h2>Paid Agent</h2>--%>
  <table class="table table-hover">
    <thead>
    <tr>
      <th>User Id</th>
      <th>Account</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user">
      <tr>
        <td>
	   	${user.id}
		<input type="hidden" class="form-control id" value="${user.id}"/>
	</td>
        <td class="account" >${user.account}</td>
	<td>
		<button type="button" class="btn btn-default removeButton"> Remove </button>
	</td>
      </tr>
    </c:forEach>
      <tr>
        <td></td>
        <td>
		<input type="text" class="form-control account"/>
	</td>
	<td>
		<button type="button" id='addButton' class="btn btn-default"> Add </button>
	</td>
      </tr>
    </tbody>
  </table>
</div>

</body>

<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
    $('#addButton').on('click',function(){
	add($(this));
        
    })

    $('.removeButton').on('click',function(){
	del($(this));
    })
    function add($e) {
	//debugger
	    var $dom = $e.closest('tr');
        var account = $dom.find(".account").val();
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/appTestUser/add",
            data : {
                "account":account,
            },
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "text",
	        success: function(){
		        window.location.reload();
            }
        });
    }
    function del($e) {
	var $dom = $e.closest('tr');
        var id = $dom.find(".id").val();
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/appTestUser/del",
            data : {
                "userId":id,
            },
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "text",
            success: function(){
                window.location.reload();
            }
        });
    }
</script>
</html>
