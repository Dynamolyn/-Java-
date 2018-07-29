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
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

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

    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/echarts.js"></script>
    <script src="js/sweetalert.min.js"></script>

    <script type="text/javascript">
        
        function loadChartS(firstData) {
            var myChart = echarts.init(document.getElementById("dishesChart"));

            console.log(firstData.numbers.toString());
            console.log(firstData.names.toString());

            var namesString = firstData.names.toString();
            var numbersString = firstData.numbers.toString();

            var names = namesString.split(",");
            var numbers = numbersString.split(",");

            option = {
                title : {
                    text: '菜品销售情况',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                toolbox: {
                    feature: {
                        dataView: {show: true, readOnly: false},
                        saveAsImage: {show: true}
                    }
                },
                series : [
                    {
                        name: '菜品销量百分比',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:[
                            {value:numbers[0], name:names[0]},
                            {value:numbers[1], name:names[1]},
                            {value:numbers[2], name:names[2]},
                            {value:numbers[3], name:names[3]},
                            {value:numbers[4], name:names[4]},
                            {value:numbers[5], name:names[5]},
                            {value:numbers[6], name:names[6]},
                            {value:numbers[7], name:names[7]},
                            {value:numbers[8], name:names[8]},
                            {value:numbers[9], name:names[9]}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            myChart.setOption(option);
        }
        
        function loadChartsF(firstData) {
            var myChart = echarts.init(document.getElementById("monthChart"));
            var colors = ['#5793f3', '#675bba', '#675bba'];

            option = {
                color: colors,

                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross'
                    }
                },
                grid: {
                    right: '20%'
                },
                toolbox: {
                    feature: {
                        dataView: {show: true, readOnly: false},
                        saveAsImage: {show: true}
                    }
                },
                title: [{
                    left: 'center',
                    text: '过去30天盈利状况'
                }],
                xAxis: [
                    {
                        type: 'category',
                        axisTick: {
                            alignWithLabel: true,
                            interval:3
                        },
                        axisLabel:{
                        interval: 3
                    },
                        data: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '订单数',
                        min: 0,
                        max: 25,
                        position: 'right',
                        axisLine: {
                            lineStyle: {
                                color: colors[0]
                            }
                        },
                        axisLabel: {
                            formatter: '{value} '
                        }
                    },
                    {

                        name: '',
                        min: 0,
                        max: 25,
                        position: 'right',
                        axisLine: {
                            lineStyle: {
                                color: colors[0]
                            }
                        },
                        //  offset: 80,
                    },
                    {
                        type: 'value',
                        name: '营业额',
                        min :0,
                        splitLine:{show: false},//去除网格线
                        position: 'left',
                        axisLine: {
                            lineStyle: {
                                color: colors[2]
                            }
                        },
                        axisLabel: {
                            formatter: '{value}￥'
                        }
                    }
                ],
                series: [
                    {
                        name:'订单量',
                        type:'bar',
                        data:firstData.orderMon
                    },
                    {
                        name:'营业额',
                        type:'line',
                        yAxisIndex: 2,
                        data:firstData.moneyMon
                    }
                ]
            };

            myChart.setOption(option);
        }

        function loadCharts() {
            //-----------------------------------------------------------
            var req = "null";
            var firstData;
              $.ajax({
                type: "POST",
                async : false,
                url: "${pageContext.request.contextPath}/chartsData.do",
                data:{req:req},
                dataType:"text",// 一般为数据返回类型
                success: function (data) {
                    firstData = $.parseJSON(data);
                    return;
                },
                error:function (XMLHttpRequest){
                    swal("wait and try again！");
                }
            });


                    var myChart = echarts.init(document.getElementById("weekChart"));
                    var colors = ['#5793f3', '#675bba', '#675bba'];

            option = {
                color: colors,

                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross'
                    }
                },
                grid: {
                    right: '20%'
                },
                toolbox: {
                    feature: {
                        dataView: {show: true, readOnly: false},
                        saveAsImage: {show: true}
                    }
                },
                title: [{
                    left: 'center',
                    text: '过去7天盈利状况'
                }],
                xAxis: [
                    {
                        type: 'category',
                        axisTick: {
                            alignWithLabel: true
                        },
                        data: ['1','2','3','4','5','6','7']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '订单数',
                        min: 0,
                        max: 25,
                        position: 'right',
                        axisLine: {
                            lineStyle: {
                                color: colors[0]
                            }
                        },
                        axisLabel: {
                            formatter: '{value} '
                        }
                    },
                    {

                        name: '',
                        min: 0,
                        max: 25,
                        position: 'right',
                        axisLine: {
                            lineStyle: {
                                color: colors[0]
                              }
                          },
                          //  offset: 80,
                      },
                    {
                        type: 'value',
                        name: '营业额',
                        min :0,
                        splitLine:{show: false},//去除网格线
                        position: 'left',
                        axisLine: {
                            lineStyle: {
                                color: colors[2]
                            }
                        },
                        axisLabel: {
                            formatter: '{value}￥'
                        }
                    }
                ],
                series: [
                    {
                        name:'订单量',
                        type:'bar',
                        data:firstData.orderWeek
                    },
                    {
                        name:'营业额',
                        type:'line',
                        yAxisIndex: 2,
                        data:firstData.moneyWeek
                    }
                ]
            };

            myChart.setOption(option);

            //图表1-----------------------------------------------------
            loadChartsF(firstData);
            loadChartS(firstData);
        }



        $(document).ready(function () {

            loadCharts();


            $('#date').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#time').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $(".searchOrderData").click(function () {
                var beginData = $("#date").val();
                var endData = $("#time").val();
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "${pageContext.request.contextPath}/searchOrderData.do",
                    data:{beginData:beginData,endData:endData},
                    dataType:"text",// 一般为数据返回类型
                    success: function (data) {
                        if(data=="null")
                            swal("no data");
                        else{
                            var jsonarray = $.parseJSON(data);
                            $.each(jsonarray,function (i,n) {
                                $("#orderPayList").append("<tr><td>"+n.id+ "</td> <td>"+n.tableId
                                    +"</td> <td>"+n.beginTime+"</td><td>"+n.selePrice+"</td></tr>");
                            });
                        }
                        return;
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
            <a href="#"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
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
                                <li><a href="/manageDi.do" class=""><i class="lnr lnr-list"></i>菜品管理</a></li>
                                <li><a href="/manageC.do" class=""><i class="lnr lnr-smile"></i>客户管理</a></li>
                                <li><a href="/manageDa.do" class="active"><i class="lnr lnr-database"></i>经营数据</a></li>
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
                    <li><a href="#">经营数据</a></li>
                </ol>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">餐厅账单查询</h3>
                        <br>
                        <form class="form-inline">
                            <div style="text-align: left">
                            <div class="form-group">
                                <label>开始时间：</label>
                                <input type="text" id="date" name="startDate" class="form-control">
                            </div>
                            &nbsp;&nbsp;
                            <div class="form-group">
                                <label>结束时间：</label>
                                <input type="text" id="time" name="endDate" class="form-control">
                            </div>
                            &nbsp;&nbsp;
                                <div class="form-group">
                            <input type="button" class="btn btn-danger searchOrderData"  style="width:120px"
                                   value="开始搜索" data-toggle="modal" data-target="#dataModal" />
                                </div>
                          </div>
                        </form>

                    </div>
                </div>

                <div class="modal fade" id="dataModal" tabindex="-1" role="dialog" aria-labelledby="accountModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="skills">
                                        <h4 class="white">查询详情</h4>

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
                                                    <th>订单ID</th>
                                                    <th>桌号</th>
                                                    <th>开始时间</th>
                                                    <th>总额（￥）</th>
                                                </tr>
                                                </thead>



                                                <tbody id="orderPayList">

                                                </tbody>
                                            </table>
                                        </div>


                                    </div>   <!-- end form -->
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <div class="panel-body">
                    <div id="weekChart" style="width: 70%; height: 70%;"></div>
                    <div id="monthChart"style="width: 70%; height: 70%;"></div>
                    <div id="dishesChart"style="width: 70%;height: 70%;"></div>

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

