<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 16/5/25
  Time: 下午6:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page language="java" import="com.homethy.business.constant.ClientTrackingTypeEnum" %>
<%@ page language="java" import="com.homethy.business.constant.ClientTrackingSourceEnum" %>
<%@ page language="java" import="com.homethy.persistence.domain.Lead.LeadListingTypeEnum"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Track Lead</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/static/css/trackLeadForm.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h1 class="text-center">Track Lead</h1>

  <form role="form" class="form-horizontal" action="<%=request.getContextPath()%>/lead-assign/track" method="post">
    <div class="form-group">
      <label class="col-md-2 control-label" for="agentUserId">Agent User Id</label>
      <div class="col-md-10">
        <input class="form-control" name="agentUserId" type="text" id="agentUserId" placeholder="" value="" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" for="leadUserId">Lead User Id</label>
      <div class="col-md-10">
        <input type="text" name="leadUserId" class="form-control" id="leadUserId" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label for="domain" class="control-label col-md-2">Domain</label>
      <div class="col-md-10">
        <input type="text" name="domain" class="form-control" id="domain" placeholder="">
      </div>
    </div>

    <div class="form-group">
      <label for="type" class="control-label col-md-2">Client Tracking Type</label>
      <div class="col-md-10">
        <select id="type" name="type" class="form-control">


          <%
            for (ClientTrackingTypeEnum clientTrackingTypeEnum : ClientTrackingTypeEnum.values()) {
          %>
          <option value="<%=clientTrackingTypeEnum.getType() %>"><%=clientTrackingTypeEnum.toString() %></option>
          <%
            }
          %>
        </select>
      </div>
    </div>


    <div class="form-group">
      <label for="source" class="control-label col-md-2">Client Tracking Source</label>
      <div class="col-md-10">
        <select id="source" name="source" class="form-control">


          <%
            for (ClientTrackingSourceEnum sourceType : ClientTrackingSourceEnum.values()) {
          %>
          <option value="<%=sourceType.getType() %>"><%=sourceType.toString() %></option>
          <%
            }
          %>
        </select>
      </div>
    </div>


    <div class="form-group">
      <label for="leadType" class="control-label col-md-2">Lead Listing Type</label>
      <div class="col-md-10">
        <select id="leadType" name="leadType" class="form-control">

          <%
            for (LeadListingTypeEnum leadType : LeadListingTypeEnum.values()) {
          %>
          <option value="<%=leadType.getType() %>"><%=leadType.toString() %></option>
          <%
            }
          %>
        </select>
      </div>
    </div>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" class="btn btn-primary track-submit">
          Submit
        </button>
        <button type="reset" class="btn btn-info ">
          Reset
        </button>
      </div>
    </div>
  </form>
</div>

<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/jquery-validate/1.15.0/jquery.validate.js"></script>

<script src="<%=request.getContextPath()%>/static/js/trackLeadForm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
  TrackLeadFormValidator.init();
</script>
</body>
</html>
