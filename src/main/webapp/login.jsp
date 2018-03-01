<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    application.setAttribute("rootpath", basePath);
%>--%>
<!DOCTYPE>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="${rootpath}">
    <%@include file="css-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <title>登录</title>
    <style>
        .error {
            color: red;
        }

        .contain {
            position: absolute;
            left: 0;
            right: 0;
            margin: auto;
            top: 0;
            bottom: 0;
        }

        .login {
            box-shadow: -15px 15px 15px rgba(6, 17, 47, 0.7);
            padding: 76px 30px 30px 30px;
            background: #35394a;
            background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, #35394a), color-stop(100%, rgb(0, 0, 0)));
            background: -webkit-linear-gradient(230deg, rgba(53, 57, 74, 0) 0%, rgb(0, 0, 0) 100%);
            background: linear-gradient(230deg, rgba(53, 57, 74, 0) 0%, rgb(0, 0, 0) 100%);
        }

        body {
            padding: 0;
            margin: 0;
            height: 100%;
            font-size: 16px;
            background-repeat: no-repeat;
            background-position: left top;
            background-color: #242645;
            background-size: 100%;
            background-image: url(img/blog/Starry.jpg);
        }
    </style>
</head>
<body class=""><%--style="background:#f3f3f4"--%>
<div class="loginColumns animated fadeInDown contain" style="padding-top:50px;">
    <div class="row">

        <div class="">
        </div>
        <div class="col-md-6 col-md-offset-3">
            <div class="ibox-content login">
                <h2 class="font-bold" style="color:#6699FF">欢迎来到我的个人博客系统</h2>
                <form class="cmxform" id="signupForm" class="m-t" role="form" action=""
                      method="post"><%--target="nm_iframe"javascript:void(0);--%>
                    <div class="form-group" style="margin-bottom:0px;height:55px;">
                        <div class="input-group m-b" id="userName" style="margin-bottom:0px;"><span
                                class="input-group-addon">&nbsp;<span
                                class="glyphicon glyphicon-user"></span>&nbsp;</span>
                            <input value="admin" type="text" class="form-control" name="userName"
                                   placeholder="用户名/手机号/邮箱"
                                   required="">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom:0px;height:55px;">
                        <div class="input-group m-b" id="password" style="margin-bottom:0px;"><span
                                class="input-group-addon">&nbsp;<span
                                class="glyphicon glyphicon-lock"></span>&nbsp;</span>
                            <input value="admin" type="password" class="form-control" name="userPassword"
                                   placeholder="请输入密码"
                                   required=""></div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <h3><img id="img" alt="" src="user/code" class="pull-left" onclick="changeImge(this)">
                                <a class="btn-link" onclick="change(this)">看不清？换一个</a></h3>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom:0px;height:55px;">
                        <div class="input-group" id="submitCode" style="margin-bottom:0px;">
									  <span class="input-group-addon" id="basic-addon1">
									  	&nbsp;<span class="glyphicon glyphicon-picture"></span>&nbsp;
									  </span>
                            <input type="text" class="form-control" name="submitCode" maxlength="5" placeholder="请输入验证码"
                                   aria-describedby="basic-addon1" required="">
                        </div>
                    </div>
                    <button id="submit" type="submit" class="btn btn-outline btn-success block full-width m-b">登录
                    </button>

                    <a href="#">
                        <small>忘记密码？</small>
                    </a>
                    <p class="text-muted text-center">
                        <small>还没有账号？</small>
                    </p><!-- <a href="stulogin.jsp"><small>学生登录</small></a> -->
                    <a class="btn btn-sm btn-white btn-block" data-dismiss="modal" data-toggle="modal"
                       data-target="#regModel">创建一个账户</a>
                    <p class="m-t" style="text-align: center;">
                        <small>Copyright © forwardLiao 2018</small>
                    </p>
                </form>
                <%--<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>--%>
                <%--<iframe id="frame3d" name="frame3d" frameborder="0" width="100%" scrolling="auto"
                        style="margin-top: -4px;" onload="this.style.height=document.body.clientHeight-84"
                        height="100%" src="http://www.5202m.com" mce_src="http://www.baidu.com">

                </iframe>--%>
            </div>
        </div>
    </div>
    <hr/>
</div>
<!-- 注册模态框 -->
<div class="modal inmodal" id="regModel" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">请填写注册信息</h4>
            </div>
            <form id="regForm" action="" method="post">
                <div class="modal-body" id="regModalBody">
                    <div class="form-group" style="margin-bottom:0px;height:55px;">
                        <div class="input-group m-b" style="margin-bottom:0px;"><span class="input-group-addon">用&nbsp;&nbsp;户&nbsp;&nbsp;名</span>
                            <input id="userName1" type="text" class="form-control" name="userName" placeholder="请输入用户名"
                                   required="">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom:0px;height:55px;">
                        <div class="input-group m-b" style="margin-bottom:0px;"><span
                                class="input-group-addon">设置密码</span>
                            <input id="userPassword1" type="password" class="form-control" name="userPassword1"
                                   placeholder="请输入密码"
                                   required=""></div>
                    </div>
                    <div class="form-group" style="margin-bottom:0px;height:55px;">
                        <div class="input-group m-b" style="margin-bottom:0px;"><span
                                class="input-group-addon">确认密码</span>
                            <input id="rePassword" type="password" class="form-control" name="rePassword"
                                   placeholder="请再次输入密码"
                                   required=""></div>
                    </div>
                    <div class="form-group">
                        <input id="agreeCB" name="agree" type="checkbox"><span>同意条款和政策</span>
                    </div>
                    <button id="reg" type="submit" class="btn btn-outline btn-success block full-width m-b">注册</button>

                    <p class="text-muted text-center">
                        <small>已经有一个帐户？</small>
                    </p>
                    <a class="btn btn-sm btn-white btn-block" data-dismiss="modal" data-toggle="modal"
                       data-target="#myModel3">请登陆</a>
                </div>
                <!--<div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="确认注册"
                       onclick="change(this)">
            </div>-->
            </form>
        </div>
    </div>
</div>
<%@include file="js-common.jsp" %>
<!-- Toastr script -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<script src="dist/jquery.validate.min.js"></script>
<script src="dist/additional-methods.js"></script>
<script src="dist/localization/messages_zh.js"></script>
<script src="dist/jquery.particleground.min.js"></script>
<script>
    //注册
    $('#regModel').on('shown.bs.modal', function (e) {
        // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零
        $(this).css('display', 'block');
        var modalHeight = $(window).height() / 2 - $('#regModel .modal-dialog').height() / 2;
        $(this).find('.modal-dialog').css({
            'margin-top': modalHeight
        });
    });
    $("#agreeCB").on('ifChecked', function () {
        $(this).parent().next().next().remove();
    });
    $("#agreeCB").on('ifUnchecked', function () {
        $(this).parent().next().after("<span class='error'>请接受条款和政策</span>");
    });
    /*function isAgree(){
    $("#agreeCB").on('ifChecked', function () {
        $(this).parent().next().next().remove();
    });
    $("#agreeCB").on('ifUnchecked', function () {
        $(this).parent().next().append("<span>请接受条款和政策</span>");
    });}*/
    /*$("#agreeCB").on('ifUnchecked', function () {
        $(this).parent().next().next().text("请接受条款和政策");
    });*/
    $("#regForm").validate({
        submitHandler: function () {
            /*$('#reg').click(function () {*/

            var rePassword = $("#rePassword").val();
            var userName = $("#userName1").val();
            var userPassword = $("#userPassword1").val();
            // 执行一些动作...
            //console.log("模态框%o","关闭");
            console.log("表单数据：%o", {"userName": userName, "userPassword": userPassword});
            //var data = $('#regModel').serialize(); //name=value&p2=v2&....
            //console.log("序列化"+data);
            var json = {userName: userName, userPassword: userPassword};
            $.ajax({
                url: "user/reg",
                type: "post",
                data: json,
                success: function (result) {
                    console.info(result);
                    if (result == "success") {
                        $('#regModel').modal('hide');
                        //success("注册成功！请登陆");
                        success("注册成功！请修改个人资料");
                        setTimeout(function () {
                            window.location.href = "user/showMe";
                        }, 500);
                        return;
                    }
                    success(result);
                },
                error: function () {
                }
                /*});*/
            });
        },
        errorPlacement: function (error, element) {
            console.info(element);
            if ($(element).attr("id") == "agreeCB") {
                $(element).parent().next().next().remove();
                $(element).parent().next().after(error);
            } else {
                $(element).parent().after(error);
            }
        },
        errorElement: "span",
        debug: true,
        rules: {
            userName: {
                required: true,
                minlength: 2
            },
            userPassword1: {
                required: true,
                minlength: 5,
                maxlength: 50
            },
            rePassword: {
                required: true,
                minlength: 5,
                maxlength: 50,
                equalTo: "#userPassword1"
            },
            agree: {required: true}
        },
        messages: {
            userName: {
                required: "请输入用户名",
                minlength: "用户名必需由两个字母组成"
            },
            userPassword1: {
                required: "请输入密码",
                minlength: "密码长度不能小于5个字母",
                maxlength: "密码长度不能大于 50 个字母"
            },
            rePassword: {
                required: "请输入确认密码",
                minlength: "密码长度不能小于 5 个字母",
                maxlength: "密码长度不能大于 50 个字母",
                equalTo: "两次密码输入不一致"
            },
            email: "请输入一个正确的邮箱",
            agree: "请接受条款和政策"
        }
    });

    //登陆
    $(function () {
        $(".contain").css('display', 'block');
        var modalHeight = $(window).height() / 2 - $(".contain").height() / 2;
        $(".contain").css({
            'margin-top': modalHeight
        });
    })
    //验证登陆
    /*$.validator.setDefaults({

    });*/
    $().ready(function () {
        $(".cancel").click(function () {
            validator.resetForm();
        });
        // 在键盘按下并释放及提交后验证提交表单
        $("#signupForm").validate({
            submitHandler: function () {
                var data = $('#signupForm').serialize();
                console.info(data);
                $.ajax({
                    url: "user/login2/admin",
                    type: "post",
                    data: data,
                    scriptCharset: 'utf-8',
                    success: function (result) {
                        console.info(result);
                        if (result == "success") {
                            // success("登陆成功！2秒后跳转");
                            // setTimeout(function () {
                                window.location.href = "article/query";
                            //}, 2000);
                        } else {
                            success(result);
                        }
                    },
                    error: function () {
                    }
                });
            },
            errorPlacement: function (error, element) {
                // Append error within linked label
                console.info(element);
                $(element).parent().after(error);
            },
            errorElement: "span",
            debug: true,
            rules: {
                userName: {
                    required: true,
                    minlength: 2
                },
                userPassword: {
                    required: true,
                    minlength: 5,
                    maxlength: 50
                },
                submitCode: {
                    required: true,
                    minlength: 5
                },
                agree: "required"
            },
            messages: {
                userName: {
                    required: "请输入用户名",
                    minlength: "用户名必需由两个字母组成"
                },
                userPassword: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于5个字母",
                    maxlength: "密码长度不能大于 50 个字母"
                },
                submitCode: {
                    required: "请输入验证码",
                    minlength: "验证码长度为 5 个字母"
                },
                email: "请输入一个正确的邮箱",
                agree: "请接受我们的声明"
            }
        });
    });

    function changeImge(img) {
        console.info(img);
        img.src = "user/code?r=" + new Date().getTime();
    }

    function change(a) {
        var aa = $(a);
        console.info($(aa).prev());
        $(aa).prev().attr("src", "user/code?r=" + new Date().getTime());
    }

    function success(msg) {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "progressBar": false,
            "preventDuplicates": true,
            "positionClass": "toast-bottom-center",
            "showDuration": "1500",
            "hideDuration": "1500",
            "timeOut": "1500",
            "extendedTimeOut": "1500",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        if ($('#addBehaviorOnToastClick').prop(
                'checked')) {
            toastr.options.onclick = function () {
                alert('You can perform some custom action after a toast goes away');
            };
        }
        toastr.info(msg);
    }

    /*粒子效果*/
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });
    $(document).ready(function () {
        /*$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });*/
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-green',
        });
    });
</script>

<!-- 底部 -->
<%--<%@include file="bottom.html" %>--%>
</body>
</html>

<%--<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">IN+</h1>

        </div>
        <h3>欢迎来到我的个人博客系统</h3>
        <form class="cmxform" id="signupForm" class="m-t" role="form" action="" method="post">&lt;%&ndash;target="nm_iframe"javascript:void(0);&ndash;%&gt;
            <div class="form-group">
                <div class="input-group m-b" id="userName"><span class="input-group-addon">&nbsp;<span
                        class="glyphicon glyphicon-user"></span>&nbsp;</span>
                    <input value="admin" type="text" class="form-control" name="userName" placeholder="请输入用户名"
                           required="">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group m-b" id="password"><span class="input-group-addon">&nbsp;<span
                        class="glyphicon glyphicon-lock"></span>&nbsp;</span>
                    <input value="admin" type="password" class="form-control" name="userPassword"
                           placeholder="请输入密码"
                           required=""></div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <h3><img id="img" alt="" src="user/code" class="pull-left" onclick="changeImge(this)">
                        <a class="btn-link" onclick="change(this)">看不清？换一个</a></h3>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group" id="submitCode">
									  <span class="input-group-addon" id="basic-addon1">
									  	&nbsp;<span class="glyphicon glyphicon-picture"></span>&nbsp;
									  </span>
                    <input type="text" class="form-control" name="submitCode" maxlength="5" placeholder="请输入验证码"
                           aria-describedby="basic-addon1" required="">
                </div>
            </div>
            <button id="submit" type="submit" class="btn btn-primary block full-width m-b">登录</button>
            <!-- <a href="stulogin.jsp"><small>学生登录</small></a> -->
            <a class="btn btn-sm btn-white btn-block" href="register.jsp">创建一个新用户</a>
        </form>
        &lt;%&ndash;<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>&ndash;%&gt;
        &lt;%&ndash;<iframe id="frame3d" name="frame3d" frameborder="0" width="100%" scrolling="auto"
                style="margin-top: -4px;" onload="this.style.height=document.body.clientHeight-84"
                height="100%" src="http://www.5202m.com" mce_src="http://www.baidu.com">

        </iframe>&ndash;%&gt;
        <p class="m-t">
            <small>Inspinia we app framework base on Bootstrap 3 &copy; 2017</small>
        </p>
    </div>
</div>--%>