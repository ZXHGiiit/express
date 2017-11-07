<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Config List</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/lib/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/static/js/lib/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/static/js/lib/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/lib/bootstrap-switch.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/lib/bootstrap-switch.min.css">
<style type="text/css">
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	background: rgba(255, 255, 255, .8)
		url('<%=request.getContextPath()%>/static/loading.gif') 50% 50% no-repeat;
}

/* When the body has the loading class, we turn
   the scrollbar off with overflow:hidden */
body.loading {
	overflow: hidden;
}

/* Anytime the body has the loading class, our
   modal element will be visible */
body.loading .modal {
	display: block;
}

li {
	display: inline-block;
	border-right: 1px solid;
	border-bottom: 1px dotted;
	width: 100px;
	margin: 0px auto;
	text-align: center;
}

ul:first-child {
	#border: 1px solid;
	font-color: #555555;
	margin-top: 40px;
}

li:last-child {
	width: 500px;
}

#result {
	font-size: 1.6em;
	color: red;
}
</style>
</head>
<body>
	<div>
		<span id="result"> </span>
	</div>
	<div>
		<ul>
			<li>name</li>
			<li>profile</li>
			<li>label</li>
			<li>parameter</li>
			<li>value</li>
		</ul>
		<c:forEach items="${configItems}" var="configItem">
			<ul>
				<li>${configItem.identifier.name}</li>
				<li>${configItem.identifier.profile}</li>
				<li>${configItem.identifier.label}</li>
				<li>${configItem.parameter}</li>
				<li>${configItem.value}</li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>
