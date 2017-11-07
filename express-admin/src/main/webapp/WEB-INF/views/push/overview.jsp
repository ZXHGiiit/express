<%--
  Created by IntelliJ IDEA.
  User: huahuan.chen
  Date: 17/3/27
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
  <meta name="author" content="huahuan.chen">
  <!-- Bootstrap Core CSS -->
  <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">

  <title> Push Test </title>

</head>
<body>
<h1> Push Test </h1>
    <div class="container-fluid">

        <%--更新lead--%>
        <div class="row">
            <div class="col-md-3">
                <label for="account">account:</label>
                <input type="text" class="form-control"  id="account" placeholder="Enter account you want to send push to"/>
            </div>
            <div class="col-md-3">
                <label for="pushTypes">下拉选择push的类型:</label>
                <select class="form-control" id="pushTypes">
                    <option value="1">sendNewLeadPush</option>
                    <option value="2">sendFollowUpPush</option>
                    <option value="5">sendAgentReminderPush</option>
                </select>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-default" onclick="sendpush();"> send push </button>
                <button type="button" class="btn btn-default" onclick="resetResult();"> clear </button>
            </div>
        </div>

        <div class="row" style="margin-top: 10px;">
            <pre id="result"></pre>
        </div>

    </div>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
<script>

    function sendpush() {
        var account = $("#account").val();
        var pushType = $("#pushTypes").find("option:selected").val();
        if(account == "" ){
            alert("account must be filled!");
            return;
        }

        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/push/test/send",
            data : {
                "account":account,
                "pushType":pushType
            },
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "text",
            success : function(data) {
                $("#result").html(format(data, false));
            }
        });
    }

    function resetResult()
    {
        $("#result").html("");
    }


  function format(txt,compress/*是否为压缩模式*/){/* 格式化JSON源码(对象转换为JSON文本) */
      var indentChar = '    ';
      if(/^\s*$/.test(txt)){
          alert('数据为空,无法格式化! ');
          return;
      }
      try{var data=eval('('+txt+')');}
      catch(e){
          alert('数据源语法错误,格式化失败! 错误信息: '+e.description,'err');
          return;
      };
      var draw=[],last=false,This=this,line=compress?'':'\n',nodeCount=0,maxDepth=0;

      var notify=function(name,value,isLast,indent/*缩进*/,formObj){
          nodeCount++;/*节点计数*/
          for (var i=0,tab='';i<indent;i++ )tab+=indentChar;/* 缩进HTML */
          tab=compress?'':tab;/*压缩模式忽略缩进*/
          maxDepth=++indent;/*缩进递增并记录*/
          if(value&&value.constructor==Array){/*处理数组*/
              draw.push(tab+(formObj?('"'+name+'":'):'')+'['+line);/*缩进'[' 然后换行*/
              for (var i=0;i<value.length;i++)
                  notify(i,value[i],i==value.length-1,indent,false);
              draw.push(tab+']'+(isLast?line:(','+line)));/*缩进']'换行,若非尾元素则添加逗号*/
          }else   if(value&&typeof value=='object'){/*处理对象*/
              draw.push(tab+(formObj?('"'+name+'":'):'')+'{'+line);/*缩进'{' 然后换行*/
              var len=0,i=0;
              for(var key in value)len++;
              for(var key in value)notify(key,value[key],++i==len,indent,true);
              draw.push(tab+'}'+(isLast?line:(','+line)));/*缩进'}'换行,若非尾元素则添加逗号*/
          }else{
              if(typeof value=='string')value='"'+value+'"';
              draw.push(tab+(formObj?('"'+name+'":'):'')+value+(isLast?'':',')+line);
          };
      };
      var isLast=true,indent=0;
      notify('',data,isLast,indent,false);
      return draw.join('');
  }

</script>
</body>
</html>
