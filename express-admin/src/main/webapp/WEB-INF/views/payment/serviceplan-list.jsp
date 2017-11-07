<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="zh-CN">
<head>
<%@include file="common/common-head.jsp"%>
<title>Service Plan | Payment Admin</title>
<link rel="stylesheet" type="text/css" href="/backend/static/payment-admin/service-plan.css?v=${staticVersion}"></link>
</head>
<body class="service-plan">
<%@include file="common/header.jsp"%>
<div class="my-container table-container">
<table class="table table-striped plan-table table-hover" id="table">
<thead>
<tr>
<th style="width:25px">Plan No.</th>
<th>Agent Name</th>
<th>Agent No.</th>
<th>Status</th>
<th style="min-width:75px">Start Time</th>
<th style="min-width:75px">End Time</th>
<th>Set up Fee</th>
<th>Basic Package</th>
<th>Buyer Package</th>
<th>Seller Package</th>
<th>Contract Duration</th>
<th>Amount</th>
<th>Freq.</th>
<th>Pay Type</th>
</tr>
</thead>
<tbody>
<c:forEach items="${servicePlanList}" var="plan">
<tr>
<td>${plan.id}</td>
<td class="agent-name"><a href="/payment/agent/detail?agentId=${plan.agentId}">${plan.agentName}</a></td>
<td>${plan.agentId}</td>
<td>
<c:choose>
<c:when test="${plan.status == 1}">Active</c:when>
<c:when test="${plan.status == 2}"><i>Inactive</i></c:when>
<c:when test="${plan.status == 3}">Completed</c:when>
<c:when test="${plan.status == 4}">Terminated</c:when>
<c:otherwise>Unknown Status: ${plan.status}</c:otherwise>
</c:choose>
</td>
<td title='<fmt:formatDate value="${plan.startTime}" pattern="yyyy-MM-dd HH:mm"/>'><fmt:formatDate value="${plan.startTime}" pattern="yyyy-MM-dd"/></td>
<td title='<fmt:formatDate value="${plan.endTime}" pattern="yyyy-MM-dd HH:mm"/>' data-time="${plan.endTime.time}" data-status="${plan.status}" class="end-time"><fmt:formatDate value="${plan.endTime}" pattern="yyyy-MM-dd"/></td>
<td>$<c:if test='${empty plan.packageName2Price["setUpFree"]}'>0</c:if>${plan.packageName2Price["setUpFree"]}</td>
<td>$<c:if test='${empty plan.packageName2Price["basicPackage"]}'>0</c:if>${plan.packageName2Price["basicPackage"]}</td>
<td>$<c:if test='${empty plan.packageName2Price["buyerPackage"]}'>0</c:if>${plan.packageName2Price["buyerPackage"]}</td>
<td>$<c:if test='${empty plan.packageName2Price["sellerPackage"]}'>0</c:if>${plan.packageName2Price["sellerPackage"]}</td>
<td>${plan.frequencyCount} Months</td>
<td>$${plan.amount}</td>
<td>Monthly</td>
<td>
<c:choose>
<c:when test="${plan.type == 1}">First</c:when>
<c:when test="${plan.type == 2}">Monthly</c:when>
<c:otherwise>Unknown ${plan.type}</c:otherwise>
</c:choose>
</td>
</tr>
</c:forEach>
</tbody>
</table>
<%@ include file="common/search-table.jsp"%>
</div>
<%@include file="common/footer.jsp"%>
<script src="/backend/static/payment-admin/service-plan.js?v=${staticVersion}"></script>
</body>
</html>
