<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/10
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>

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
    <!--   Core JS Files   -->
    <script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

    <!--  Plugin for the Wizard -->
    <script src="assets/js/gsdk-bootstrap-wizard.js"></script>

    <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
    <script src="assets/js/jquery.validate.min.js"></script>

</head>

<body>
<!-- 背景图片 -->
<div class="image-container set-full-height" style="background-image: url('/assets/img/wizard.jpg')">

    <!--   Big container   -->
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">

                <!--      Wizard container        -->
                <div class="wizard-container">

                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form action="/submitModifyInfo.do" method="post" enctype="multipart/form-data">
                            <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                            <div class="wizard-header">
                                <h3>
                                    <b>WELCOME</b> 修改您的员工信息 <br>
                                    <small>请完善表格所缺少的信息.</small>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">个人信息</a></li>
                                    <!--   <li><a href="#account" data-toggle="tab">管理信息</a></li> -->
                                    <li><a href="#address" data-toggle="tab">管理信息</a></li>
                                </ul>

                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <!--  <h4 class="info-text"> Let's start with the basic information (with validation)</h4> -->
                                        <div class="col-sm-4 col-sm-offset-1">
                                            <br>
                                            <br>
                                            <div class="picture-container">
                                                <div class="picture">
                                                    <img src="testHttpMessageDown.do" class="picture-src" id="wizardPicturePreview" title=""/>
                                                    <input type="file" id="wizard-picture" name="pictureFile">
                                                </div>
                                                <h6>Choose Picture</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>姓名</label>
                                                <input name="name" type="text" class="form-control" value="${employee.name}" >
                                            </div>
                                            <div class="form-group">
                                                <label>性别</label>
                                                <select name="sex" id="sex" class="form-control">
                                                    <option value="F"> 女 </option>
                                                    <option value="M"> 男 </option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>手机</label>
                                                <input name="phoneNum" type="text" class="form-control" value="${employee.phoneNumber}">
                                            </div>
                                        </div>
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>住址</label>
                                                <input name="address" type="" class="form-control" value="${employee.address}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane" id="address">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <br>
                                            <br>
                                        </div>
                                        <div class="col-sm-7 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>员工账号</label>
                                                <input name="account" type="text" class="form-control" value="${employee.account}">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>员工ID</label>
                                                <input name="userID" type="text"  class="form-control" value="${employeeID}" disabled="true"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>账号密码</label>
                                                <input type="text" name="psw" class="form-control" value="${employee.pwd}">
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="form-group">
                                                <label>职位</label><br>
                                                <select name="position"  id="position" class="form-control">
                                                    <option value="waiter"> 服务员 </option>
                                                    <option value="admin"> 管理员 </option>
                                                    <option value="cook"> 后厨 </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer height-wizard">
                                <div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='Next' />
                                    <input type='submit' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Finish' />

                                </div>

                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
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

</div>
</body>
</html>

