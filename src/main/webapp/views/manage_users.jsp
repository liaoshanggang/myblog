<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/2
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
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

    <title>后台管理主页</title>

    <%@include file="../css-common.jsp" %>
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <%@include file="../js-common.jsp" %>
</head>
<body class="">

<div id="wrapper" style="background-color:#20222a">
    <%-- <jsp:include page="left_nav.html" flush="true"/> --%>
    <!-- 左边导航栏开始 -->
    <%@include file="../left_nav.jsp" %>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部开始 -->
        <%@include file="../top_nav.jsp" %>
        <!-- 头部结束 -->
        <!-- 链接开始 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>主标题</h2>
                <ol class="breadcrumb">
                    <li><a href="../index.jsp">前台展示页</a></li>
                    <li class="active" id="mgr_users"><strong>用户管理</strong></li>
                </ol>
            </div>
            <div class="col-sm-8">
                <div class="title-action">
                    <a href="" class="btn btn-primary">行动区</a>
                </div>
            </div>
        </div>
        <!-- 链接结束 -->

        <!-- ===================主要内容开始=================== -->
        <div class="wrapper wrapper-content">

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- pre-scrollable -->
                        <div class="panel-body scroll_content">
                            <div class="ibox">
                                <div class="ibox-content">
                                    <form id="queryForm" method="get" action="user/queryAll" class="col-lg-4 pull-left">
                                        <div class="input-group">
                                            <input type="text" class="form-control col-lg-2"
                                                   name="userKeyWords" placeholder="请输入查询条件">
                                            <div id="search" class="input-group-btn">
                                                <button type="submit" class="btn btn-outline btn-primary">查询
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <table class="table table-hover" style="table-layout:fixed">
                                <thead>
                                <tr>
                                    <th style="width:5%;"><img alt="" src="img/blog/seq.png"></th>
                                    <th style="width:15%;">用户名</th>
                                    <th style="width:15%;">用户昵称</th>
                                    <th style="width:15%;">邮箱</th>
                                    <th style="width:15%;">手机号</th>
                                    <th style="width:15%;">学历</th>
                                    <th style="width:10%;">简介</th>
                                    <th style="width:10%;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${userList}" varStatus="status">
                                    <tr>
                                        <td>
                                            <input type="checkbox" value="${user.userId}" name="CheckBox">
                                        </td>
                                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                            value="${user.userName}">${user.userName}</td>
                                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                            value="${user.userNickname}">${user.userNickname}</td>
                                        <td class="" value="">${user.userEmail}</td>
                                        <td class="" value=""> ${user.userMobile}</td>
                                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                            value="${user.eduBackground}">${user.eduBackground}</td>
                                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                            value="${user.userProfile}">${user.userProfile}</td>
                                        <td class="">
                                            <button class="btn btn-success btn-outline btn-xs updateUser" type="button"
                                                    value="${user.userId}" data-toggle="modal" data-target="#showUser">
                                                更新
                                            </button>
                                            <button class="btn btn-danger btn-outline btn-xs delUser"
                                                    type="button" value="${user.userId}">删除
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <strong>全选：</strong><input type="checkbox" id="selectAll">
                            <button id="batchDelBtn" class="btn btn-danger" style="margin-left:30px"
                                    onclick="delSelectUser();">批量删除
                            </button>
                        </div>
                        <div class="panel-heading panel-default ">
                            <!-- 分页链拉开始 -->
                            <div>
                                <div>
                                    <c:if test="${not empty userPage}">
                                        <ul class="pager pagination pagination-lg">
                                            <li><a href="user/queryAll?pageNo=1">首页</a></li>
                                            <c:if test="${userPage.pageNo gt 1 &&  userPage.pageNo le userPage.totalPage}">
                                                <li><a href="user/queryAll?pageNo=${userPage.pageNo-1}">«上一页</a></li>
                                            </c:if>
                                            <c:if test="${userPage.pageNo gt 3}">
                                                <li><a href="javascript:void(0)">....</a></li>
                                            </c:if>
                                            <c:if test="${userPage.pageNo-2 ge 1}">
                                                <li>
                                                    <a href="user/queryAll?pageNo=${userPage.pageNo-2}">${userPage.pageNo-2}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${userPage.pageNo-1 ge 1}">
                                                <li>
                                                    <a href="user/queryAll?pageNo=${userPage.pageNo-1}">${userPage.pageNo-1}</a>
                                                </li>
                                            </c:if>
                                            <li class="active"><a
                                                    href="user/queryAll?pageNo=${userPage.pageNo}">${userPage.pageNo}</a>
                                            </li>
                                            <c:if test="${userPage.pageNo+1 le userPage.totalPage}">
                                                <li>
                                                    <a href="user/queryAll?pageNo=${userPage.pageNo+1}">${userPage.pageNo+1}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${userPage.pageNo+2 le userPage.totalPage}">
                                                <li>
                                                    <a href="user/queryAll?pageNo=${userPage.pageNo+2}">${userPage.pageNo+2}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${userPage.pageNo+2 lt userPage.totalPage}">
                                                <li><a href="javascript:void(0)">....</a></li>
                                            </c:if>
                                            <c:if test="${userPage.pageNo ge 1 && userPage.pageNo lt userPage.totalPage }">
                                                <li><a href="user/queryAll?pageNo=${userPage.pageNo+1}">下一页»</a></li>
                                            </c:if>
                                            <li><a href="user/queryAll?pageNo=${userPage.totalPage}">尾页</a>
                                            </li>
                                        </ul>
                                    </c:if>
                                </div>
                            </div>
                            <!-- 分页链拉结束 -->
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- ===================主要内容结束=================== -->

        <!-- 底部 -->
        <%@include file="../bottom.html" %>
    </div>
</div>
<script src="js/plugins/iCheck/icheck.min.js"></script>
<!-- Toastr script -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-green'
        });
        enableBatchBtn();
        //全选、反选
        $('#selectAll').on('ifChecked', function () {
            $('input').iCheck('check');
            enableBatchBtn();
        });
        $('#selectAll').on('ifUnchecked', function () {
            $('input').iCheck('uncheck');
            enableBatchBtn();
        });
        $('table div.icheckbox_square-green ins').click(function () {
            enableBatchBtn();
        });

        $(".delUser").click(function () {
            var cur = $(this);
            swal({
                title: "你确定要删除吗？",
                text: "",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#ED5565",//DD6B55
                confirmButtonText: "是的，删除它！",
                cancelButtonText: "不，取消！",
                allowOutsideClick: true,
                closeOnConfirm: true,
                closeOnCancel: true
            }, function (isConfirm) {
                if (isConfirm) {
                    var curTr = $(cur).parent().parent();
                    //console.info(curTr);
                    var id = $(cur).attr("value");
                    var json = {userId: id};
                    $.ajax({
                        url: "user/deleteUser",
                        type: "post",
                        data: json,
                        success: function (result) {
                            //console.info(result);
                            if (result == "success") {
                                curTr.remove();
                                //location = location;
                                success("删除成功！");
                            }
                        },
                        error: function () {
                        }
                    });
                } else {
                    //swal("取消", "该类别未删除！:):):)", "error");
                }
            });


        })


    });

    function enableBatchBtn() {

        if ($('table div.icheckbox_square-green.checked').size() < 1) {
            console.info("0");
            $("#batchDelBtn").attr("disabled", true);
        } else {
            console.info("1");
            $("#batchDelBtn").attr("disabled", false);
        }
    }

    function delSelectUser() {
        //if(id==undefined){//防止table之外全选那个
        var len = 0;//计选中的个数
        var cks = $("input[name='CheckBox']");
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked) {
                ++len;
                //console.info("len==" + len);
            }
        }
        if (len == 0) {
            success("请选择要删除的用户信息！");
            return;
        }
        var ids = [];//存所有选中id的值
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked) {
                var id = $(cks[i]).val();
                ids.push(id);
                //console.info("id==" + id);
            }
        }
        var delId = ids.join(",");
        //console.info("de==" + delId);
        $.ajax({
            url: "user/batchDelUser",
            type: "post",
            data: "delId=" + delId,
            success: function (result) {
                for (var i = 0; i < cks.length; i++) {
                    if (cks[i].checked) {
                        $(cks[i]).parent().parent().parent().remove();
                        //console.info();
                    }
                }
                $("#batchDelBtn").attr("disabled", true);//删除后按钮不可用
                success("批量删除成功！");
                //if(window.reload){success("批量删除成功！");}
                /*setTimeout(function(){
                    success("批量删除成功！");
                },2000);*/
            },
            error: function () {

            }
        });
        // }
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
</script>
<!-- 修改用户信息模态框 -->
<div class="modal inmodal fade" id="showUser" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">更新用户信息</h4>
            </div>
            <form id="uptUserForm" action="" method="post">
                <div class="modal-body" id="updateUser"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <input id="uptUser" type="button" class="btn btn-primary" value="确认修改">
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    var cur;
    $('#showUser').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var userId = button.attr("value");
        cur = $(event.relatedTarget);
        $('#updateUser').load("user/selectUserById/" + userId + "/showUser");
    });
    $('#uptUser').click(function () {
        // var rePassword = $("input[name='']").val();
        // var userName = $("#userName").val();
        //var userPassword = $("#userPassword").val();
        var data = $('#uptUserForm').serialize(); //name=value&p2=v2&....
        /*var jsonData = $("#uptUserForm").serializeArray();
        jsonData.forEach(function(value,key,json){
            console.info(value+""+key+""+json);
        })*/
        //console.log("序列化" + data);
        $.ajax({
            url: "user/updateUser",
            type: "post",
            data: data,
            dataType: "json",
            success: function (result) {
                $('#showUser').modal('hide');
                var userId = cur.attr("value");
                var tr = cur.parent().parent();
                var up = cur.parent();
                for (var i = 0; i < 6; i++) {
                    up.prev().remove();
                }
                var text = "<td style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;'";
                //解决乱序问题"<td><input type='checkbox' value='" + result.userId + "' name='CheckBox'></td>"
                $(up).before(text +
                    "value='" + result.userName + "'>" + result.userName + "</td>" +
                    text +
                    "value='" + result.userNickname + "'>" + result.userNickname + "</td>" +
                    "<td>" + result.userEmail + "</td><td>" + result.userMobile + "</td>" +
                    text +
                    "value='" + result.eduBackground + "'>" + result.eduBackground + "</td>" +
                    text +
                    "value='" + result.userProfile + "'>" + result.userProfile + "</td>");
                /*var tds = cur.parent().parent().children();
                var i = 1;
                for (var x in result) {
                    console.info("===" + result[x]);
                    console.info($(tds[i]).text());
                    $(tds[i]).text(result[x]);
                    $(tds[i]).attr("value", result[x]);
                    i++;
                }*/
                success("更新成功！");
            },
            error: function () {
            }
        });

    });
</script>

</body>
</html>
