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
  <h2>Agent's Site</h2>
  <table class="table table-hover">
    <thead>
    <tr>
      <th>Domain</th>
      <th>Account</th>
      <th>Site Id</th>
      <th>Agent Id</th>
      <th>Visit</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="obj">
      <tr>
        <td>${obj.domain}</td>
        <td>${obj.account}</td>
        <td>${obj.siteId}</td>
        <td>${obj.uId}</td>
        <td><a href="${obj.visitUrl}" target="_blank"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>

<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>