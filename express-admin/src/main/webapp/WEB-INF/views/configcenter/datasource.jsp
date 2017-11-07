<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Config Center</title>
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

body {
  margin-left:100px;
  width:800px;
  margin-top:20px;
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

.functionBtn {
	margin-left:10px;
	margin-right:10px;
}

</style>
<script>
	function init() {
		$(".functionBtn").click(function(){
			var name =$.trim($("#name").val());
			var profile =$("#profile").val();
			var label =$.trim($("#label").val());
			var parameter =$.trim($("#parameter").val());
			var value =$.trim($("#value").val());

			var method = $(this).attr("data-method");

			params = {
				"method":method,
				"configType":"DATASOURCE",
				"name" : name,
				"profile": profile,
				"label": label,
				"parameter":parameter,
				"value":value,
			}

			url="./manage/"

    			$('#contentTable > tbody').empty()
			$("#result").text("请求处理中....");
	        	$("body").addClass("loading");
			$.ajax({url:url,
					data:params,
					type: 'post',
					error: function(XMLHttpRequest, textStatus, errorThrown){
						$("body").removeClass("loading");
						$("#result").text("失败:"+XMLHttpRequest.responseText);
				    },
				    success: function(data){
				    	  $("body").removeClass("loading");
					  $("#result").text("success");
					  var arrayData = data; 
					  if(method!=="LIST"){
					     arrayData = $.makeArray(data);
					  }
					  showTable(arrayData);
				    }
			});
		});

	}
	function showTable(data){
		$.each(data, function() {
    			$('#contentTable > tbody').append(
        		'<tr><td>'
        		+ this.parameter
        		+ '</td><td>'
        		+ this.value +
        		'</td></tr>'
    			);
		});
	}
</script>
</head>
<body onload="init();">
    <div class="modal"></div>
    <section>
	<form>
    <div class="form-group">
        <label for="name">DataSource Business Name</label>
        <input type="text" class="form-control" id="name">
    </div>
    <div class="form-group">
        <label for="profile">Profile</label>
	<select class="form-control" id="profile">
      		<option>DEFAULT</option>
      		<option>TEST</option>
      		<option>DEV</option>
      		<option>STAGE</option>
      		<option>PRODUCTION</option>
    	</select>
    </div>
    <div class="form-group">
        <label for="label">Label</label>
        <input type="text" class="form-control" id="label" placeholder="master" value="master">
    </div>
    <div class="form-group">
        <label for="parameter">Parameter</label>
        <input type="text" class="form-control" id="parameter">
    </div>
    <div class="form-group">
        <label for="value">Value</label>
        <textarea class="form-control" id="value" rows="4"></textarea>
    </div>
    <button type="button" class="btn btn-primary functionBtn" id="getBtn" data-method="GET">Get</button>
    <button type="button" class="btn btn-primary functionBtn" id="listBtn" data-method="LIST">List</button>
    <button type="button" class="btn btn-primary functionBtn" id="addBtn" data-method="ADD">Add</button>
    <button type="button" class="btn btn-primary functionBtn" id="updateBtn" data-method="UPDATE">update</button>
    </form>
   </section>
   <div>
	<span id="result"> </span>
    </div>
   <section id="content">
	<table class="table" id="contentTable">
  <thead>
    <tr>
      <th>Parameter</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
   </tbody>
    </table>
   </section>
</body>
</html>
