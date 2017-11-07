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
<body class="order-list">
<%@ include file="common/header.jsp"%>
<div class="my-container table-container">
<table id="table" class="table table-striped table-hover">
<thead>
<tr>
<th style="display:none">Start Date Time</th>
<th>Agent Name</th>
<th>Order Id</th>
<th>Team Id</th>
<th>Status</th>
<!-- <th style="min-width:90px">Type</th> -->
<th>Create Time</th>
<th style="min-width:70px">Start Time</th>
<th>Next Recurring Time</th>
<th style="min-width:70px">End Time</th>
<th>Total Amount</th>
<th>Purchase Amount</th>
<th>Chime subscription</th>
<th>Buyer Package</th>
<th>Seller Package</th>
<th>Listing Package</th>
<th>Retention Package</th>
<th>Contract Duration</th>
<th>Notes</th>
<th>Create User Account</th>
</tr>
</thead>
<tbody>
<c:forEach items="${adminOrderList}" var="adminOrder">
<tr>
<c:set var="agent" value="${adminOrder.userInfoAdmin}"></c:set>
<c:set var="order" value="${adminOrder.paymentOrder}"></c:set>
<c:set var="end" value="${adminOrder.endTime}"></c:set>
<c:set var="recurring" value="${adminOrder.nextRecurringTime}"></c:set>
<td style="display:none">${order.id}</td>
<td class="agent-name"><a href="/backend/payment/agent/detail?userId=${agent.userId}">${agent.firstName} ${agent.lastName}
<c:if test="${empty agent.firstName && empty agent.lastName}">/</c:if>
</a></td>
<td title="${agent.userId}"><a href="/backend/payment/agent/detail?userId=${agent.userId}"><script>document.write("${order.id}")</script></a></td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">${agent.teamId}</a></td>
<td title="order id: ${order.id}"><a href="/backend/payment/agent/detail?userId=${agent.userId}">
<c:choose>
<c:when test="${order.status == 1}">unpaid</c:when>
<c:when test="${order.status == 2}">active</c:when>
<c:when test="${order.status == 3}">inactive</c:when>
<c:when test="${order.status == 4}">inactive</c:when>
<c:when test="${order.status == 5}">freetrail</c:when>
<c:when test="${order.status == 6}">end</c:when>
<c:otherwise>Unknown status</c:otherwise>
</c:choose></a>
</td>
<!--  <td>
<c:if test="${order.payType == 1}">one time</c:if>
<c:if test="${order.payType == 2}">by frequency</c:if>
</td> -->
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}"><fmt:formatDate value="${order.createTime}" pattern="yyy-MM-dd"/></a></td>
<td title='<fmt:formatDate value="${order.beginTime}" pattern="yyy-MM-dd HH:mm"/>'><a href="/backend/payment/agent/detail?userId=${agent.userId}">
<fmt:formatDate value="${order.beginTime}" pattern="yyy-MM-dd"/></a>
</td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}"><fmt:formatDate value="${recurring}" pattern="yyy-MM-dd"/></a></td>
<!-- <td>
<c:if test="${order.payType == 1}">/</c:if>
<c:if test="${order.payType != 1}">
<script>document.write(PAGE_UTIL.addDateByMonth(<fmt:formatDate value="${order.beginTime}" pattern="[yyy, MM, dd]"/>, ${order.notifyCount}));</script></td>
</c:if>
<td><script>document.write(PAGE_UTIL.addDateByMonth(<fmt:formatDate value="${order.beginTime}" pattern="[yyy, MM, dd]"/>, ${order.duration}));</script></td> -->
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}"><fmt:formatDate value="${end}" pattern="yyy-MM-dd"/></a></td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">$${fn:replace(order.totalPrice, ".00", "")}</a></td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">$${fn:replace(order.realTotalPrice, ".00", "")}</a></td>
<c:set var="subscription" value="0"/>
<c:set var="buyer" value="0"/>
<c:set var="Seller" value="0"/>
<c:set var="Listing" value="0"/>
<c:set var="Retention" value="0"/>
<c:forEach items="${adminOrder.itemList}" var="info">
<c:if test="${info.productType == 1 && not empty info.realPrice}">
<c:set var="subscription" value="${info.realPrice}"/>
</c:if>
<c:if test="${info.productType == 2 && not empty info.realPrice}">
<c:set var="buyer" value="${info.realPrice}"/>
</c:if>
<c:if test="${info.productType == 3 && not empty info.realPrice}">
<c:set var="Seller" value="${info.realPrice}"/>
</c:if>
<c:if test="${info.productType == 5 && not empty info.realPrice}">
<c:set var="Listing" value="${info.realPrice}"/>
</c:if>
<c:if test="${info.productType == 6 && not empty info.realPrice}">
<c:set var="Retention" value="${info.realPrice}"/>
</c:if>
</c:forEach>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">
$${subscription}</a>
</td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">
$${buyer}</a>
</td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">
$${Seller}</a>
</td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">
$${Listing}</a>
</td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">
$${Retention}</a>
</td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">${order.duration}</a></td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">${agent.note}<c:if test="${empty agent.note}">/</c:if></a></td>
<td><a href="/backend/payment/agent/detail?userId=${agent.userId}">${order.createUserAccount}</a></td>
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
