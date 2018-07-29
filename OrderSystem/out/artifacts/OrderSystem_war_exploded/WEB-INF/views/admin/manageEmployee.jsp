<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/5
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <link rel="stylesheet" href="css/employee.css">

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
    <script src="js/sweetalert.min.js"></script>

    <script>
        function sendDeleteInfo(ID) {

            $.ajax({

                type: "POST",
                async: false,
                url: "${pageContext.request.contextPath}/deleteE.do",
                data: {employeeID: ID},
                dataType: "text",
                success: function (data) {
                    swal("删除成功！");
                },
                error: function (XMLHttpRequest) {

                    swal("wait and try again！");
                }
            });
        }

        function sendModifyInfo(ID) {

            $.ajax({

                type: "POST",
                async: false,
                url: "${pageContext.request.contextPath}/modifyE.do",
                data: {employeeID: ID},
                dataType: "text",
                success: function (data) {

                },
                error: function (XMLHttpRequest) {

                    swal("wait and try again");
                }
            });
        }

        function sendCheckInfo(ID) {
            $.ajax({
                type: "POST",
                async: false,
                url: "${pageContext.request.contextPath}/checkE.do",
                data: {employeeID: ID},
                dataType: "text",// 一般为数据返回类型
                success: function (data) {
                    var jsonarray = $.parseJSON(data);
                   // alert(data);
                     $("#account").text(jsonarray.account);
                     $("#sex").text(jsonarray.sex);
                     $("#pwd").text(jsonarray.pwd);
                     $("#name").text(jsonarray.name);
                     $("#phoneNum").text(jsonarray.phoneNumber);
                     $("#address").text(jsonarray.address);
                     $("#position").text(jsonarray.position.name);
      //               $("#img").attr("src","data:image/jpeg;base64,"+jsonarray.faceImg);
      //              $("#img").attr("src","/testHttpMessageDown.do?file="+jsonarray.faceImg);
                     $("#img").attr("src","testHttpMessageDown.do?time="+new Date());
                    return;
                },
                error: function (XMLHttpRequest) {
                    swal("wait and try again");
                }
            });


        }

        $(document).ready(function () {

            $(".Employee").on("click", ".deleteEmp", function () {

                var ID = "null";

                var ID = $(this).parent().parent().children().first().html();
                $(this).parent().parent().fadeOut('slow');
                sendDeleteInfo(ID);
            });
            $(".Employee").on("click", ".checkEmp", function () {
                var ID = "null";
                var ID = $(this).parent().parent().children().first().html();
                sendCheckInfo(ID);
            });

            $(".Employee").on("click", ".modifyEmp", function () {
                var ID = "null";

                var ID = $(this).parent().parent().children().first().html();
                sendModifyInfo(ID);
            });
        })
    </script>

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
            <form class="navbar-form navbar-left ">
                <input type="text" value="" class="form-control" placeholder="公告">
                <!--	<span class="input-group-btn"><button type="button" class="btn btn-primary">发送</button></span> -->
                <button class="btn btn-primary">发送</button>
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
                        <a href="#subPagesOne" data-toggle="collapse" class=" "><i class="lnr lnr-thumbs-up"></i>
                            <span>运营服务</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPagesOne" class=" ">
                            <ul class="nav">
                                <li><a href="/manageW.do" class=""><i class="lnr lnr-file-empty"></i>排号服务</a></li>
                                <li><a href="/manageA.do" class=""><i class="lnr lnr-indent-increase"></i>结账服务</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPagesTwo" data-toggle="collapse" class=" "><i class="lnr lnr-cog"></i>
                            <span>餐厅管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPagesTwo" class=" ">
                            <ul class="nav">
                                <li><a href="/manageE.do" class="active"><i class="lnr lnr-users"></i>员工管理</a></li>
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
                    <li><a href="#">餐厅管理</a></li>
                    <li><a href="#">员工管理</a></li>
                </ol>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">员工列表</h3>
                        <div style="text-align: right;">
                            <a href="/addEmployee.do" class="btn btn-primary"
                               style="width:120px;margin-top: 10px;margin-right: 10px">添加员工</a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>员工ID</th>
                                <th>员工账号</th>
                                <th>员工职务</th>
                                <th>查看</th>
                                <th>修改</th>
                                <th>删除</th>
                            </thead>
                            <tbody>

                            <c:forEach items="${usersList}" var="item">
                                <tr class="Employee">
                                    <td>${item.id}</td>
                                    <td>${item.account}</td>
                                    <td>${item.position.name}</td>
                                    <td><a class='btn btn-primary checkEmp' id="${item.id}" style='width:60px'
                                           data-toggle="modal" data-target="#myModal"><span
                                            class="fa fa-search-plus"></span></a></td>
                                    <td><a href="/modifyEmployee.do" class="btn btn-primary modifyEmp"
                                           style='width:60px'><span class="fa fa-pencil-square-o"></span></a></td>
                                    <td><a class='btn btn-danger deleteEmp' style='width:60px'><span
                                            class="fa fa-trash"></span></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>

                                <div class="circle-image">
                                    <%--   /工程名/upload/aa.jpg--%>
                                    <img class="img-responsive img-circle tm-border images"
                                         alt="templatemo easy profile" id="img" src="">
                                    <hr>
                                </div>
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="skills">
                                            <h3 class="white">个人信息</h3><br>
                                            <div class="row">
                                                <ul class="info">
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>账号名</b></li>
                                                            <li><span id="account"></span></li>
                                                        </ul>
                                                    </li>

                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>职位</b></li>
                                                            <li><span id="position"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>姓名</b></li>
                                                            <li><span id="name"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>性别</b></li>
                                                            <li><span id="sex"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>手机号</b></li>
                                                            <li><span id="phoneNum"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>住址 </b></li>
                                                            <li><span id="address"></span></li>
                                                        </ul>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <!-- END TABLE HOVER -->

            </div> <!--end container-fluid-->
        </div><!-- END main-content -->

    </div><!-- end main-->
    <div class="clearfix"></div>
    <footer>
        <div class="container-fluid">

            <p class="copyright">&copy; 2017 <a href="#" target="_blank">点餐服务系统</a>. All Rights Reserved. <a
                    href="" target="_blank" title="点餐">点餐</a> 设计by一群管理员 </p>
        </div>
    </footer>

</div>

</body>

</html>
