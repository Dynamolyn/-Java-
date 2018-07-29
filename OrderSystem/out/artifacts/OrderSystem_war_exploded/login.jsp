<%--
  Created by IntelliJ IDEA.
  User: Lin Yining
  Date: 2017/9/5
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Motion - Responsive HTML Template</title>
<!-- load stylesheets -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="font-awesome-4.5.0/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap style -->
<link rel="stylesheet" href="css/hero-slider-style.css">
<!-- Hero slider style (https://codyhouse.co/gem/hero-slider/) -->
<link rel="stylesheet" href="css/style.css">

<!-- Templatemo style -->

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>
<script    src="js/gt.js"></script>
<!-- load JS files -->
<script src="js/jquery-1.11.3.min.js"></script>         <!-- jQuery (https://jquery.com/download/) -->
<script src="js/bootstrap.min.js"></script>             <!-- Bootstrap js (v4-alpha.getbootstrap.com/) -->
<script src="js/hero-slider-main.js"></script>          <!-- Hero slider (https://codyhouse.co/gem/hero-slider/) -->
<script src="js/sweetalert.min.js"></script>

        <script>

            var handler2 = function (captchaObj) {
                $("#loginIn").click(function (e) {
                    var result = captchaObj.getValidate();
                    if (!result) {
                //

                    } else {
                        $.ajax({
                            url: 'gt/ajax-validate2',
                            type: 'POST',
                            dataType: 'json',
                            data: {
                                //////////////////////////////
//                                username: $('#username2').val(),
//                                password: $('#password2').val(),
                                geetest_challenge: result.geetest_challenge,
                                geetest_validate: result.geetest_validate,
                                geetest_seccode: result.geetest_seccode
                            },
                            success: function (data) {
                                if (data.status === 'success') {
                                    submitNandP();

                                } else if (data.status === 'fail') {
                                    swal("登录失败！", "请刷新重试");
                                   // window.location.href = "${pageContext.request.contextPath}/login.jsp?time="+new Date();
                                }
                            }
                        })
                    }
                    e.preventDefault();
                });
                // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
                captchaObj.appendTo("#captcha2");
                captchaObj.onReady(function () {
//                    $("#wait2").hide();
                });
                // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
            };
            $.ajax({
                url: "gt/register2?t=" + (new Date()).getTime(), // 加随机数防止缓存
                type: "get",
                dataType: "json",
                success: function (data) {
                    // 调用 initGeetest 初始化参数
                    // 参数1：配置参数
                    // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
                    initGeetest({
                        gt: data.gt,
                        challenge: data.challenge,
                        new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                        offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                        product: "popup", // 产品形式，包括：float，popup
                        width: "100%"
                        // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
                    }, handler2);
                }
            });
            var verJump = "false";

        function JumpTo() {
            window.location.href = "${pageContext.request.contextPath}/jumpTo.do";
        }

        function submitNandP(){
            if ($("#name").val() == "") {
                swal({title:"用户名不能为空！"});
                $("#name").focus();
                return;
            }
            if ($("#password").val() == "") {
                swal({title:"密码不能为空！"});
                $("#password").focus();
                return;
            }
            $.ajax({
                type: "POST",
                async : false,
                url: "${pageContext.request.contextPath}/loginUser.do",
                data:{name:$("#name").val(), password:$("#password").val()} ,
                dataType:"text",
                success: function (data) {
                    if(data=="true")
                        JumpTo();
                    else {
                        swal({title:"用户名或验证码错误！"});
                        window.location.href = "${pageContext.request.contextPath}/login.jsp?time="+new Date();

                    }
                    return;
                },
                error:function (XMLHttpRequest) {
                    alert(XMLHttpRequest.readyState);
                }
            });
        }
            //登录验证函数




                /*var inpCode = $("#verCode").val();
                $.ajax({
                    type: "POST",
                    async : false,
                    url: "{pageContext.request.contextPath}/verCodeString.do",
                    data:{verCode:inpCode} ,
                    dataType:"text",
                    success: function (data) {
                        if (data == "true") {
                            //function succes
                            submitNandP();
                            return;
                        }
                        else {
                            alert("验证码错误！");
                            changeCode();
                            return;
                        }
                    },
                    error:function (XMLHttpRequest) {
                        alert(XMLHttpRequest.readyState);
                    }

                });*/


    </script>

</head>

<body>

<!-- header -->
<ul class="cd-hero-slider">
    <div class="cd-full-width">
        <div class="container-fluid">

            <div class="cd-bg-video-wrapper" data-video="video/bgVideo">
                <!-- video element will be loaded using jQuery -->
            </div> <!-- .cd-bg-video-wrapper -->

            <div class="row">
                <div class="col-xs-2"></div>
                <div class="col-xs-5 animate-box" data-animate-effect="fadeInUp">
                    <h1 class="cursive-font row"><br><br><br>All in good taste!</h1>
                </div>
                <div class="col-xs-5 ">
                    <div class="col-md-8  animate-box" data-animate-effect="fadeInRight">
                        <div class="login-form form-wrap">
                            <div class="tab-content">
                            <form action="/loginUser.do" id="loginUser"  class="form-horizontal" method="post">
                                <div class="row form-group ">
                                    <div class="input-group">
                                        <span class="input-group-addon "><span class="glyphicon glyphicon-user"></span></span>
                                        <input type="text" name="name" id="name" class="form-control" placeholder="输入账号" value=""  onBlur="if (this.value == '') {this.value = '';}">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class=" input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                        <input type="password" class="form-control" name="password" id="password" placeholder="输入密码" value=""
                                               onBlur="if (this.value == '') {this.value = '';}">
                                    </div>
                                </div>

                                <div class="row form-group">
                                      <p id="notice1" class="hide">请先完成验证</p>
                                      <div id="captcha2">

                                      </div>
                            </div>
                            <div class="row form-group ">
                                <button type="button" id="loginIn" class="btn btn-primary btn-block" >登录</button>
                            </div>
                        </form>
                            </div>
                    </div>

                </div>

            </div>

        </div>
        </div>
    </div> <!-- .cd-full-width -->

</ul> <!-- .cd-hero-slider -->

</body>
</html>



