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
  <meta name="author" content="xiaoxue.wang">
  <!-- Bootstrap Core CSS -->
  <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">

  <title> System Email Template</title>

</head>
<body>
<h1>操作 lead</h1>
    <div class="container-fluid">

        <%--更新lead--%>
        <div class="row">
            <div class="col-md-3">
                <input type="text" class="form-control"  id="updateLeadId" placeholder="Enter leadId you want to update"/>
            </div>
            <div class="col-md-2"><button type="button" class="btn btn-default" onclick="updateLead();"> 更新lead </button></div>
            <div class="col-md-2"><button type="button" class="btn btn-default" onclick="getLead();"> 获取lead 信息 </button></div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <input type="text" class="form-control"  id="userId" placeholder="Enter userId you want to update"/>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2"><button type="button" class="btn btn-default" onclick="updateUser();"> 更新UserRedis </button></div>
            <div class="col-md-2"><button type="button" class="btn btn-default" onclick="getUser();"> 获取user 详细信息 </button></div>
        </div>
            <div class="row" style="margin-top: 10px;">
                <pre id="result"></pre>
            </div>

        <%--删除lead--%>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <input type="text" class="form-control"  id="deleteLeadId" placeholder="Enter leadId you want to delete"/>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2"><button type="button" class="btn btn-default" onclick="deleteLead();"> 删除lead(慎用!!) </button></div>
            <div class="col-md-3"></div>
        </div>

        <div class="row">

        </div>
    </div>
    <br>
    <hr>
    <br>
<h1>根据teamId重建索引</h1>
    <div>
        <input type="text" id="teamIdText" placeholder="enter teamId ">
        <button type="button" onclick="updateTeamLeads('teamIdText')">重建索引</button>
    </div>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
<script>
  function deleteLead() {
      var leadId = $("#deleteLeadId").val();
      $.ajax({
          type : "POST",
          url : "<%=request.getContextPath()%>/lead/delete",
          data : {
              "leadId":leadId
          },
          contentType:"application/x-www-form-urlencoded;charset=UTF-8",
          dataType: "json",
          success : function(data) {
              alert(data);
          }
      });
  }

    function updateLead() {
        var leadId = $("#updateLeadId").val();
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/lead/update/search",
            data : {
                "leadIds":leadId
            },
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "text",
            success : function(data) {
                $("#result").html(format(data, false));
            }
        });
    }

  function getLead() {
      var leadId = $("#updateLeadId").val();
      $.ajax({
          type : "POST",
          url : "<%=request.getContextPath()%>/lead/detail",
          data : {
              "leadId":leadId
          },
          contentType:"application/x-www-form-urlencoded;charset=UTF-8",
          dataType: "text",
          success : function(data) {
              $("#result").html(format(data, false));
          }
      });
  }

    function updateUser() {
        var userId = $("#userId").val();
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/user/update",
            data : {
                "userId":userId
            },
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "text",
            success : function(data) {
                $("#result").html(format(data, false));
            }
        });
    }
  function getUser() {
      var userId = $("#userId").val();
      $.ajax({
          type : "POST",
          url : "<%=request.getContextPath()%>/user/detail",
          data : {
              "userId":userId
          },
          contentType:"application/x-www-form-urlencoded;charset=UTF-8",
          dataType: "text",
          success : function(data) {
              $("#result").html(format(data, false));
          }
      });
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

  function updateTeamLeads(teamIdText) {
     var teamId = $("#teamIdText").val();
     $.ajax({
        type : "POST",
        url : "<%=request.getContextPath()%>/user/updateTeamLeads",
        data : {
            "teamId":teamId
        },
        contentType:"application/x-www-form-urlencoded;charset=UTF-8",
        dataType: "text",
        success : function(data) {
            var jsonData = eval("("+data+")");
                       var status = jsonData.status.code;
                       if(status == 0) {
                           alert("Success.");
                       } else {
                           alert("Failed.");
                       }
        }
     });
  }

</script>
</body>
</html>
