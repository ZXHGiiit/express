<%--
  Created by IntelliJ IDEA.
  User: mingxin
  Date: 16/7/11
  Time: 下午8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>邮件模版服务使用介绍</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
</head>
<body>


  <p class="text-center"><h2>邮件模版服务使用介绍</h2></p>

  <dl>
    <dt>模版分类</dt>
    <dd>1.邮件模版使用分组管理，每个组把与自己业务相关的模版放在一个邮件Group内集中管理。比如site发送注册相关的各种模版，都集中放在了agent站邮件组里面了，其他组的成员尽量不要在这个组里面更改。</dd>
    <dd>2.每个模版都属于一个Group,Group和Template都会分配一个业务名,管理平台会默认将Group和Template的business联合Hash出一个tag.同一个Group中的Template不能有相同的businessname，
      所以tag不会重复和模版是一对一的关系,调用者使用tag可以定位到要发送的邮件模版.</dd>
    <dd>3.group和template的businessName需要限定在128个字符內。</dd>
    <dd>4.模版可以添加描述信息方便记忆。</dd>
  </dl>
  <dl>
    <dt>占位符</dt>
    <dd>  因为每个业务模版需要的占位符各不相同,所以占位符的部分需要有调用者放入map中,以kv的形式传入. 占位符的整体形式应该是$map.get("leadname")这种.</dd>
    <dd>$map.get("leadname"),中leadname需要放入map中, map.put("leadname", "my name").</dd>
  </dl>
  <dl>
    <dt>使用示例:</dt>
    <dd><img src="<%=request.getContextPath()%>/static/images/email/emailuse.jpg"></dd>
  </dl>

</body>
</html>
