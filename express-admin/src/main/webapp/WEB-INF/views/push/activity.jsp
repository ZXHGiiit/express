<%--
  Created by IntelliJ IDEA.
  User: yi.qiu
  Date: 17/6/30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title> Push Activity </title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="huahuan.chen">
    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/static/css/lib/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/static/js/lib/jquery.min.js"></script>

    <style type="text/css">
        form{
            position: absolute;
            left: 50%;
            top: 10%;
            transform: translate(-50%,0);
            -webkit-transform:translate(-50%,0); 
        }
        form>div{
            width: 400px;
            margin: 20px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        form>div:first-child input{
            /*width: 200px;*/
        }
        form>div:last-child{
            display: block;
        }
        input,span,textarea,select{
            width: 240px;
            /*vertical-align: middle;
            float: right;*/
        }
        label{
            vertical-align: middle;
        }
        textarea{
            height: 100px;
        }
        button{
            float: right;
            margin-left: 10px;
        }

    </style>
    

</head>
<body>
<form class="push">
    <div>
        <label>User Account</label>
        <span class="userAccount"><input type="text" ></br>or<input type="file" ></span>
    </div>
    <div>
        <label>Push Title</label><input type="" name="pushTitle">
    </div>
    <div>
        <label>Push Text</label><textarea name="pushText"></textarea>
    </div>
    <div>
        <label>Landing Page(url)</label><input type="" name="url">
    </div>
    <div><button type="button" class="send">Send</button><button type="button" class="clear">Clear</button></div>
</form>
<!-- jQuery -->
<script>
    inputChange();
    
    $('.send').on('click',function(){
        sendpush();
    })
    function inputChange() {
        $('.userAccount input').on('change',function(){
            $(this).addClass('chosen').siblings().val('');
        })
    }
    function sendpush() {
        var formData = new FormData();
        var data = {};
        $('form.push div [name]').each(function(){
            data[this.name] = this.value;
            formData.append(this.name,this.value);
            console.log(data);
        })
        var account = $('.userAccount input[type="text"]').val() ? $('.userAccount input[type="text"]').val() : $('.userAccount input[type="file"]')[0].files[0];
        if ($('.userAccount input[type="text"]').val()){
            var arr = account.split(',');
            arr.forEach(function(v,i,a){
                if(!v.trim() || isNaN(v)){
                    alert('account wrong format');
                    return false
                }
            })
            data.userIds = account;
            $.ajax({
                type : "POST",
                url : "/backend/push/activity/send/batch",
                data : data,
                success : function(res) {
                    res = JSON.parse(res);
                    var text = res.status.msg;
                    if (res.data){
                        for ( i in res.data){
                            var ms = "     " + i + res.data[i];
                            text += ms;
                        }
                    }
                    alert(text);
                }
            });
        }
        else{
            if (!account){
                alert('account cannot empty');
                return false;
            }
            formData.append('data',account);
            $.ajax({
                type : "POST",
                url : "/backend/push/activity/send/batch/file",
                data : formData,
                cache: false,
                contentType: false,
                processData: false,
                success : function(res) {
                    res = JSON.parse(res);
                    var text = res.status.msg;
                    if (res.data){
                        for ( i in res.data){
                            var ms = "     " + i + res.data[i];
                            text += ms;
                        }
                    }
                    alert(text);
                }
            })

        }
        
        
        
    }

    

</script>
</body>
</html>
