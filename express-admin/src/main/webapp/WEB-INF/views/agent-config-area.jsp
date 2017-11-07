<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Agent Setting</title>
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
	width: 150px;
	margin: 0px auto;
	text-align: center;
}

ul:first-child {
	#border: 1px solid;
	font-color: #555555;
	margin-top: 40px;
}

li text {
	width:120px;
}

#result {
	font-size: 1.6em;
	color: red;
}
</style>
<script>
	function init() {
		$(".switch").bootstrapSwitch();

		$('.switch').on('switchChange.bootstrapSwitch', function(event, state) {
			console.log(this); // DOM element
			console.log(event); // jQuery event
			console.log(state); // true | false
			var id = $(this).attr("data-id");
			var status = state ? 1 : 0;
			var rankId = $(this).attr("data-rankId");
			updateServiceArea(id, status,rankId);
		});
		
		$(".rank-select").change(function() {
			var rankId = $(this).children('option:selected').val();
			var agentId = $(this).attr("data-id");
			var status = $(this).attr("data-status");
			updateServiceArea(agentId, status, rankId);
		});
		
		$("#addCityBtn").click(function(){
			var agentId = $(this).attr("data-agentId");
			var city = $("#cityInput").val();
			var state = $("#stateInput").val();
			params = {
				"agentId" : agentId,
				"city": city,
				"state": state,
			}
			
			url="./area/add"
			
			$("#result").text("请求处理中....");
	        $("body").addClass("loading"); 	
			$.ajax({url:url,
					data:params,
					type: 'post',
					error: function(XMLHttpRequest, textStatus, errorThrown){
						$("body").removeClass("loading");
						$("#result").text("添加失败:"+XMLHttpRequest.responseText);
				    },
				    success: function(data){
				    	  $("body").removeClass("loading"); 	
				    	  $("#result").text("添加成功");
						  location.reload();
				    }
			});
		});
		
	}

	function updateServiceArea(id,status,rankId) {
		url = "./area/update";
		params = {
			"serviceAreaId" : id,
			"status": status,
			"rankId": rankId
		};
		$("#result").text("请求处理中....");
	        $("body").addClass("loading"); 	
			$.post(url, params, function(data, status) {
	               $("body").removeClass("loading"); 	
			if (status == "success") {
				$("#result").text("修改成功");
			} else {
				$("#result").text("修改失败");
				location.reload();
			}
		});
	}
</script>
</head>
<body onload="init();">
	<div class="modal"></div>
	<div>
		<span id="result"> </span>
	</div>
	<a href="/lead-assign/config">Back To Agent Settings</a>
	<div>
		<ul>
			<li>name</li>
			<li>city</li>
			<li>state</li>
			<li>status</li>
			<li>rank</li>
		</ul>
		<c:forEach items="${agentServiceAreaList}" var="agentServiceArea">
			<ul>
				<li>${agentServiceArea.agentName}</li>
				<li>${agentServiceArea.city}</li>
				<li>${agentServiceArea.state}</li>
				<li>
					<c:if test="${ agentServiceArea.status == 0 }">
						<input class="switch" data-size="mini"
							data-id=${agentServiceArea.id } data-rankId=${agentServiceArea.rankId } type="checkbox" />
					</c:if> <c:if test="${ agentServiceArea.status == 1 }">
						<input class="switch" data-size="mini"
							data-id=${agentServiceArea.id } data-rankId=${agentServiceArea.rankId } type="checkbox" checked />
				</c:if>
				</li>
				<li><select class="rank-select" data-id="${agentServiceArea.id}" data-status="${agentServiceArea.status}">
						<c:forEach items="${rankSettingList}" var="rankSetting">
							<c:if test="${ agentServiceArea.rankId == rankSetting.id }">
								<option selected="selected" value="${rankSetting.id}">${rankSetting.rankLevel}</option>
							</c:if>
							<c:if test="${!(agentServiceArea.rankId == rankSetting.id)}">
								<option value="${rankSetting.id}">${rankSetting.rankLevel}</option>
							</c:if>
						</c:forEach>
				</select></li>
			</ul>
		</c:forEach>
		<ul>
			<li></li>
			<li><input type="text" id="cityInput"></input></li>
			<li><input type="text" id="stateInput"></input></li>
			<li><input type="button" id="addCityBtn" data-agentId="${param.agentId}" value="Add City"></input></li>
		</ul>
	</div>
	<div>
	</div>
</body>
</html>
