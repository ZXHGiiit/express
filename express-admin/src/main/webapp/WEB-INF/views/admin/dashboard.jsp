<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Chime Admin v1.0</title>

    <!-- Bootstrap Core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="//cdn.bootcss.com/metisMenu/2.5.2/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/static/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body style="background-color: #fff;">

<div id="wrapper">

    <!-- <div id="page-wrapper"> -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Dashboard</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-eye fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">Visit</div>
                            <div>Here you can visit Agent's Site.</div>
                        </div>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/agentsite/list">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-link fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">Track</div>
                            <div>Here you can track a lead.</div>
                        </div>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/lead-assign/gotoTrack" target="iframepage">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <%--<div class="col-lg-3 col-md-6">--%>
            <%--<div class="panel panel-yellow">--%>
                <%--<div class="panel-heading">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-xs-3">--%>
                            <%--<i class="fa fa-facebook-square fa-5x"></i>--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-9 text-right">--%>
                            <%--<div class="huge">Import</div>--%>
                            <%--<div>Assign Lead from Facebook.</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<a href="#">--%>
                    <%--<div class="panel-footer">--%>
                        <%--<span class="pull-left">View Details</span>--%>
                        <%--<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>--%>
                        <%--<div class="clearfix"></div>--%>
                    <%--</div>--%>
                <%--</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-edit fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">Edit</div>
                            <div>Edit agent.</div>
                        </div>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/lead-assign/config">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!-- </div> -->
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=request.getContextPath()%>/static/js/sb-admin-2.js"></script>

</body>
</html>