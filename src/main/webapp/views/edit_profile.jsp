<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${rootpath}">

    <title>修改个人资料</title>

    <%@include file="../css-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <%@include file="../js-common.jsp" %>
    <style>
        .title {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
</head>


<body class="canvas-menu">

<div id="wrapper">
    <!-- 左边导航栏开始 -->
    <%--<%@include file="../left_nav.jsp" %>--%>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部开始 -->
        <%@include file="../head.jsp" %>
        <!-- 头部结束 -->
        <%--<!-- 头部开始 -->
        <%@include file="../top_nav.jsp" %>
        <!-- 头部结束 -->

        <!-- 链接开始 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>主标题</h2>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">前台展示页</a></li>
                    <li class="active"><strong>本页</strong></li>
                </ol>
            </div>
            <div class="col-sm-8">
                <div class="title-action">
                    <a href="" class="btn btn-primary">行动区</a>
                </div>
            </div>
        </div>
        <!-- 链接结束 -->--%>

        <!-- ===================主要内容开始=================== -->
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1" style="padding: 0px 0px 40px 0px;">
                <div class="wrapper wrapper-content animated fadeInUp" style="padding: 0px;">
                    <div class="ibox">
                        <div class="ibox-content">

                            <div class="row m-b-lg m-t-lg">

                                <c:if test="${not empty curUser}">
                                    <div class="col-md-5">

                                        <div class="profile-image">
                                            <img id="myHead" src="../${curUser.userImageUrl}"
                                                 class="img-circle circle-border m-b-md" alt="profile">
                                            <a id="uptHead" href="#" class="btn" data-toggle="modal"
                                               data-target="#uptPic" value="${curUser.userId}">
                                                <span class="glyphicon glyphicon-edit"></span>修改头像
                                            </a>
                                        </div>
                                        <div class="profile-info">
                                            <div class="">
                                                <div>
                                                    <h1 class="no-margins">
                                                    <span id="userNickname">
                                                            ${curUser.userNickname}
                                                    </span>
                                                    </h1>
                                                    <small>
                                                    <span id="userProfile">
                                                            ${curUser.userProfile}
                                                    </span>
                                                    </small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <table class="table small m-b-xs">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <strong>性别</strong>
                                                    <span id="userSex">${curUser.userSex}
                                                    </span>
                                                </td>
                                                <td>
                                                    <strong>出生日期</strong>
                                                    <span id="userBirthday">
                                                <fmt:formatDate value='${curUser.userBirthday }'
                                                                pattern='yyyy-MM-dd'/>
                                                </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>邮箱</strong>
                                                    <span id="userEmail">${curUser.userEmail}</span>
                                                </td>
                                                <td>
                                                    <strong>手机号</strong>
                                                    <span id="userMobile">${curUser.userMobile}</span>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>地址</strong>
                                                    <span id="userAddress">${curUser.userAddress}</span>
                                                </td>
                                                <td>
                                                    <strong>学历</strong>
                                                    <span id="eduBackground">${curUser.eduBackground}</span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-3">
                                        <a href="#" class="btn" data-toggle="modal" data-target="#showMe"
                                           value="${curUser.userId}">
                                            <span class="glyphicon glyphicon-edit"></span>修改个人资料
                                        </a>
                                    </div>

                                </c:if>
                            </div>

                            <div class="row m-t-sm">
                                <div class="col-lg-12">
                                    <div class="panel blank-panel">
                                        <div class="panel-heading">
                                            <div class="panel-options">
                                                <ul class="nav nav-tabs">
                                                    <li class="active" style="width: 33.33%"><a class="" href="#tab-1"
                                                                                                data-toggle="tab">站长博客</a>
                                                    </li>
                                                    <li class="" style="width: 33.33%"><a class="" href="#tab-2"
                                                                                          data-toggle="tab">我的收藏</a>
                                                    </li>
                                                    <li class="" style="width: 33.33%"><a class="" href="#tab-2"
                                                                                          data-toggle="tab">我的往来</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="panel-body">

                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab-1">
                                                    <div class="" id="myBlog"></div>
                                                    <input type="hidden" value="0" id="blog_pageNo">
                                                    <button id="showMore" class="btn btn-primary btn-block m-t"
                                                            onclick="get_more_blog(this)">
                                                        <i class="fa fa-arrow-down"></i>展示更多
                                                    </button>
                                                </div>
                                                <div class="tab-pane" id="tab-2"></div>
                                                <div class="tab-pane" id="tab-3"></div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===================主要内容结束=================== -->
        <!-- 底部 -->
        <%@include file="../bottom.html" %>
        <!-- Toastr script -->
        <script src="js/plugins/toastr/toastr.min.js"></script>
    </div>
</div>
<script>
    var hasNext = true;
    $(function () {
        get_more_blog();
    })
    $(window).scroll(function (event) {
        var wScrollY = window.scrollY; // 当前滚动条位置
        var wInnerH = window.innerHeight; // 设备窗口的高度（不会变）
        var bScrollH = document.body.scrollHeight; // 滚动条总高度 元素内容的高度
        if (wScrollY + wInnerH + 100 >= bScrollH && hasNext) {//在滚动条距离底端50px以内
            //console.info("当前滚动条位置:"+wScrollY+"设备窗口的高度（不会变）"+wInnerH+"滚动条总高度"+bScrollH);
            var showMore = $("#showMore");
            get_more_blog(showMore);
        }
    });

    function get_more_blog(obj) {
        if (!hasNext) {
            return;
        }
        var myBlog = $("#myBlog");
        var blog_pageNo = parseInt($('#blog_pageNo').val());
        $.ajax({
            type: "GET",
            url: 'article/selectShowMore/edit_profile',
            data: {pageNo: blog_pageNo + 1},
            dataType: 'json',
            async: false,
            success: function (data) {
                //console.info(data.length);
                if (data.length == 0) {//没数据了
                    $(obj).html("已全部加载");
                    hasNext = false;
                } else {
                    $.each(data, function (i, item) {
                        //console.info(item.artiId+"=="+item.artiTitle+"=="+item.artiTime);
                        var d = new Date(item.artiTime);
                        var option = $("<div class=\"ibox-content \">" +
                            "<h3 class=\"col-md-10\"><a href=\"article/queryById/" + item.artiId + " /detail\"\n" +
                            "class=\"btn-link \">" + item.artiTitle + "</a></h3>" +
                            "<small class=\"col-md-2\">" + d.Format('yyyy-MM-dd hh:mm:ss') + "</small></div>");
                        myBlog.append(option);
                    });
                    $('#blog_pageNo').val(blog_pageNo + 1);
                }
            }
        })
    }

</script>
<!-- 修改用户信息模态框 -->
<div class="modal inmodal fade" id="showMe" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">修改个人资料</h4>
            </div>
            <%--<c:if test="${not empty user}">&lt;%&ndash;之前userCookie空情况&ndash;%&gt;--%>
            <form id="uptMyInfoForm" action="" method="post">
                <div class="modal-body" id="updateMe"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <input id="uptMyInfo" type="button" class="btn btn-primary" value="确认修改">
                </div>
                <%-- </c:if>--%>
            </form>
        </div>
    </div>
</div>
<script>
    $('#showMe').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var userId = button.attr("value");
        cur = $(event.relatedTarget);
        $('#updateMe').load("user/selectUserById/" + userId + "/showMe");
    });
    /*$('body.canvas-menu .sidebar-collapse').slimScroll({
        height: '100%',
        railOpacity: 0.9
    });*/
    $(document).ready(function () {

        $('#uptMyInfo').click(function () {
            // var rePassword = $("input[name='']").val();
            // var userName = $("#userName").val();
            //var userPassword = $("#userPassword").val();
            var data = $('#uptMyInfoForm').serialize(); //name=value&p2=v2&....有问题日期
            //var data = {userId:2,userNickname:"李四1"};
            //console.log("序列化" + data);
            $.ajax({
                url: "user/uptMyInfo",
                type: "post",
                data: data,
                dataType: "json",
                success: function (result) {
                    var b = (new Date(result.userBirthday)).Format("yyyy-MM-dd");
                    $('#showMe').modal('hide');
                    $('#userNickname').text(result.userNickname);
                    $('#userSex').text(result.userSex);
                    $('#userBirthday').text(b);
                    //Unable to convert string ["+result.userBirthday +"] to class [java.util.Date] for attribute [value]: [Property Editor not registered with the PropertyEditorManager]
                    //$('#userBirthday').text("<%--<fmt:formatDate value='"+b +"' pattern='yyyy-MM-dd' />--%>");
                    $('#userEmail').text(result.userEmail);
                    $('#userMobile').text(result.userMobile);
                    $('#userAddress').text(result.userAddress);
                    $('#eduBackground').text(result.eduBackground);
                    $('#userProfile').text(result.userProfile);
                    success("更新个人资料成功！");
                },
                error: function () {
                }
            });
        });

    });

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

    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
<div id="uptPic2"></div>
<script>
    $(function () {
        var userId = $('#uptHead').attr("value");
        //$('#uptPic2').load("user/selectUserById/" + userId + "/uptPic");
        $('#uptPic2').load("user/selectUserById/" + userId + "/uptPic2");
    })
</script>
</body>

</html>
