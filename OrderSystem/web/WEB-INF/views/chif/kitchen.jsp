<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/5
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
    <script src="js/sweetalert.min.js"></script>

    <script>
        //后厨更新列表
        function updateShow() {
            var req="null";
            $.ajax({
                type: "POST",
                async : false,
                url: "${pageContext.request.contextPath}/updateShow.do",
                data:{re:req} ,
                dataType:"text",// 一般为数据返回类型
                success: function (data) {
                    if(data=="null") return;

                    var jsonarray = $.parseJSON(data);
                    //    tempDishes = jsonarray;
                    //$(".showList").html("");//置空
                    $.each(jsonarray, function (i, n) {
                        $(".showList").append(" <tr class = 'showDishes'><td>"+n.tableNum+"</td> <td class='orderId'>" + n.orderId + "</td> <td class='dishesName'>" + n.name + "</td> <td>" + n.number + "</td> " +
                            "<td><a class='btn btn-danger causeDelete' style='width:60px'><span class='lnr lnr-trash'></span></a></td> " +
                            "<td><a class='btn btn-primary cookState' style='width:60px'><span class='fa fa-thumb-tack'></span></a></td> " +
                            "<td><button class ='btn btn-success finishDelete' style='width:60px'><span class='lnr lnr-volume-high'></span></button></td> </tr>");
                        //  alert(n.name);
                    })



                    return;
                },
                error:function (XMLHttpRequest){
                    swal("wait and try again");
                }
            });
        }

        <%--function messageShow() {--%>
            <%--var message = "${messageShow}";--%>
            <%--alert(message);--%>
            <%--$("#messageShow").attr("value",message);--%>
        <%--}--%>


        function messageShow() {
            var req = "null";
            $.ajax({
                type: "POST",
                async : false,
                url: "${pageContext.request.contextPath}/getMessage.do",
                data:{req:req} ,
                dataType:"text",// 一般为数据返回类型
                success: function (data) {
                    if(data=="null") {}
                    else
                        $("#messageShow").attr("value",data);
                },
                error:function (XMLHttpRequest){
                    swal("wait and try again");
                }
            });
        }

        $(document).ready(function () {
            setInterval("messageShow()","3000");
            setInterval("updateShow()","5000");

            //烹饪状态改变
            $(".showList").on("click",".cookState",function (){
                var btn = $(this).children().attr("class","fa fa-spinner fa-spin");
            });


            //删除订单
            $(".showList").on("click",".causeDelete",function () {
                //alert 确定
                var dishesName =  $(this).parent().parent().find(".dishesName").html();
                var orderId = $(this).parent().parent().find(".orderId").html();
                var del = $(this);
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/deleteDishes.do",
                    data:{orderId:orderId,dishesName:dishesName},
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        if(data=="true")
                            $(del).parent().parent().fadeOut('slow');
                        else
                            swal("try again");
                        return;
                    },
                    error:function (XMLHttpRequest){
                        swal("wait and try again");
                    }
                })


            });


            //传菜
            $(".showList").on("click",".finishDelete",function (){
                var dishesName = $(this).parent().parent().find(".dishName").html();
                var btn = $(this);
                //$(this).parent().parent().fadeOut('slow');
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/finishDish.do",
                    data:{dishesName:dishesName},
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        //alert(data);
                        if(data=="true")
                            $(btn).parent().parent().fadeOut('slow');
                        return;
                    },
                    error:function (XMLHttpRequest){
                        swal("wait and try again");
                    }
                })


            });
        });

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
                <input type="text" id="messageShow" value="" class="form-control" placeholder="公告">
                <!--	<span class="input-group-btn"><button type="button" class="btn btn-primary">发送</button></span> -->
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
                    </span> 当前身份【后厨】ID:<span name="userID">${cookID}</span>账号:<span name="userAccount"> ${cookAccount}</span></a></li>
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
                    <li><a href="chef.html" class="active"><i class="lnr lnr-dinner"></i> <span>备菜服务</span></a></li>
                </ul>
            </nav>s
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
                    <li><a href="#">后厨</a></li>
                    <li><a href="#">备菜服务</a></li>
                </ol>
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">顾客点餐列表</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>桌号</th>
                                <th>单号</th>
                                <th>菜名</th>
                                <th>数量</th>
                                <th>删除</th>
                                <th>烹饪</th>
                                <th>传菜</th>
                            </thead>
                            <tbody class="showList">
                            <%--      <tr class = "showDishes">


                                      <td>4</td>
                                      <td>dishes</td>
                                      <td>1</td>
                                      <td><a class='btn btn-danger causeDelete' style='width:60px'><span class="lnr lnr-trash"></span></a></td>
                                      <td><a class='btn btn-primary' style='width:60px'><span class="fa fa-spinner fa-spin"></span></a></td>
                                      <td><a class ='btn btn-success finshDelete' style='width:60px'><span class="lnr lnr-cart"></span></a></td>
                                  </tr>
                                 <tr class = "showDishes">
                                     <td>2</td>
                                     <td>Simon</td>
                                     <td></td>
                                     <td><a class='btn btn-danger causeDelete' style='width:60px'><span class="lnr lnr-trash"></span></a></td>
                                     <td><a class='btn btn-primary' style='width:60px'><span class="fa fa-spinner fa-spin"></span></a></td>
                                     <td><a class ='btn btn-success finshDelete' style='width:60px'><span class="lnr lnr-cart"></span></a></td>

                                 </tr>--%>
                            </tbody>
                        </table>
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
</body>

</html>
