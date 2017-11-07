<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Agent List | Payment Admin</title>
<%@ include file="common/common-head.jsp"%>
<link rel="stylesheet" type="text/css" href="/backend/static/payment-admin/agent-list.css?v=${staticVersion}"></link>
</head>
<body class="agent-list">
<%@ include file="common/header.jsp"%>
<div class="my-container">
<button type="button" class="btn btn-primary" id="show-add-agent">+Add Agent</button>
</div>
<div class="my-container table-container">
<table id="table" class="table table-striped table-hover">
<thead>
<tr>
<th style="display:none">Add Date Time</th>
<th>Agent Name</th>
<th style="min-width:90px">Agent No.</th>
<th>Agent Type</th>
<th>Email</th>
<th>City</th>
<th>State</th>
<th style="min-width:80px">Add Time</th>
<th>Note</th>
<th>Operation</th>
</tr>
</thead>
<tbody>
<c:forEach items="${userList}" var="agent">
<tr data-id="${agent.userId}">
<td style="display:none"><fmt:formatDate value="${agent.addTime}" pattern="HH:mm:ss"/></td>
<td class="agent-name"><a href="/backend/payment/agent/detail?userId=${agent.userId}">${agent.firstName} ${agent.lastName}</a></td>
<td>${agent.userId}</td>
<td>${agent.authDesc}</td>
<td>${agent.email}</td>
<td>${agent.city}<c:if test="${empty agent.city}">/</c:if></td>
<td>${agent.state}<c:if test="${empty agent.state}">/</c:if></td>
<td title='<fmt:formatDate value="${agent.addTime}" pattern="yyyy-MM-dd HH:mm"/>'><fmt:formatDate value="${agent.addTime}" pattern="yyyy-MM-dd"/></td>
<td>${agent.note}<c:if test="${empty agent.note}">/</c:if></td>
<td><button type="button" class="delete-agent secondary">Delete</button></td>
</tr>
</c:forEach>
</tbody>
</table>
<%@ include file="common/search-table.jsp"%>
</div>
<%@ include file="common/footer.jsp"%>
<script src="/backend/static/payment-admin/agent-list.js?v=${staticVersion}"></script>
</body>
</html>
