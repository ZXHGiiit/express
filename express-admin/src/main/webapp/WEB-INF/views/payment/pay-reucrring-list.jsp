<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="zh-CN">
<head>
<title>Order List | Payment Admin</title>
<%@ include file="common/common-head.jsp"%>
<link rel="stylesheet" type="text/css" href="/backend/static/payment-admin/order-list.css?v=${staticVersion}"></link>
</head>
<body class="recurring-list">
<%@ include file="common/header.jsp"%>
<div class="my-container table-container">
<table id="table" class="table table-striped table-hover">
<thead>
<tr>
<th>Agent Name</th>
<th>Agent No.</th>
<th>Status</th>
<th>Retry Count</th>
<th>Amount</th>
<th style="display:none">Update Time</th>
<th>Start Date</th>
<th>Next Date</th>
<th>End Date</th>
</tr>
</thead>
<tbody>
<c:forEach items="${payRecurringList}" var="payRecurring">
<tr>
<c:set var="agent" value="${payRecurring.userInfoAdmin}"></c:set>
<c:set var="recurring" value="${payRecurring.payRecurring}"></c:set>
<td class="agent-name"><a href="/backend/payment/agent/detail?userId=${agent.userId}">${agent.firstName} ${agent.lastName}
<c:if test="${empty agent.firstName && empty agent.lastName}">/</c:if>
</a></td>
<td title="${agent.userId}"><script>document.write("${agent.userId}".substr(-5))</script></td>
<td>
<c:choose>
<c:when test="${recurring.recurringStatus == 1}">activated</c:when>
<c:when test="${recurring.recurringStatus == 2}">suspended</c:when>
<c:when test="${recurring.recurringStatus == 3}">retry</c:when>
<c:when test="${recurring.recurringStatus == 4}">past due</c:when>
<c:when test="${recurring.recurringStatus == 5}">error</c:when>
<c:otherwise>unknown status: ${recurring.recurringStatus}</c:otherwise>
</c:choose>
</td>
<td>${7 - recurring.lastRetryCount}</td>
<td>$${recurring.recurringAmount / 100}</td>
<td style="display:none"><fmt:formatDate value="${recurring.updateTime}" pattern="yyy-MM-dd hh:mm"/></td>
<td>${recurring.startDate}</td>
<td>${recurring.nextDate}</td>
<td>${recurring.endDate}</td>
</tr>
</c:forEach>
</tbody>
</table>
<%@include file="common/search-table.jsp"%>
</div>
<%@ include file="common/footer.jsp"%>
<script src="/backend/static/payment-admin/order-list.js?v=${staticVersion}"></script>
</body>
</html>
