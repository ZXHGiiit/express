<%--
  Created by IntelliJ IDEA.
  User: mingxin.wang
  Date: 16/7/5
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="mingxin.wang">
    <!-- Bootstrap Core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">

    <title> System Email Template</title>
    <script>
        function search(){
            var userPhone = $("#userPhone").val();
            var userVN = $("#userVN").val();
            var leadPhone = $("#leadPhone").val();
            var callId = $("#callId").val();
            var userId = $("#userId").val();
            if(userPhone == "" && userVN == "" && leadPhone == "" && userId == "" && callId == ""){
                alert("You fill in at least one!");
                return;
            }

            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/dialer/uuid/search",
                data : {
                    "userPhone":userPhone,
                    "userVN":userVN,
                    "leadPhone":leadPhone,
                    "callId":callId,
                    "userId":userId
                },
                contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "json",
                success : function(data) {
                    if(null != data && "" != data) {
                        $("#contentTable").empty();
                        for(var i=0; i<data.length; i++) {
                            $('#contentTable').append('<thread>')
                            $('#contentTable').append('<tr><th>'+data[i].time+'</th></tr>');
                            $('#contentTable').append('<tr><td> Direction: '
				+data[i].direction+'</br> Phone Number: '
				+data[i].dialerPhone+'</br> From: '
				+data[i].fromPhone+'</br> To: '
				+data[i].toPhone+'</br> ConversationID: '
				+data[i].conversationId+'</br> uuid_FROM: '
				+data[i].uuid1+'</br> uuid_TO: '
				+data[i].uuid2+'</br> dialer call recordID: '
                +data[i].callRecordId+'</br> dialer dialerID: '
                +data[i].dialerId+'</br> agent userID: '
                +data[i].userId+'</td></tr>');
                            $('#contentTable').append('</thread>')
                        }
                    } else {
                        $("#contentTable").empty();
                        $('#contentTable').append("No Results found")
                    }

                },
                error : function(data) {
                    $("#contentTable").empty();
                    $('#contentTable').append("ERROR")
                }
            });
        }

    </script>
</head>


<body>

<form class="form-inline">
    <div class="form-group">
        <label for="groupName">Phone Number</label>
        <input type="text" class="form-control" id="userPhone" placeholder="Phone Number">
    </div>
    <div class="form-group">
        <label for="userVN">Virtual Number</label>
        <input type="text" class="form-control" id="userVN" placeholder="Virtual Number">
    </div>
    <div class="form-group">
        <label for="leadPhone">Lead Phone Number</label>
        <input type="text" class="form-control" id="leadPhone" placeholder="Lead Phone Number">
    </div>
    <div class="form-group">
        <label for="callId">Dialer Call Id</label>
        <input type="text" class="form-control" id="callId" placeholder="Dialer Call Id">
    </div>
    <div class="form-group">
        <label for="userId">User Id</label>
        <input type="text" class="form-control" id="userId" placeholder="User Id">
    </div>
    <button type="button" class="btn btn-primary btn-lg" onclick="search()">Search</button>
</form>

<section id="content">
    <table class="table" id="contentTable">

    </table>
</section>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
</body>
</html>
