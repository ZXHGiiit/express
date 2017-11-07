<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap Login Form Template</title>

  <!-- CSS -->
  <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <link href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/form-element.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/login.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body>

<!-- Top content -->
<div class="top-content">

  <div class="inner-bg">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-sm-offset-2 text">
          <h1><strong>Chime</strong> Admin Platform</h1>
          <div class="description">
            <p>
              A Real Estate Platform Built Your Success!
            </p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6 col-sm-offset-3 form-box">
          <div class="form-top">
            <div class="form-top-left">
              <h3>Login to our site</h3>
              <p>Please input the verify code to log on:</p>
            </div>
            <div class="form-top-right">
              <i class="fa fa-key"></i>
            </div>
          </div>
          <div class="form-bottom">
            <form role="form" action="<%=request.getContextPath()%>/verify" method="post" class="login-form">
              <div class="form-group">
                <label class="sr-only" for="verifyCode">Verify Code</label>
                <input type="text" name="verifyCode" placeholder="Verify code..." class="form-username form-control" id="verifyCode">
              </div>
              <button type="submit" class="btn">Sign in!</button>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>

</div>


<!-- Javascript -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script src="//cdn.bootcss.com/jquery-backstretch/2.0.4/jquery.backstretch.min.js"></script>
<%--<script src="<%=request.getContextPath()%>/static/js/login.js"></script>--%>



<script language="JavaScript">
  jQuery(document).ready(function() {

    /*
     Fullscreen background
     */
    $.backstretch("<%=request.getContextPath()%>/static/images/download/web/main-bg.jpg");

    /*
     Form validation
     */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
      $(this).removeClass('input-error');
    });

    $('.login-form').on('submit', function(e) {

      $(this).find('input[type="text"], input[type="password"], textarea').each(function(){
        if( $(this).val() == "" ) {
          e.preventDefault();
          $(this).addClass('input-error');
        }
        else {
          $(this).removeClass('input-error');
        }
      });

    });


  });


</script>

<!--[if lt IE 10]>
<!--<script src="assets/js/placeholder.js"></script>-->
<![endif]-->

<div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 256px; width: 1144px; z-index: -999999; position: fixed;"><img src="<%=request.getContextPath()%>/static/images/download/web/main-bg.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1144px; height: 762.667px; max-height: none; max-width: none; z-index: -999999; left: 0px; top: -253.333px;"></div></body></html>