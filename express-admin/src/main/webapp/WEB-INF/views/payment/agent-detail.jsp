<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="zh-CN">
<head>
<%@include file="common/common-head.jsp"%>
<title>${agent.firstName} | Agent Detail | Payment Admin</title>
<link rel="stylesheet" type="text/css" href="/backend/static/payment-admin/agent-detail.css?v=${staticVersion}"></link>
</head>
<body class="agent-detail">
<%@ include file="common/header.jsp"%>
<h1 class="my-container">Agent Details</h1>
<section class="my-container basic-info infos clearfix">
<h2>Basic Info <span class="glyphicon glyphicon-edit" title="Edit"></span></h2>
<p style="background-color:#fff"><span><b>Agent Type: </b></span><span><b>${agent.authDesc}</b></span></p>
<div>
<p><span>Agent Name: </span><span>${agent.firstName} ${agent.lastName}</span></p>
<p><span>Phone: </span><span>${agent.phoneNumber}</span></p>
<p><span>Brokerage: </span><span>${agent.brokerage}<c:if test="${empty agent.brokerage}">/</c:if></span></p>
<p><span>City: </span><span>${agent.city}<c:if test="${empty agent.city}">/</c:if></span></p>
<p><span>State/Province: </span><span>${agent.state}<c:if test="${empty agent.state}">/</c:if></span></p>
<p><span>Register Date: </span><span><fmt:formatDate value="${agent.createTime}" pattern="yyyy-MM-dd"/></span></p>
</div>
<div>
<p><span>Agent No.: </span><span>${agent.userId}</span></p>
<p><span>Email: </span><span>${agent.email}</span></p>
<p><span>Address: </span><span>${agent.address}<c:if test="${empty agent.address}">/</c:if></span></p>
<p><span>Zipcode: </span><span>${agent.zipcode}<c:if test="${empty agent.zipcode}">/</c:if></span></p>
<p><span>Country: </span><span>${agent.country}<c:if test="${empty agent.country}">/</c:if></span></p>
</div>
<p style="background-color:#fff"><span><b>CRM Info</b></span></p>
<div>
<p><span>Status: </span><span>${crmInfo.crmStatus}</span></p>
<!-- <p><span>Account: </span><span>${crmInfo.account}</span></p>
<p><span>Intial password: </span><span>${crmInfo.initialPassword}</span></p> -->
<!-- <p><span>Register Date: </span><span><fmt:formatDate value="${crmInfo.registerDate}" pattern="yyyy-MM-dd"/></span></p> -->
</div>
</section>
<hr>
<section class="payment-info infos my-container clearfix">
<h2>Payment Info<span class="glyphicon glyphicon-edit" title="Edit" style="display:none"></span> <span class="glyphicon glyphicon-plus"></span></h2>
<c:if test="${fn:length(payCardInfoList) == 0}"><p><span>No card yet!</span></p></c:if>
<c:if test="${fn:length(payCardInfoList) != 0}"><script>PAGE_DATA.cards = [];</script></c:if>
<c:forEach items="${payCardInfoList}" var="card">
<script>PAGE_DATA.cards.push({cardType: ${card.cardType}, cardHolderName: "${card.cardHolderName}", cardNumber: "${card.cardNumber}", expiryDate: "${card.expiryDate}", cardVerificationNumber: "${card.cardVerificationNumber}", id: ${card.id}});</script>
<div class="a-card">
<p><span>Card Type</span><span>
<c:choose>
<c:when test="${card.cardType == 1}">Visa</c:when>
<c:when test="${card.cardType == 2}">Master</c:when>
<c:when test="${card.cardType == 3}">American Express</c:when>
<c:when test="${card.cardType == 4}">Discover</c:when>
<c:when test="${card.cardType == 5}">JCB</c:when>
<c:otherwise>Unknown Card Type: ${card.cardType}</c:otherwise>
</c:choose>
</span>
</p>
<p><span>Name on Account</span><span>${card.cardHolderName}</span></p>
<c:set var="cardLen" value="${fn:length(card.cardNumber)}"></c:set>
<p><span>Credit Card Number</span><span>***${fn:substring(card.cardNumber, cardLen - 4, cardLen)}</span></p>
<p><span>Expiration Day</span><span>${card.expiryDate}</span></p>
<p><span>Security Code</span><span>${card.cardVerificationNumber}</span></p>
</div>
</c:forEach>
</section>
<hr>
<section class="my-container service-order infos">
<h2>Order
<span class="glyphicon glyphicon-edit show-order" title="Edit" data-type="edit"></span>
<span class="glyphicon glyphicon-envelope open-send-email"></span>
<button type="button" class="glyphicon glyphicon-pause pause-order" id="pause-order"></button>
</h2>
<c:set var="paymentOrderInfo" value="${paymentOrderInfo}"></c:set>
<c:set var="order" value="${paymentOrderInfo.paymentOrder}"></c:set>
<c:if test="${not empty order}">
<p><span>Order No.</span><span id="order-id">${order.id}</span></p>
<p><span>Order Status: </span><span>
<script>PAGE_DATA.orderStatus = ${order.status}; PAGE_DATA.orderId = ${order.id}</script>
<c:choose>
<c:when test="${order.status == 1}">unpaid</c:when>
<c:when test="${order.status == 2}">active</c:when>
<c:when test="${order.status == 3}">inactive</c:when>
<c:when test="${order.status == 4}">inactive</c:when>
<c:when test="${order.status == 5}">freetrail</c:when>
<c:when test="${order.status == 6}">end</c:when>
<c:otherwise>Unknown status</c:otherwise>
</c:choose>
</span></p>
<!--   <p><span>Source: </span><span>
<c:choose>
<c:when test="${order.source == 2}">Admin Created</c:when>
<c:when test="${order.source == 1}">Agent Created</c:when>
<c:otherwise>Unknown Source</c:otherwise>
</c:choose>
</span></p> -->
<script>PAGE_DATA.orders = [
<c:forEach items="${paymentOrderInfo.itemList}" var="pack">{price: ${pack.realPrice}, id: ${pack.productId}, productType: ${pack.productType}, discount: ${pack.price} - ${pack.realPrice}, name: "${pack.name}"},</c:forEach>
];
</script>
<c:forEach items="${paymentOrderInfo.itemList}" var="pack">
<p><span>${pack.name}:</span><span>$${fn:replace(pack.realPrice, ".00", "")} <i style="text-decoration:line-through;color:ccc">(${pack.price})</i></span></p>
</c:forEach>
<p><span>Frequence:</span><span>Monthly</span></p>
<p><span>Contract Duration:</span><span id="order-duration">${order.duration} Months</span></p>
<p><span>Start Time: </span><span id="order-start-time"><fmt:formatDate value="${order.beginTime}" pattern="yyyy-MM-dd"/></span></p>
<p><span>End Time:</span><span id="order-end-time"><fmt:formatDate value="${paymentOrderInfo.endTime}" pattern="yyyy-MM-dd"/></span></p>
<p><span>Order Link: </span><span><a href="${paymentOrderInfo.orderUrl}" target="_blank">${paymentOrderInfo.orderUrl}</a></span></p>
</c:if>
<c:choose>
<c:when test="${empty order}">
<button type="button" class="btn show-order btn-success" data-type="create">Create Order</button>
</c:when>
<c:otherwise>
<button type="button" class="btn show-order btn-success" data-type="edit">Update Order</button>
</c:otherwise>
</c:choose>
</section>
<c:if test="${not empty serviceOrder}">
<!-- 添加order数据 -->
<script>PAGE_DATA.serviceOrder = {id: ${serviceOrder.id}, createTime: '<fmt:formatDate value="${serviceOrder.createTime}" pattern="yyyy-MM-dd hh:mm"/>', frequencyCount: ${serviceOrder.frequencyCount}, orders: []}</script>
<c:forEach items="${serviceOrder.orderItemList}" var="order">
<script>PAGE_DATA.serviceOrder.orders.push({name: "${order.name}", price: "${order.price}", discount: "${order.discount}"});</script>
</c:forEach>
</c:if>
<section class="my-container" style="display:none">
<h2>All Transactions</h2>
<div class="table-container">
</div>
</section>
<form id="agent-data">
<input type="hidden" name="userId" value="${agent.userId}">
<input type="hidden" name="firstName" value="${agent.firstName}">
<input type="hidden" name="lastName" value="${agent.lastName}">
<input type="hidden" name="phone" value="${agent.phoneNumber}">
<input type="hidden" name="city" value="${agent.city}">
<input type="hidden" name="state" value="${agent.state}">
<input type="hidden" name="email" value="${agent.email}">
<input type="hidden" name="address" value="${agent.address}">
<input type="hidden" name="zipcode" value="${agent.zipcode}">
<input type="hidden" name="country" value="${agent.country}">
<input type="hidden" name="brokerage" value="${agent.brokerage}">
</form>
<form id="order-data">
<input type="hidden" name="orderId" value="${serviceOrder.id}">
<input type="hidden" name="planId" value="${servicePlan.id}">
<input type="hidden" name="planStatus" value="${servicePlan.status}">
</form>
<%@include file="common/footer.jsp"%>
<script src="/backend/static/payment-admin/agent-detail.js?v=${staticVersion}"></script>
</body>
</html>
