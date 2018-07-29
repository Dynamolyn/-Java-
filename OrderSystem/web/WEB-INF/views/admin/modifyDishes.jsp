<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/12
  Time: 21:08
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
    <title>Get Shit Done Bootstrap Wizard by Creative Tim</title>

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

    <!--  More information about jquery.validate here: http://jqueryvalidation.org/  -->
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
                        <form action="/submitModifyDish.do" method="post" enctype="multipart/form-data">
                            <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                            <div class="wizard-header">
                                <h3>
                                    <b>WELCOME</b> 修改您的菜品信息 <br>
                                    <small>请完善表格.</small>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">菜品信息表单</a></li>
                                </ul>

                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">

                                        <div class="col-sm-4 col-sm-offset-1">
                                            <br>
                                            <br>
                                            <div class="picture-container">
                                                <div class="picture">
                                                    <img src="${dish.img}" class="picture-src"  id="wizardPicturePreview" title=""/>
                                                    <input type="file" id="wizard-picture" name="pictureFile">
                                                </div>
                                                <h6>Choose Picture</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>菜品编码</label>
                                                <input  type="text"  name="dishID" class="form-control" value="${dishID}" disabled="true">
                                            </div>
                                            <div class="form-group">
                                                <label>名称</label>
                                                <input  type="text" name="name" class="form-control" value="${dish.name}">
                                            </div>
                                            <div class="form-group">
                                                <label>推荐</label>
                                                <select name="recommed" class="form-control">
                                                    <option value="Y"> 是 </option>
                                                    <option value="N"> 否 </option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>价格</label>
                                                <input  type="text" name="price" class="form-control" value="${dish.price}"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>简介</label>
                                                <input name="description" type="text" class="form-control"  value="${dish.description}"/>
                                            </div>
                                            <div class="form-group">
                                                <label>描述</label>
                                                <textarea name="txt" row="2"  type="text" class="form-control"    value="${dish.txt}"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="wizard-footer height-wizard">
                                <div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='Next' />
                                    <input type='submit' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Finish' />

                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div><!-- end row -->
    </div> <!--  big container -->
</div>


</body>
</html>