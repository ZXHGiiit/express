<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="qingwei.lu">
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
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/home">Chime Admin v1.0</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">

            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=request.getContextPath()%>/logout"><i
                            class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="<%=request.getContextPath()%>/dashboad" target="iframepage"><i
                                class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Site<span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/agentsite/list2"
                                   target="iframepage">Agent List</a>
                                <a href="<%=request.getContextPath()%>/agentsite/list"
                                   target="iframepage">Site List</a>
                                <a href="<%=request.getContextPath()%>/agentsite/detail"
                                   target="iframepage">Member Info</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <%--<li>--%>
                    <%--<a href="#"><i class="fa fa-wrench fa-fw"></i> Agent<span class="fa arrow"></span></a>--%>
                    <%--<ul class="nav nav-second-level">--%>
                    <%--<li>--%>
                    <%--<a href="<%=request.getContextPath()%>/lead-assign/config" target="iframepage">Config</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="<%=request.getContextPath()%>/lead-assign/gotoTrack" target="iframepage">Track Lead</a>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--<!-- /.nav-second-level -->--%>
                    <%--</li>--%>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> System Email <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <%--<li>--%>
                            <%--<a href="<%=request.getContextPath()%>/email/overview" target="iframepage"><i class="fa fa-dashboard fa-fw"></i> Email Templates </a>--%>
                            <%--</li>--%>
                            <li>
                                <a href="<%=request.getContextPath()%>/email/group/overview/view"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> Groups
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/email/use/view"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>
                                    邮件模版使用示例 </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Common config <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/commonconfig/overview"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> configs
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Payment <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="https://finance.chime.me"><i
                                        class="fa fa-dashboard fa-fw"></i> Agent List</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Lead <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/lead/overview"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> Lead
                                    Setting</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/lead/userview"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> User
                                    Setting</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/lead/exportlead"
                                target="iframepage"><i class="fa fa-dashboard fa-fw"></i> export
                                lead csv
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Dialer <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/dialer/whitelist/overview"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> White
                                    List</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/dialer/uuid/index" target="iframepage"><i class="fa fa-dashboard fa-fw"></i> Search uuid</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> ConfigCenter <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/configcenter/config"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>
                                    Application </a>
                                <a href="<%=request.getContextPath()%>/configcenter/config/datasource"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>
                                    DataSource </a>

                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> File Upload <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/file-upload"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> File
                                    Upload</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Push Test <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/push/overview"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> Push
                                    Test</a>
                            </li>
                        </ul>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/push/activity"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i> Push
                                    Activity</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> App Version Info <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/appVersion/list/481559"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>Android
                                    Version List </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/appVersion/list/481560"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>IOS
                                    Version List </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/appTestUser/list"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>App Test
                                    User List </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Super Admin <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/superAdmin/list"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>Super
                                    Admin User List </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Email Management <span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/emailManagement/fakeEmail/index"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>
                                    Supression List </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/emailManagement/emailBinding/index"
                                   target="iframepage"><i class="fa fa-dashboard fa-fw"></i>
                                    Email Bindings</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>
    <div id="page-wrapper" style="height:1000px">
        <iframe src="<%=request.getContextPath()%>/dashboad" marginheight="0" marginwidth="0"
                frameborder="0" scrolling="auto" width="100%" height="100%" id="iframepage"
                name="iframepage" onLoad="iFrameHeight()"></iframe>
        <script type="text/javascript" language="javascript">
            function iFrameHeight() {
                console.info('xx');
                var ifm = document.getElementById("iframepage");
                var subWeb = document.frames ? document.frames["iframepage"].document
                    : ifm.contentDocument;
                if (ifm != null && subWeb != null) {
                    ifm.height = subWeb.body.scrollHeight;
                }
            }
        </script>
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=request.getContextPath()%>/static/js/sb-admin-2.js"></script>
</body>
</html>
