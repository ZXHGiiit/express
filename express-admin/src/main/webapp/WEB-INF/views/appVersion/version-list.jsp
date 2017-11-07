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
  <h5>
	Update Type: 1 强制升级, 2 选择升级<br><br>
        Update Status: 1 Online, 2 Test<br><br>
  </h5>
  <table class="table table-hover">
    <thead>
    <tr>
      <th>Id</th>
      <th>App Id</th>
      <th>App Version</th>
      <th>Update Type</th>
      <th>Status</th>
      <th>Detail</th>
      <th>Operation</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${versionList}" var="appversion">
      <tr>
        <td>
	   	${appversion.id}
		<input type="hidden" class="form-control id" value="${appversion.id}"/>
	</td>
        <td class="appId" >${appversion.appId}</td>
        <td class="appVersion">${appversion.appVersion}</td>
        <td>
		<input type="text" class="form-control type" value="${appversion.type}"/>
	</td>
        <td>
		<input type="text" class="form-control status" value="${appversion.status}"/>
	</td>
        <td>
		Title: <input type="text" class="form-control title" value="${appversion.title}"/><br>
		Content: <input type="text" class="form-control content" value="${appversion.content}"/><br>
		MarketUrl: <input type="text" class="form-control marketUrl" value="${appversion.marketUrl}"/><br>
	</td>
	<td>
		<button type="button" class="btn btn-default updateButton"> Update </button>
		<button type="button" class="btn btn-default deleteButton"> Delete </button>
	</td>
      </tr>
    </c:forEach>
      <tr>
        <td></td>
        <td>
		${appId}
		<input type="hidden" class="form-control appId" value="${appId}"/>
	</td>
        <td>
		<input type="text" class="form-control appVersion"/>
	</td>
        <td>
		<input type="text" class="form-control type"/>
	</td>
        <td>
		<input type="text" class="form-control status"/>
	</td>
        <td>
		Title: <input type="text" class="form-control title" /><br>
		Content: <input type="text" class="form-control content"/><br>
		MarketUrl: <input type="text" class="form-control marketUrl"/><br>
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
    $('.updateButton').on('click',function(){
	update($(this));
    })
    $('.deleteButton').on('click',function(){
	del($(this));
    })
    function add($e) {
	//debugger
	var $dom = $e.closest('tr');
        var appId = $dom.find(".appId").val();
        var appVersion = $dom.find(".appVersion").val();
        var type = $dom.find(".type").val();
        var status = $dom.find(".status").val();
        var title = $dom.find(".title").val();
        var content = $dom.find(".content").val();
        var marketUrl= $dom.find(".marketUrl").val();
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/appVersion/add",
            data : {
                "appId":appId,
                "appVersion":appVersion,
                "type":type,
                "status":status,
                "title":title,
                "content":content,
                "marketUrl":marketUrl,
            },
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "text",
            success: function(){
                window.location.reload();
            }
        });
    }
    function update($e) {
	var $dom = $e.closest('tr');
        var id = $dom.find(".id").val();
        var type = $dom.find(".type ").val();
        var status = $dom.find(".status ").val();
        var title = $dom.find(".title ").val();
        var content = $dom.find(".content ").val();
        var marketUrl = $dom.find(".marketUrl ").val();
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/appVersion/update",
            data : {
                "id":id,
                "type":type,
                "status":status,
                "title":title,
                "content":content,
                "marketUrl":marketUrl,
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
        //var id = $dom.find(".id").val();
        var id = $dom.find(".id").val();
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/appVersion/del",
            data : {
                "id":id,
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
