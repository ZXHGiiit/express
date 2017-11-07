<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="zh-CN">
<head>
<title>Transaction List | Payment Admin</title>
<%@ include file="common/common-head.jsp"%>
<link rel="stylesheet" type="text/css" href="/backend/static/payment-admin/order-list.css?v=${staticVersion}"></link>
</head>
<body class="transaction-list">
<%@ include file="common/header.jsp"%>
<div class="my-container table-container">
<table id="table" class="table table-striped table-hover">
<thead>
<tr>
<th style="display:none">Pay Transaction Id</th>
<th>Agent Name</th>
<th>Agent No.</th>
<th>Status</th>
<th style="min-width: 90px">Type</th>
<th>Create Time</th>
<!--
<th>End Time</th>
-->
<th>Total Amount</th>
<th>Purchase Amount</th>
<!--               <th>Packages</th>
<th>Contract Duration</th>
<th>Notes</th>
-->
<th>Operation</th>
</tr>
</thead>
<tbody>
<c:forEach items="${payTransactionMergeInfoList}" var="transaction">
<tr>
<c:set var="agent" value="${transaction.userInfoAdmin}"></c:set>
<c:set var="order" value="${transaction.paymentOrder}"></c:set>
<c:set var="payTransaction" value="${transaction.payTransaction}"></c:set>
<td style="display:none">${payTransaction.id}</td>
<td class="agent-name"><a href="/backend/payment/agent/detail?userId=${agent.userId}">${agent.firstName} ${agent.lastName}
<c:if test="${empty agent.firstName && empty agent.lastName}">/</c:if>
</a></td>
<td title="${agent.userId}"><script>document.write("${agent.userId}")</script></td>
<td>${payTransaction.transactionStatus}</td>
<td>${payTransaction.transactionType}</td>
<td title='<fmt:formatDate value="${payTransaction.createTime}" pattern="yyy-MM-dd hh:mm"/>'><fmt:formatDate value="${payTransaction.createTime}" pattern="yyy-MM-dd"/></td>
<!--
<td><c:if test="${not empty order.createTime}"><script>document.write(PAGE_UTIL.addDateByMonth(<fmt:formatDate value="${order.createTime}" pattern="[yyy, MM, dd]"/>, ${order.duration}));</script></c:if></td>
-->
<td>$${transaction.totalAmount}</td>
<td>
<c:choose>
<c:when test="${payTransaction.transactionType == 'void'}">-$${payTransaction.amount / 100}</c:when>
<c:otherwise>$${payTransaction.amount / 100}</c:otherwise>
</c:choose>
</td>
<!--
<td>
<c:if test="${not empty order.id}"><button type="button" data-id="${order.id}" class="order-detail">Detail</button></c:if>
<c:if test="${empty order.id}">/</c:if>
</td>
<td>${order.duration}</td>
<td>${payTransaction.errorMsg}<c:if test="${empty payTransaction.errorMsg}">/</c:if></td>
-->
<td><button type="button" class="email-transaction">Email</button></td>
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
