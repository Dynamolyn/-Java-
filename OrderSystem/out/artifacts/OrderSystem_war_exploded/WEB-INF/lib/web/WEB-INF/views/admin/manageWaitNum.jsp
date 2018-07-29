
<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/7
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="assets/css/magnific-popup.css">

    <!-- Bootstrap DateTimePicker -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">


    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/orderDishes.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <!-- Javascript -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
    <script src="assets/vendor/chartist/js/chartist.min.js"></script>
    <script src="assets/scripts/klorofil-common.js"></script>

    <!-- Magnific Popup -->
    <script src="assets/scripts//jquery.magnific-popup.min.js"></script>
    <script src="assets/scripts//magnific-popup-options.js"></script>

</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="#"><img src="assets/img/logo.png" alt="Klorofil Logo" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
            <form class="navbar-form navbar-left " action="/sendMessage.do" method="post">
                <input type="text" value="" name="message" class="form-control" placeholder="公告">
                <!--	<span class="input-group-btn"><button type="button" class="btn btn-primary">发送</button></span> -->
                <input type="submit" class="btn btn-primary messageSend"></input>
            </form>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" class="notification-item"><span class="dot bg-warning"></span>店长热线: 5008-5209</a></li>
                        <li><a href="#" class="notification-item"><span class="dot bg-danger"></span>大堂经理: 5008-1314</a></li>
                        <li><a href="#" class="notification-item"><span class="dot bg-success"></span>维护电话：13268808080</a></li>
                        <li><a href="#" class="notification-item"><span class="dot bg-warning"></span>欢迎加盟！</a></li>
                    </ul>
                </li>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user">
                    </span> 当前身份【管理员】ID:<span name="userID">${adminID}</span>账号:<span name="userAccount"> ${adminAccount}</span></a></li>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li>
                    </ul>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><br></li>
                    <li>
                        <a href="#subPagesOne" data-toggle="collapse" class=" "><i class="lnr lnr-thumbs-up"></i><span>运营服务</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPagesOne" class=" ">
                            <ul class="nav">
                                <li><a href="/manageW.do" class="active"><i class="lnr lnr-file-empty"></i>排号服务</a></li>
                                <li><a href="/manageA.do" class=""><i class="lnr lnr-indent-increase"></i>结账服务</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPagesTwo" data-toggle="collapse" class=" "><i class="lnr lnr-cog"></i> <span>餐厅管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPagesTwo" class=" ">
                            <ul class="nav">
                                <li><a href="/manageE.do" class=""><i class="lnr lnr-users"></i>员工管理</a></li>
                                <li><a href="/manageDi.do" class=""><i class="lnr lnr-list"></i>菜品管理</a></li>
                                <li><a href="/manageC.do" class=""><i class="lnr lnr-smile"></i>客户管理</a></li>
                                <li><a href="/manageDa.do" class=""><i class="lnr lnr-database"></i>经营数据</a></li>
                            </ul>
                        </div>
                    </li>

                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                <!-- OVERVIEW -->
                <ol class="breadcrumb">
                    <li><a href="#">管理员</a></li>
                    <li><a href="#">运营管理</a></li>
                    <li><a href="#">排号服务</a></li>
                </ol>
                <div class="col-xs-8">
                    <div class="panel" style="height: 600px">
                        <div class="panel-heading">
                            <h3 class="panel-title">今日推荐菜品</h3>
                        </div>
                        <div class="panel-body">

                            <div id="myCarousel" class="carousel slide">
                                <!-- 轮播（Carousel）指标 -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                    <li data-target="#myCarousel" data-slide-to="3"></li>
                                    <li data-target="#myCarousel" data-slide-to="4"></li>
                                </ol>
                                <!-- 轮播（Carousel）项目 -->
                                <div class="carousel-inner ">
                                    <div class="item active img-panel">
                                        <img src="assets/img/img_1.jpg" class = " img-panel" alt="First slide" >

                                    </div>
                                    <div class="item img-panel">
                                        <img src="assets/img/img_2.jpg" class = " img-panel" alt="Second slide">
                                    </div>
                                    <div class="item img-panel">
                                    <img src="assets/img/img_3.jpg" class = "img-responsive img-panel" alt="Third slide">
                                </div>
                                    <div class="item img-panel">
                                        <img src="assets/img/img_4.jpg" class = "img-responsive img-panel" alt="Forth slide">
                                    </div>
                                    <div class="item img-panel">
                                        <img src="assets/img/img_13.jpg" class = "img-responsive img-panel" alt="Fifith slide">
                                    </div>
                                </div>
                                <!-- 轮播（Carousel）导航 -->
                                <a class="carousel-control left" href="#myCarousel"
                                   data-slide="prev">&lsaquo;</a>
                                <a class="carousel-control right" href="#myCarousel"
                                   data-slide="next">&rsaquo;</a>
                            </div>

                        </div>
                    </div><!--End panel-->
                </div>

                <div class="col-xs-4">
                    <div class="panel" style="height: 600px">
                        <div class="panel-heading">
                            <h3 class="panel-title">排号</h3>
                        </div>
                        <div class="panel-body">

                            <div class="tab-content ">
                                <div class="tab-pane fade in active" id="tab-bottom-left1">
                                    <ul class="list-unstyled activity-timeline">
                                        <li>
                                            <i class="fa fa-plus activity-icon"></i>
                                            <p>当前空余桌数：${emptyTable}</p>
                                        </li>
                                        <li>
                                            <i class="fa fa-cloud-upload activity-icon"></i>
                                            <p>当前排队人数：${queuing}</p>
                                        </li>
                                        <li>
                                            <i class="fa fa-check activity-icon"></i>
                                            <p>当前尚有空桌，请就坐！</p>
                                        </li>
                                    </ul>
                                    <%--<div class="margin-top-30 text-center"><a href="#" class="btn btn-default">进行排号</a></div>--%>
                                </div>
                            </div>
                        </div>
                    </div> <!--end container-fluid-->
                </div><!-- END main-content -->

            </div><!-- end main-->
            <div class="clearfix"></div>
            <footer>
                <div class="container-fluid">

                    <p class="copyright">&copy; 2017 <a href="#" target="_blank">点餐服务系统</a>. All Rights Reserved.  <a href="http://www.cssmoban.com/" target="_blank" title="点餐">点餐</a> 设计by一群管理员 </p>
                </div>
            </footer>

        </div>
    </div>
</div>
        <script>
            $(document).ready(function(e){
                // 初始化轮播
                $("#myCarousel").carousel({interval:2000});
            });
        </script>
</body>

</html>
