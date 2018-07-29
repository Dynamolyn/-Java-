<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/5
  Time: 10:56
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

    <link rel="stylesheet" href="css/employee.css">
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
        function mesgShow() {
            var req = "null";
            $.ajax({
                type: "POST",
                async : false,
                url: "${pageContext.request.contextPath}/getMessage.do",
                data:{req:req} ,
                dataType:"text",// 一般为数据返回类型
                success: function (data) {
                    if(data=="") {}
                    else
                        $("#messageShow").attr("value",data);
                },
                error:function (XMLHttpRequest){
                    swal("wait and try again");
                }
            });
        }

        $(document).ready(function () {

            setInterval("mesgShow()", "5000");


            $(".payList").on("click",".payBtn",function (){
                    var list = $(this).parent().parent();
                    var payId = $(this).parent().parent().children().first().text();
                    $.ajax({
                        type: "POST",
                        async : false,
                        url: "${pageContext.request.contextPath}/payTheBill.do",
                        data:{payId:payId} ,
                        dataType:"text",// 一般为数据返回类型
                        success: function (data) {
                            if(data=="true")
                                list.fadeOut("slow");
                            else
                                swal("wait and try again");
                        },
                        error:function (XMLHttpRequest){
                            swal("wait and try again");
                        }
                    });
                }
            );

            $(".payList").on("click",".delBtn",function (){
                var list = $(this).parent().parent();
                var payId = $(this).parent().parent().children().first().text();
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/deleteTheBill.do",
                    data:{payId:payId} ,
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        if(data=="true")
                            list.fadeOut("slow");
                        else
                            swal("wait and try again");
                    },
                    error:function (XMLHttpRequest){
                        swal("wait and try again");
                    }
                });
            });


            //查看modal
            $(".payList").on("click",".payShowBtn",function () {
                var orderId = $(this).parent().parent().children().first().text();
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/waiterPayShow.do",
                    data:{orderId:orderId} ,
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        if(data=="null") {
                            swal("wait and try again");
                            return;
                        }
                        else{
                            var jsonarray = $.parseJSON(data);
                            // alert(data);
                            $("#setTableNum").html(jsonarray.id);
                            $("#setBeginTime").html(jsonarray.beginTime);
                            $("#dishesPayList").html("");//清除模态框
                            $.each(jsonarray.food,function (i,n) {
                                $("#dishesPayList").append("<tr><td>"+n.dishName+ "</td> <td>"+n.price
                                    +"</td> <td>"+n.num+"</td></tr>");
                            });
                            return;
                        }
                    },
                    error:function (XMLHttpRequest){
                        swal("wait and try again");
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
                <input type="text" value="" id="messageShow" class="form-control" placeholder="公告">
                <!--	<span class="input-group-btn"><button type="button" class="btn btn-primary">发送</button></span> -->
                <label  for="activities">桌号：</label>
                <select name="#" id="activities" class="form-control">
                    <option value="">1</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    <option value="">6</option>
                </select>
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
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>当前身份【服务员】 ID:<span name="userID">${waiterID}</span>账号:<span name="userAccount"> ${waiterAccount}</span></a></li>
                        <li><a href="index.html"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li>
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
                    <li><a href="/waiterOrder.do" class=""><i class="lnr lnr-home"></i> <span>点餐服务</span></a></li>
                    <li><a href="/waiterBill.do" class="active"><i class="lnr lnr-list"></i> <span>结账服务</span></a></li>
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
                    <li><a href="">服务员</a></li>
                    <li><a href="">结账服务</a></li>
                </ol>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">顾客订单列表</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>订单ID</th>
                                <th>桌号</th>
                                <th>服务员</th>
                                <th>下单时间</th>
                                <th>查看</th>
                                <th>取消</th>
                                <th>买单</th>
                            </thead>
                            <tbody class="payList">
                            <c:forEach items="${waitingList}" var="item">
                                <tr >

                                    <td>${item.id}</td>
                                    <td>${item.tableId}</td>
                                    <td>${item.waiterId}</td>
                                    <td>${item.beginTime}</td>
                                    <td><a class='btn btn-primary payShowBtn' style='width:60px' data-toggle="modal" data-target="#accountModal"><span class="glyphicon glyphicon-search"></span></a></td>
                                    <td><a class='btn btn-danger delBtn' style='width:60px'><span class="glyphicon glyphicon-trash"></span></a></td>
                                    <td><a class ='btn btn-success payBtn' style='width:60px'><span class="glyphicon glyphicon-ok"></span></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!--modal location-->
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
                                                            <li><b>订单号</b></li>
                                                            <li><span id="setTableNum"></span></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <ul class="info-text">
                                                            <li><b>开餐时间</b></li>
                                                            <li><span id="setBeginTime"></span></li>
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
                <!-- END TABLE HOVER -->
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