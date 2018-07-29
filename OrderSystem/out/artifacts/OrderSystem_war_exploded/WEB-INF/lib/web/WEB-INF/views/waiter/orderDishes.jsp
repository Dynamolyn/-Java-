<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/5
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">

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

    <!-- Main -->
    <script src="assets/scripts//main.js"></script>
    <script src="js/sweetalert.min.js"></script>

    <script type="text/javascript">
        function subtract(obj) {
            var form = obj.parentNode.parentNode.parentNode;
            if (parseInt(form.num.value) > 0) {
              var num =  parseInt(form.num.value) - 1;
                form.num.setAttribute("value",num);
            }
        }

        function add(obj) {
            var form = obj.parentNode.parentNode.parentNode;
            var num = parseInt(form.num.value) + 1;
            form.num.setAttribute("value",num);
        }
        function isEmpty(value) {
            return (Array.isArray(value) && value.length === 0)
                || (Object.prototype.isPrototypeOf(value) && Object.keys(value).length === 0);
        }
        function commitOrder() {
            var featureCodes = [];
            $(".Dishes").each(function () {//遍历每个菜品模块
                var name = $(this).find("h2").html();//菜品名
               var ID =  $(this).find("h2").attr("value");//id
              var number =   $(this).find(".dishNumber").find("input").attr("value");//数目
              var tableNum =  $("#activities option:selected").text();//桌号
                var dishesData = {
                    name:name,
                    dishesId:ID,
                    number:number,
                    tableNum:tableNum
                };
                if(dishesData.number!="0")
              featureCodes.push(dishesData);
            });
            if(isEmpty(featureCodes))
                return;
            else
            $.ajax({
               type: "POST",
                async : false,
                url: "${pageContext.request.contextPath}/Kitchen.do",
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify(featureCodes) ,
                dataType:"text",// 一般为数据返回类型
                success: function (data) {
                    if(data=="true")
                       swal({title:"成功提交！"});

                    else {
                        swal("错误！请稍后再试");
                    }
                    return;
               },
                error:function (XMLHttpRequest){
                    swal("wait and try again");
        }
           });

        }
        function messgShow() {

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


        $(function(){
            setInterval("messgShow()", "4000");
        });
    </script>

</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="index.html"><img src="assets/img/logo.png" alt="Klorofil Logo" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
            <div>
            <form class="navbar-form navbar-left ">
                <input type="text" id="messageShow" value="" class="form-control" placeholder="公告">
                <!--	<span class="input-group-btn"><button type="button" class="btn btn-primary">发送</button></span> -->
                <label for="activities">桌号：</label>
                <select name="#" id="activities" class="form-control">
                    <option value="">1</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    <option value="">6</option>
                </select>
            </form>
        </div>
        <div >
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
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>当前身份【服务员】 ID:<span name="waiterID">${waiterID}</span>账号:<span name="userAccount"> ${waiterAccount}</span></a></li>
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
                <li><a href="/waiterOrder.do" class="active"><i class="lnr lnr-home"></i> <span>点餐服务</span></a></li>
                <li><a href="/waiterBill.do" class=""><i class="lnr lnr-list"></i> <span>结账服务</span></a></li>
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
                <li><a href="#">服务员</a></li>
                <li><a href="#">点餐服务</a></li>
            </ol>
            <c:forEach items="${dishList}" var="item">
            <div class="col-lg-4 col-md-4 col-sm-6 Dishes">

                <a href="${item.img}" class="fh5co-card-item image-popup">
                    <figure>
                        <div class="overlay"><i class="ti-plus"></i></div>
                        <img src="${item.img}" alt="Image" class="img-responsive">
                    </figure>
                    <div class="fh5co-text">
                        <h2 value ="${item.id}" class = "dishName">${item.name}</h2>
                        <p>${item.description}</p>
                        <p><span class="price cursive-font">￥${item.price}</span></p>
                    </div>
                </a>
                <form>
                    <div class="input-group dishNumber">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button"
                                                            onclick="subtract(this)">一</button>
												</span>
                        <input type="text" class="form-control" value="0"
                               disabled="disabled" name="num"
                               style="text-align: center;padding: 0px;cursor: text;">
                        <span class="input-group-btn">
													<button class="btn btn-default" type="button"
                                                            onclick="add(this)">十</button>
												</span>
                    </div>
                </form>
            </div>
            </c:forEach>
            <%--<div class="col-lg-4 col-md-4 col-sm-6 Dishes">--%>

                <%--<a href="assets/img/img_2.jpg" class="fh5co-card-item image-popup">--%>
                    <%--<figure>--%>
                        <%--<div class="overlay"><i class="ti-plus"></i></div>--%>
                        <%--<img src="assets/img/img_2.jpg" alt="Image" class="img-responsive">--%>
                    <%--</figure>--%>
                    <%--<div class="fh5co-text">--%>
                        <%--<h2 value = "2" class = "dishName">Cheese and Garlic Toast</h2>--%>
                        <%--<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>--%>
                        <%--<p><span class="price cursive-font">$20.99</span></p>--%>
                    <%--</div>--%>
                <%--</a>--%>
                <%--<form>--%>
                    <%--<div class="input-group dishNumber">--%>
												<%--<span class="input-group-btn">--%>
													<%--<button class="btn btn-default" type="button"--%>
                                                            <%--onclick="subtract(this)">一</button>--%>
												<%--</span>--%>
                        <%--<input type="text" class="form-control" value="0"--%>
                               <%--disabled="disabled" name="num"--%>
                               <%--style="text-align: center;padding: 0px;cursor: text;">--%>
                        <%--<span class="input-group-btn">--%>
													<%--<button class="btn btn-default" type="button"--%>
                                                            <%--onclick="add(this)">十</button>--%>
												<%--</span>--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</div>--%>

            <%--<div class="col-lg-4 col-md-4 col-sm-6 Dishes">--%>

                <%--<a href="assets/img/img_3.jpg" class="fh5co-card-item image-popup">--%>
                    <%--<figure>--%>
                        <%--<div class="overlay"><i class="ti-plus"></i></div>--%>
                        <%--<img src="assets/img/img_3.jpg" alt="Image" class="img-responsive">--%>
                    <%--</figure>--%>
                    <%--<div class="fh5co-text">--%>
                        <%--<h2 value="3" class = "dishName">Grilled Chiken Salad</h2>--%>
                        <%--<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>--%>
                        <%--<p><span class="price cursive-font">$8.99</span></p>--%>

                    <%--</div>--%>
                <%--</a>--%>
                <%--<form>--%>
                    <%--<div class="input-group dishNumber">--%>
												<%--<span class="input-group-btn">--%>
													<%--<button class="btn btn-default" type="button"--%>
                                                            <%--onclick="subtract(this)">一</button>--%>
												<%--</span>--%>
                        <%--<input type="text" class="form-control" value="0"--%>
                               <%--disabled="disabled" name="num"--%>
                               <%--style="text-align: center;padding: 0px;cursor: text;">--%>
                        <%--<span class="input-group-btn">--%>
													<%--<button class="btn btn-default" type="button"--%>
                                                            <%--onclick="add(this)">十</button>--%>
												<%--</span>--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</div>--%>
            <!-- <div class="col-lg-4 col-md-4 col-sm-6">

                <a href="assets/img/img_4.jpg" class="fh5co-card-item image-popup">
                    <figure>
                        <div class="overlay"><i class="ti-plus"></i></div>
                        <img src="assets/img/img_4.jpg" alt="Image" class="img-responsive">
                    </figure>
                    <div class="fh5co-text">
                        <h2>Fresh Mushrooms</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
                        <p><span class="price cursive-font">$19.15</span></p>
                    </div>
                </a>
            <form>
             <div class="input-group">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"
                                                    onclick="subtract(this)">一</button>
                                            </span>
                                            <input type="text" class="form-control" value="0"
                                                disabled="disabled" name="num"
                                                style="text-align: center;padding: 0px;cursor: text;"><input
                                                type="hidden" name="dishes" value="6" />
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"
                                                    onclick="add(this)">十</button>
                                            </span>
                                        </div>
                </form>
            </div> -->
        </div>
    </div>
    <!-- END MAIN CONTENT -->
    <nav>

    </nav>

    <div style="text-align: center;">
        <a href="javascript:commitOrder()" class="btn btn-danger">确认订单</a>
        <br></br>
    </div>
</div>
<!-- END MAIN -->
<div class="clearfix"></div>
<footer>
    <div class="container-fluid">

        <p class="copyright">&copy; 2017 <a href="#" target="_blank">点餐服务系统</a>. All Rights Reserved.  <a href="http://www.cssmoban.com/" target="_blank" title="点餐">点餐</a> 设计by一群管理员 </p>
    </div>
</footer>
</div>
<!-- END WRAPPER -->


</body>

</html>
