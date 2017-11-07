<%--
  Created by IntelliJ IDEA.
  User: kunkun.an
  Date: 2017/8/15
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>fake email management</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <table class="table table-hover">
        <tbody>
        <tr>
            <td>
                <input type="text" class="form-control email"
                       placeholder="Enter fake email you want to add"/>
            </td>
            <td>
                <button type="button" id='addButton' class="btn btn-default"> Add</button>
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
    $('#addButton').on('click', function () {
        add($(this));
    })

    function add($e) {
        var $dom = $e.closest('tr');
        var email = $dom.find(".email").val();
//        alert("email=" + email);
        $.ajax({
                   type: "POST",
                   url: "<%=request.getContextPath()%>/emailManagement/fakeEmail/add",
                   data: {
                       "email": email,
                   },
                   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                   dataType: "text",
                   success: function () {
                       window.location.reload();
                   }
               });
    }
</script>
</html>
