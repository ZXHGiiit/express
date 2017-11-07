<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap Core CSS -->
        <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <title> ExportLead CSV</title>
    </head>
    <body>
        <h1>根据agentId和其他条件导出lead信息的csv文件</h1>
        <hr>
        <div>
            agent的Id或Email：<input type="text" id="email" placeholder="Enter UserId or Email"/>
            过滤器Json形式：<input type="text" id="filterJson" placeholder="Enter filterJson"/>
            需要的格式state：<input type="text" id="state" placeholder="Enter state"/>
            <br>
            <button type="button"  onclick="getUrl('email','filterJson','state')" >生成下载链接</button>
        </div>
            <div id="csvUrl"></div>
            <div id ="link" style="display:none;">
                <a id="links" >点击下载</a>
            </div>
        <div>

        </div>
        <!-- jQuery -->
            <script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
            <script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
            <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
            <script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
        <script>
            function getUrl(email,filterJson,state){
                var Email = document.getElementById(email).value;
                var FilterJson = document.getElementById(filterJson).value;
                var State = document.getElementById(state).value;
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/lead/exportlead",
                    data: {
                        "email": Email,
                        "filterJson" : FilterJson,
                        "state" : State
                    },
                    contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                    dataType: "json",
                    success: function (data) {
                        var jsonData = eval(data);
                        var status = jsonData.status.code;
                        var csvUrl = "";
                        if(status == 0) {
                            var Info = jsonData.data;
                            csvUrl = Info.url;
                        } else {
                            csvUrl = "Get Info Failed.";
                        }
                        $("#csvUrl").html(csvUrl);
                        document.getElementById("links").href=csvUrl;
                        document.getElementById("link").style.display="block";
                    }
                });
            }
        </script>
    </body>
</html>