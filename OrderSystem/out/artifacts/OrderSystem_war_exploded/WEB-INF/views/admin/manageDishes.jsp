<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/7
  Time: 9:46
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
                url: "${pageContext.request.contextPath}/deleteD.do",
                data: {dishID: ID},
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
                url: "${pageContext.request.contextPath}/modifyD.do",
                data: {dishID: ID},
                dataType: "text",
                success: function (data) {

                },
                error: function (XMLHttpRequest) {

                    swal("wait and try again！");
                }
            });
        }

        function sendCheckInfo(ID) {
            $.ajax({
                type: "POST",
                async: false,
                url: "${pageContext.request.contextPath}/checkD.do",
                data: {dishID: ID},
                dataType: "text",// 一般为数据返回类型
                success: function (data) {
                    var jsonarray = $.parseJSON(data);
                    // alert(data);
                    $("#name").text(jsonarray.name);
                    $("#price").text(jsonarray.price);
                    $("#isRe").text(jsonarray.isRecommended);
                    $("#description").text(jsonarray.description);
                    $("#txt").text(jsonarray.txt);
                    $("#image").attr("src","testHttpMessageDown.do?time="+new Date());

                    return;
                },
                error: function (XMLHttpRequest) {
                    swal("wait and try again！");
                }
            });
        }

        $(document).ready(function () {

            $(".Dishes").on("click", ".deleteDish", function () {

                var ID = "null";

                var ID = $(this).parent().parent().children().first().html();
                $(this).parent().parent().fadeOut('slow');
                sendDeleteInfo(ID);
            });
            $(".Dishes").on("click", ".checkDish", function () {
                var ID = "null";
                var ID = $(this).parent().parent().children().first().html();
                sendCheckInfo(ID);
            });

            $(".Dishes").on("click", ".modifyDish", function () {
                var ID = "null";

                var ID = $(this).parent().parent().children().first().html();
                sendModifyInfo(ID);
            });
            $("#dishModal").on("hide.bs.modal",function () {
                $(this).removeData("bs.model");
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
                        <a href="#subPagesOne" data-toggle="collapse" class=" "><i class="lnr lnr-thumbs-up"></i> <span>运营服务</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPagesOne " class=" ">
                            <ul class="nav">
                                <li><a href="/manageW.do" class=""><i class="lnr lnr-file-empty"></i>排号服务</a></li>
                                <li><a href="/manageA.do" class=""><i class="lnr lnr-indent-increase"></i>结账服务</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPagesTwo" data-toggle="collapse" class=" "><i class="lnr lnr-cog"></i> <span>餐厅管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPagesTwo" class=" ">
                            <ul class="nav">
                                <li><a href="/manageE.do" class=""><i class="lnr lnr-users"></i>员工管理</a></li>
                                <li><a href="/manageDi.do" class="active"><i class="lnr lnr-list"></i>菜品管理</a></li>
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
                    <li><a href="#">菜品管理</a></li>
                </ol>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">菜品列表</h3>
                        <div style="text-align: right;">
                            <a href="/Import.do" class="btn btn-primary"
                               style="width:120px;margin-top: 10px;margin-right: 10px">批量导入新菜</a>&nbsp;
                            <a href="/Export.do" class="btn btn-primary"
                               style="width:120px;margin-top: 10px;margin-right: 10px">导出菜品excel</a>&nbsp;
                            <a href="/addDishes.do" class="btn btn-primary"
                               style="width:120px;margin-top: 10px;margin-right: 10px">添加菜品</a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>菜品ID</th>
                                <th>菜品名称</th>
                                <th>菜品价格</th>
                                <th>查看</th>
                                <th>修改</th>
                                <th>删除</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${dishesList}" var="item">
                                <tr class="Dishes">
                                    <td>${item.id}</td>
                                    <td>${item.name}</td>
                                    <td>${item.price}</td>
                                    <td><a class='btn btn-primary checkDish' style='width:60px' id="${item.id}" data-toggle="modal" data-target="#dishModal"><span class="fa fa-search-plus"></span></a></td>
                                    <td><a href="/modifyDish.do" class='btn btn-primary modifyDish' style='width:60px'><span class="fa fa-pencil-square-o"></span></a></td>
                                    <td><a class='btn btn-danger deleteDish' style='width:60px'><span class="fa fa-trash"></span></a></td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal fade" id="dishModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>



                                <div class="image-div ">
                                    <img  id="image" class="img-responsive" alt="templatemo easy profile" src=""/>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="skills">
                                            <h4 class="white">菜品信息</h4>
                                            <div class="row">
                                                <ul class="address">


                                                    <li>
                                                        <ul class="address-text">
                                                            <li><b>菜名</b></li>
                                                            <li><span id="name"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="address-text">
                                                            <li><b>价格</b></li>
                                                            <li><span id="price"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="address-text">
                                                            <li><b>是否推荐</b></li>
                                                            <li><span id="isRe"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="address-text">
                                                            <li><b>简介 </b></li>
                                                            <li><span id="description"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="address-text">
                                                            <li><b>详细介绍</b></li>
                                                            <li> <span id="txt"></span></li>
                                                        </ul>
                                                    </li>


                                                </ul>
                                            </div>
                                        </div>   <!-- end form -->

                                    </div>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

            </div>
                <!-- END TABLE HOVER -->

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
</body>

</html>
