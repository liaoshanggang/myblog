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

        .loadingdiv {
            height: 35px;
            text-indent: 40px;
            overflow: hidden;
            background: url(img/blog/loading.gif) 0 center no-repeat;
            font-size: 12px;
            color: #ccc;
            line-height: 35px;
            margin-left: 30px;
        }

        .entry {
            font-size: 14px;
            line-height: 1.9;
        }

        .shadow {
            box-shadow: 0px 0px 15px #888888;
        }

        .entry ul {
            margin-bottom: 1em;
            margin-left: 20px;
        }

        .entry a:hover {
            text-decoration: none;
            background: #2085c5;
            color: #fff;
            border-radius: 3px;
        }

        .entry ul li time {
            margin-right: 8px;
            color: #666;
            font-size: 13px;
        }

        .entry a {
            color: #3d658d;
            text-decoration: none;
        }

        .entry h2 {
            margin-bottom: 10px;
            padding: 4px 0;
            border-bottom: 1px dashed #ccc;
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
        <!-- ===================主要内容开始=================== -->
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1" style="padding: 0px 0px 40px 0px;">
                <div class="wrapper wrapper-content animated fadeInUp" style="padding: 0px;">
                    <div class="ibox">
                        <div class="ibox-content shadow">
                            <input type="hidden" value="0" id="blog_pageNo">
                            <div class="entry archives" id="archivesList">
                                <h2>2018</h2>
                            </div>
                            <div id="loadingdiv" class="loadingdiv" style="">正在加载中..</div>
                            <%--<div id="vertical-timeline" class="vertical-container"></div>--%><%-- dark-timeline--%>
                            <div class="text-center">
                                <a id="showMore" class="m-t">
                                </a>
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
        <!-- Peity -->
        <script src="js/plugins/peity/jquery.peity.min.js"></script>
    </div>
</div>
<script>
    var pagenum = 1, ajaxstatus = true, ajaxone = 1;
    $(function () {
        /*$("#loadingdiv").ajaxStart(function () {
            $("#loadingdiv").show();
        });*/
        if (ajaxone == 1 && pagenum == 1) {
            get_more_blog();
        }
    });
    $(window).scroll(function (event) {
        var wholeHeight = $(document).height();
        var scrollTop = $(this).scrollTop();
        var clientHeight = $(this).height();
        if (clientHeight + scrollTop + 10 >= wholeHeight && ajaxstatus && ajaxone == 1) {//在滚动条距离底端50px以内
            get_more_blog();
        }
        // var wScrollY = window.scrollY; // 当前滚动条位置
        // var wInnerH = window.innerHeight; // 设备窗口的高度（不会变）
        // var bScrollH = document.body.scrollHeight; // 滚动条总高度 元素内容的高度
        // if (wScrollY + wInnerH +10 >= bScrollH&& ajaxstatus&&ajaxone==1) {//在滚动条距离底端50px以内
        //     console.info("当前滚动条位置:"+wScrollY+"设备窗口的高度（不会变）"+wInnerH+"滚动条总高度"+bScrollH);
        //     get_more_blog();
        // }
    });

    function get_more_blog() {
        ajaxone++;
        /*setTimeout(function () {
        }, 5000);*/
        //$("#loadingdiv").css("display","show");
        $("#loadingdiv").show();
        var blog_pageNo = parseInt($('#blog_pageNo').val());
        //var blog_pageNo = pagenum;
        $.ajax({
            url: "article/selectShowMore/archives",
            type: "post",
            dataType: "json",
            /*async: false,*/
            data: {pageNo: blog_pageNo + 1},//blog_pageNo
            /*beforeSend:function(){
                $("#loadingdiv").show(1000);
            },*/
            success: function (data) {
                ajaxone = 1;
                $("#loadingdiv").hide();
                console.info(data.length);
                var a_length = data.length;
                if (a_length > 0) {
                    //pagenum ++;
                    var year = $("#archivesList h2:last").html();
                    var li = '';
                    $.each(data, function (i, item) {
                        //console.info(item.artiId+"=="+item.artiTitle+"=="+item.artiTime);
                        var time = new Date(item.artiTime).Format("MM/dd");
                        var clicknum = item.artiPageView ? item.artiPageView : 1;
                        li = li + '<li><time datetime="' + new Date(item.artiTime) + '">' + time + '</time>' +
                            '<a href="article/queryById/' + item.artiId + '/detail">' + item.artiTitle + '</a>' +
                            '<span style="color:#a8ced8;margin-left:30px;">' + clicknum + '次浏览</span> </li>';
                    });
                    if (year.indexOf("2018") != -1) {//找到
                        var appendHtml = '<ul>' + li + '</ul>';
                    } else {
                        var appendHtml = '<h2>' + year + '2018年及以前文章</h2><ul>' + li + '</ul>';
                    }
                    $("#archivesList").append(appendHtml);
                    if (blog_pageNo == 0) {
                        $('#blog_pageNo').val(blog_pageNo + 2);
                    } else {
                        $('#blog_pageNo').val(blog_pageNo + 1);
                    }
                } else {
                    ajaxstatus = false;
                    $("#showMore").text("没有更多了");
                }
                //$("#loadingdiv").css("display","none");
            }
        })
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
</body>

</html>
