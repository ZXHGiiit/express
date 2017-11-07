<%--
  Created by IntelliJ IDEA.
  User: kunkun.an
  Date: 2017/8/15
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>email binding modify</title>
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
                <input type="text" class="form-control old-email"
                       placeholder="Enter your existing chime email"/>
            </td>
            <td>
                <input type="text" class="form-control new-email"
                       placeholder="Enter new chime email you want to own"/>
            </td>
            <td>
                <button type="button" id='updateButton' class="btn btn-default"> update</button>
            </td>
        </tr>
        </tbody>
    </table>
    <div>
        <span id="result"> </span>
    </div>
</div>
</body>
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
    $('#updateButton').on('click', function () {
        update($(this));
    })

    function update($e) {
        var $dom = $e.closest('tr');
        var old_email = $dom.find(".old-email").val();
        var new_email = $dom.find(".new-email").val();
        //alert("old_email=" + old_email + "||new_email=" + new_email);
        $.ajax({
                   type: "POST",
                   url: "<%=request.getContextPath()%>/emailManagement/emailBinding/update",
                   data: {
                       "old_email": old_email,
                       "new_email": new_email,
                   },
                   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                   dataType: "text",
                   success: function (data) {
                       retData = eval('(' + data + ')')
                       //var retData = data;
                       $("#result").text(retData.status.msg);
                       //window.location.reload();
                   }
               });
    }
</script>
</html>
