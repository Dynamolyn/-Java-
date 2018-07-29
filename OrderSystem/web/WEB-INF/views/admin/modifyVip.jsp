<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/13
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title> </title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!--     Fonts and icons     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />
    <!--
      CSS Just for demo purpose, don't include it in your project
      <link href="assets/css/demo.css" rel="stylesheet" /> -->
</head>

<body>
<!-- 背景图片 -->
<div class="image-container set-full-height" style="background-image: url('/assets/img/wizard.jpg')">

    <div class="made-with">Made with <strong>GSDK</strong></div>
    </a>
    -->
    <!--   Big container   -->
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">

                <!--      Wizard container        -->
                <div class="wizard-container">

                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form action="/submitCustom.do" method="post">
                            <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                            <div class="wizard-header">
                                <h3>
                                    <b>WELCOME</b>修改VIP客户信息 <br>
                                    <small>请完善表格.</small>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">VIP信息表单</a></li>
                                    <!--   <li><a href="#account" data-toggle="tab">管理信息</a></li> -->
                                    <!--                           <li><a href="#address" data-toggle="tab">管理信息</a></li> -->
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane" id="about">
                                        <div class="row">
                                            <!--  <h4 class="info-text"> Let's start with the basic information (with validation)</h4> -->
                                            <div class="col-sm-4 col-sm-offset-1">



                                            </div>
                                            <div class="col-sm-10 col-sm-offset-1">
                                                <div class="form-group">
                                                    <label>客户ID</label>
                                                    <input name="ID" type="text" class="form-control" value="${customerID}" disabled="true"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>姓名</label>
                                                    <input name="name" type="text" class="form-control" value="${VIPcustomer.name}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>性别</label>
                                                    <select name="sex" class="form-control">
                                                        <option value="F"> 女 </option>
                                                        <option value="M"> 男 </option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>电话</label>
                                                    <input name="phoneNum" type="text" class="form-control"value="${VIPcustomer.phoneNumber}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>用餐次数</label>
                                                    <input name="dinningTime" type="text" class="form-control"value="${VIPcustomer.dinningTimes}" />
                                                </div>
                                                <div class="form-group">
                                                    <label>用餐总额</label>
                                                    <input name="dinningCount" type="text" class="form-control"value="${VIPcustomer.dinningSum}" />
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="wizard-footer height-wizard">
                                <div class="pull-right">
                                    <input type='submit' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Finish' />

                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div><!-- end row -->
    </div> <!--  big container -->
    <br>
    <br>
    <br>
    
</div>


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="assets/js/gsdk-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/  -->
<script src="assets/js/jquery.validate.min.js"></script>

</html>
