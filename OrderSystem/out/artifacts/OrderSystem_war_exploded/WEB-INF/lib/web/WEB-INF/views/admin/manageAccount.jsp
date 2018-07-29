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
    <script src="js/sweetalert.min.js"></script>
    <!-- Magnific Popup -->
    <script src="assets/scripts//jquery.magnific-popup.min.js"></script>
    <script src="assets/scripts//magnific-popup-options.js"></script>


    <script>
        $(document).ready(function () {
            $(".payList").on("click",".evaluateGood",function (){
                var good = $(this).attr("class","fa fa-thumbs-up fa-2x evaluateGood");
                var down = $(this).parent().find(".evaluateDown").attr("class","fa fa-thumbs-o-down fa-2x evaluateDown");
            });
            $(".payList").on("click",".evaluateDown",function (){
                var good = $(this).attr("class","fa fa-thumbs-down fa-2x evaluateDown");
                var down = $(this).parent().find(".evaluateGood").attr("class","fa fa-thumbs-o-up fa-2x evaluateGood");
            });

            $(".searchID").click(function () {
                var customerID = $("#customerID").val();
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/searchCustomerID.do",
                    data:{customerID:customerID},
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        if(data=="true")
                        alert("验证正确，为VIP客户！");
                    else alert("非VIP客户！");
                    return;
                    },
                    error:function (XMLHttpRequest){
                        swal("wait and try again！");
                    }
                });
            });
            //完成结账后删除订单
            $(".payList").on("click",".payBtn",function () {
                var orderId = $(this).parent().parent().children().first().text();
                var oneOrder = $(this).parent().parent();
                //订单id放在最上层
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/dishesPayDelete.do",
                    data:{orderId:orderId},
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        if(data=="true")
                        {
                                    oneOrder.fadeOut("slow");
                        }
                        return;
                    },
                    error:function (XMLHttpRequest){
                        swal("wait and try again！");
                    }
                });
            });
            //查看modal
            $(".payList").on("click",".payShow",function () {
                var req = $(this).parent().parent().children().first().text();
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/dishesPayShow.do",
                    data:{req:req} ,
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        if(data=="null") {
                            swal("wait and try again！");
                            return;
                        }
                        else{
                            var jsonarray = $.parseJSON(data);
                           // alert(data);
                            $("#setTableNum").html(jsonarray.id);
                            $("#setBeginTime").html(jsonarray.beginTime);
                            $("#setEndTime").html(jsonarray.endTime);
                            $("#setPrice").html(jsonarray.price);
                            $("#setSale").html(jsonarray.selePrice);
                            $("#dishesPayList").html("");//清除模态框
                            $.each(jsonarray.food,function (i,n) {
                                $("#dishesPayList").append("<tr><td>"+n.dishName+ "</td> <td>"+n.price
                                    +"</td> <td>"+n.num+"</td></tr>");
                            });
                            return;
                        }
                    },
                    error:function (XMLHttpRequest){
                        swal("wait and try again！");
                    }
                });

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
                        <div id="subPagesOne" class=" ">
                            <ul class="nav">
                                <li><a href="/manageW.do" class=""><i class="lnr lnr-file-empty"></i>排号服务</a></li>
                                <li><a href="/manageA.do" class="active"><i class="lnr lnr-indent-increase"></i>结账服务</a></li>
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
                    <li><a href="#">结账服务</a></li>
                </ol>
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">顾客点餐列表</h3>
                        <div style="text-align: right;">
                            <input type="text" id="customerID" style="width:120px;margin-top: 10px;margin-right: 10px"/>&nbsp;
                            <a href="" class="btn btn-primary searchID"
                               style="width:120px;margin-top: 10px;margin-right: 10px">查询用户ID</a>
                        </div>
                    </div>

                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>账单ID</th>
                                <th>桌号</th>
                                <th>结账时间</th>
                                <th>查看</th>
                                <th>确认结账</th>
                                <th>客户评价</th>
                            </tr>
                            </thead>
                            <tbody class="payList">
                            <c:forEach items="${finishedList}"  var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.tableId}</td>
                                <td>${item.beginTime}</td>
                                <td><button class='btn btn-danger payShow' style='width:60px' data-toggle="modal" data-target="#accountModal"><span class="fa fa-search"></span></button></td>
                                <td><button class='btn btn-primary payBtn' style='width:60px'><span class="fa fa-handshake-o"></span></button></td>
                                <td><span class="fa fa-thumbs-o-up fa-2x evaluateGood"></span>&nbsp;&nbsp;&nbsp;<span class="fa fa-thumbs-o-down fa-2x evaluateDown"></span></td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal fade" id="accountModal" tabindex="-1" role="dialog" aria-labelledby="accountModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="skills">
                                            <h4 class="white">订单详情</h4>
                                            <div class="row">
                                                <ul class="info">
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>桌号</b></li>
                                                            <li><span id="setTableNum"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>开餐时间</b></li>
                                                            <li><span id="setBeginTime"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>结账时间</b></li>
                                                            <li><span id="setEndTime"></span></li>
                                                        </ul>
                                                    </li>

                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>总价</b></li>
                                                            <li><span id="setPrice"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>打折后应付</b></li>
                                                            <li><span id="setSale"></span></li>
                                                        </ul>
                                                    </li>

                                                </ul>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <table class="table table-hover">

                                                    <thead>
                                                    <tr>
                                                        <th>菜品</th>
                                                        <th>单价（￥）</th>
                                                        <th>数量</th>
                                                    </tr>
                                                    </thead>



                                                    <tbody id="dishesPayList">

                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>


                                        </div>   <!-- end form -->
                                    </div>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
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
<script>
    $(document).ready(function(e){
        // 初始化轮播
        $("#myCarousel").carousel({interval:5000});
    });
</script>
</body>

</html>
