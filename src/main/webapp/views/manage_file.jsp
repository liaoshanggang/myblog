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
    <%@include file="../js-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <%--<!-- Toastr script -->
    <script src="js/plugins/toastr/toastr.min.js"></script>--%>
    <style>
        .selStyle {
            background-color: #f1f5fa;
            border: 1px solid #333afd;
            border-radius: 2px;
        }

        .enterStyle {

        }

        .top-corner {
            position: absolute;
            display: inline-block;
            width: 0;
            height: 0;
            line-height: 0;
            border: 0.6em solid transparent;
            left: 0em;
            top: 0em;
        }
        .title {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
</head>

<body class="" style="background-color:#20222a">

<div id="wrapper">
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
                    <li><a href="index.jsp">前台展示页</a></li>
                    <li class="active" id="mgr_file"><strong>文件管理</strong></li>
                </ol>
                <ol class="breadcrumb">
                    <li id="path" name="${file.fileId}">${path}</li>
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
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div class="file-manager">
                                <div class="search-form">
                                    <form action="showHome" method="get">
                                        <div class="input-group">
                                            <input type="text" placeholder="键入Enter键以搜索" name="keyWords"
                                                   class="btn btn-facebook btn-outline form-control input-md">
                                            <div class="input-group-btn">
                                                <button class="btn btn-success btn-facebook btn-outline" type="submit">
                                                    搜索
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <button class="btn btn-success btn-outline" id="newDir" type="button">
                                    新建文件夹
                                </button>
                                <button class="btn btn-success btn-outline" type="button" value="102">
                                    离线下载
                                </button>
                                <%--<label title="上传新文件" for="uploadFile" class="btn btn-md btn-success">
                                    <input type="file" id="uploadFile" class="hide">
                                    上传文件
                                </label>--%>
                                <button class="btn btn-md btn-success" type="button" id="batchImportBtn"
                                        value="${rootpath}" data-toggle="modal" data-target="#batchImportModal">
                                    上传文件
                                </button>
                                <div class="hr-line-dashed"></div>
                                <strong>全选：</strong><input type="checkbox" id="selectAll">
                                <button id="batchDelBtn" class="btn btn-danger btn-sm" style="margin-left:10px"
                                        onclick="delSelectUser();">批量删除
                                </button>
                                <div class="hr-line-dashed"></div>
                                <h5>文件夹</h5>
                                <ul class="folder-list" style="padding: 0">
                                    <li><a href=""><i class="fa fa-folder"></i> 档</a></li>
                                    <li><a href="views/album.jsp"><i class="fa fa-folder"></i> 图片</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 网页</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 插图</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 电影</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 图书</a></li>
                                </ul>
                                <%--<h5 class="tag-title">Tags</h5>
                                <ul class="tag-list" style="padding: 0">
                                    <li><a href="">Family</a></li>
                                    <li><a href="">Work</a></li>
                                    <li><a href="">Home</a></li>
                                    <li><a href="">Children</a></li>
                                    <li><a href="">Holidays</a></li>
                                    <li><a href="">Music</a></li>
                                    <li><a href="">Photography</a></li>
                                    <li><a href="">Film</a></li>
                                </ul>--%>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 animated fadeInRight">
                    <div class="row">
                        <div class="col-lg-12" id="files">
                            <c:forEach var="fileInfo" items="${fileInfos}" varStatus="status">
                                <div class="file-box">
                                    <div class="file" name="true">
                                        <span class="top-corner"><input type="checkbox" value="${fileInfo.fileId}" name="CheckBox"></span>
                                        <span class="corner"></span>
                                        <div class="image">
                                            <a href="#"> <img alt="image" class="img-responsive"
                                                              src="${fileInfo.fileIconUrl}"> </a>
                                        </div>
                                        <div class="file-name title">
                                            <a href="fileInfo/queryByPath?path=${fileInfo.filePath}"
                                               title="${fileInfo.fileName}${fileInfo.fileExt}">
                                                    ${fileInfo.fileName}${fileInfo.fileExt}
                                                <br/>
                                                <small><fmt:formatDate value='${fileInfo.fileCreateDate}'
                                                                       pattern='yyyy-MM-dd HH:mm:ss'/></small>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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
<!-- Modal -->
<div id="batchImportModal" class="modal fade" role="dialog"
     aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">上传文件</h4>
            </div>
            <div class="modal-body">
                <div class="form-group" id="passwordDiv">
                    <label>选择用户数据文件</label>
                    <input class="form-control" type="file" id="batchFile">
                </div>
                <div class="progress progress-striped active" style="display: none">
                    <div id="progressBar" class="progress-bar progress-bar-info"
                         role="progressbar" aria-valuemin="0" aria-valuenow="0"
                         aria-valuemax="100" style="width: 0%">
                    </div>
                </div>
                <div class="form-group">
                    <input id="batchUploadBtn" type="submit" name="submit" class="btn btn-success" value="上传"/>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script>
    var oneClick = true;
    $("#newDir").click(function () {
        if(oneClick){
            oneClick = false;
            var files = $("#files");
            var content = "<div class=\"file-box\">\n" +
                "<div class=\"file\"name=\"true\">\n" +
                "<span class=\"top-corner\" style=\"display: none;\">" +
                "<div class=\"icheckbox_square-green\" style=\"position: relative;\">" +
                "<input type=\"checkbox\" value=\"\" name=\"CheckBox\" style=\"position: absolute; opacity: 0;\">" +
                "<ins class=\"iCheck-helper\" style=\"position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;\"></ins>" +
                "</div>" +
                "</span>"  +
                "<div class=\"image\">\n" +
                "<a href=\"#\"> <img alt=\"image\" class=\"img-responsive\" src=\'img/blog/folder-yellow.jpg\'> </a>\n" +
                "</div>\n" +
                "<div class=\"file-name title\">\n" +
                    "<div>" +
                        "<input type=\"text\" style=\"border:1px solid #1C84C6;border-radius:5px;width:60%\" value=\"新建文件夹\">" +
                        "<input type=\"button\" class=\"btn btn-success btn-outline btn-xs\" value=\"创建\" onclick=\"saveNewDir(this)\">" +
                        "<input type=\"button\" class=\"btn btn-success btn-outline btn-xs\" value=\"取消\" onclick=\"cancelNewDir(this)\"></div>"+
                "</div>\n" +
                "</div>\n" +
                "</div>";
            files.prepend(content);
        }
    })
    function saveNewDir(it){
        oneClick = true;
        if(oneClick){
            var name = $(it).prev().val();
            var path = $("#path").text();
            var json = {fileName: name,parentDirPath:path};
            console.info(json);
            $.ajax({
                url: "fileInfo/createNewDir",
                type: "post",
                data: json,
                success: function (result) {
                    var obj = JSON.parse(result);
                    console.info(obj);
                    console.info(obj.code);
                    if (obj.code == "success") {
                        var itsPP= $(it).parent().parent();
                        $(it).parent().remove();
                        console.info(obj.fileInfo);
                        var date = new Date(obj.fileInfo.fileCreateDate);
                        var content = "<a href=\"fileInfo/queryByPath?path=" + obj.fileInfo.filePath + "\">\n" + obj.fileInfo.fileName +
                            "<br/><small>\n" + date.getFullYear() + "-" + date.getMonth() + "-" + date.getDay() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() +
                            "</small></a>\n";
                        itsPP.append(content);
                        success(obj.msg);
                        setTimeout(function(){
                            location = location;
                        },1500);
                    }
                    if (obj.code == "error") {
                        success("创建失败！"+obj.msg);
                        $(it).parent().parent().parent().parent().empty();
                    }
                },
                error: function () {
                }
            });
        }
    }
    function cancelNewDir(it){
        oneClick = true;
        $(it).parent().parent().parent().parent().empty();
    }
    /**/

    $(function () {
        $('.file').find("span:first").hide();
    })
    $(".file").hover(
        function () {
            if ($(this).attr("name") == "true") {
                $(this).addClass("selStyle");
                $(this).find("span:first").show();
            }
        },
        function () {
            if ($(this).attr("name") == "true") {
                $(this).removeClass("selStyle");
                $(this).find("span:first").hide();
            }
        }
    );
    /*$('.file').find("span:first").click(function () {
        $(this).parent().attr("name","false");
    })*/
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-green'
    });
    enableBatchBtn();
    //全选、反选
    $('#selectAll').on('ifChecked', function () {
        $('input').iCheck('check');
        $('.file').attr("name", "false");
        $('.file').addClass("selStyle");
        $('.file').find("span:first").show();
        enableBatchBtn();
    });
    $('#selectAll').on('ifUnchecked', function () {
        $('input').iCheck('uncheck');
        $('.file').attr("name", "true");
        $('.file').removeClass("selStyle");
        $('.file').find("span:first").hide();
        enableBatchBtn();
    });
    $('.file').find("span:first").find("input").on('ifUnchecked', function () {
        console.info("==true");
        $(this).parent().parent().parent().attr("name", "true");
    });
    $('.file').find("span:first").find("input").on('ifChecked', function () {
        //console.info($((this)));
        console.info("====false");
        $(this).parent().parent().parent().attr("name", "false");
    });
    $('span div.icheckbox_square-green ins').click(function () {
        enableBatchBtn();
    });

    function enableBatchBtn() {

        if ($('span div.icheckbox_square-green.checked').size() < 1) {
            console.info("0");
            $('#selectAll').iCheck('uncheck');
            $("#batchDelBtn").attr("disabled", true);
        } else {
            console.info("1");
            //达到全部改为全选
            //$('#selectAll').iCheck('check');
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
                console.info("len==" + len);
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
                console.info("id==" + id);
            }
        }
        var delId = ids.join(",");
        console.info("de==" + delId);
        $.ajax({
            url: "fileInfo/batchDelFile",
            type: "post",
            data: "delId=" + delId,
            success: function (result) {
                for (var i = 0; i < cks.length; i++) {
                    if (cks[i].checked) {
                        $(cks[i]).parent().parent().parent().parent().remove();
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
    $(function () {
        // 批量导入按钮
        $("#batchImportBtn").click(function () {
            //$('#batchImportModal').modal('show');
        });
        var base = $("#batchImportBtn").val().trim();
        // 上传按钮
        $("#batchUploadBtn").attr('disabled', true);
        // 上传文件按钮点击的时候
        $("#batchUploadBtn").click(function () {
            // 进度条归零
            $("#progressBar").width("0%");
            // 上传按钮禁用
            $(this).attr('disabled', true);
            // 进度条显示
            $("#progressBar").parent().show();
            $("#progressBar").parent().addClass("active");
            // 上传文件
            UpladFile();
        });

        // 文件修改时
        $("#batchFile").change(function () {
            $("#batchUploadBtn").val("上传");
            $("#progressBar").width("0%");
            var file = $(this).prop('files');
            if (file.length != 0) {
                $("#batchUploadBtn").attr('disabled', false);
            }

        });

        function UpladFile() {
            var fileObj = $("#batchFile").get(0).files[0]; // js 获取文件对象
            //console.info("上传的文件：" + fileObj);
            var path = $("#path").text();
            var url = base + "/fileInfo/upload?uploadPathDir=" + path; // 接收上传文件的后台地址
            var form = new FormData();// FormData 对象
            // form.append("author", "hooyes"); // 可以增加表单数据
            form.append("file", fileObj); // 文件对象
            var xhr = new XMLHttpRequest();// XMLHttpRequest 对象
            xhr.open("post", url, true);
            xhr.onload = function (result) {
                console.info(result);
                //上传进度条操作显示
                setTimeout(function(){
                    //$('#batchImportModal').modal('hide');
                     $("#batchUploadBtn").attr('disabled', false);
                     $("#batchUploadBtn").val("上传");
                     $("#progressBar").parent().removeClass("active");
                     $("#progressBar").parent().hide();
                },1500);
                //$('#myModal').modal('hide');

                var obj = JSON.parse(xhr.responseText);
                //console.info(obj);
                if(obj.code=="error"){//错误时提示
                    success(obj.msg);
                    return false;
                }

                var files = $("#files");
                var date = new Date(obj.fileInfo.fileCreateDate);
                var content = "<div class=\"file-box\">\n" +
                    "<div class=\"file\"name=\"true\">\n" +
                    "<span class=\"top-corner\" style=\"display: none;\">" +
                    "<div class=\"icheckbox_square-green\" style=\"position: relative;\">" +
                    "<input type=\"checkbox\" value=\""+obj.fileInfo.fileId+"\" name=\"CheckBox\" style=\"position: absolute; opacity: 0;\">" +
                    "<ins class=\"iCheck-helper\" style=\"position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;\"></ins>" +
                    "</div>" +
                    "</span>"  +
                    "<div class=\"image\">\n" +
                    "<a href=\"#\"> <img alt=\"image\" class=\"img-responsive\" src=\'" + obj.fileInfo.fileIconUrl + "\'> </a>\n" +
                    "</div>\n" +
                    "<div class=\"file-name title\">\n" +
                    "<a href=\"fileInfo/queryByPath?path=" + obj.fileInfo.filePath + "\">\n" + obj.fileInfo.fileName + obj.fileInfo.fileExt +
                    "<br/><small>\n" + date.getFullYear() + "-" + date.getMonth() + "-" + date.getDay() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() +
                    "</small></a>\n" +
                    "</div>\n" +
                    "</div>\n" +
                    "</div>";
                files.append(content);
                success("上传完成");
               /* setTimeout(function(){//用来解决删除未来元素问题
                    $('#batchImportModal').modal('hide');
                },1500)*/
            };
            xhr.upload.addEventListener("progress", progressFunction, false);
            xhr.send(form);
        }

        $('#batchImportModal').on('hide.bs.modal', function () {
            location = location;//用来解决删除未来元素问题
        })

        function progressFunction(evt) {
            var progressBar = $("#progressBar");
            if (evt.lengthComputable) {
                var completePercent = Math.round(evt.loaded / evt.total * 100) + "%";
                progressBar.width(completePercent);
                $("#batchUploadBtn").val("正在上传 " + completePercent);
            }
        }

    });
    $(document).ready(function () {

        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
    });
    //var boolean=true;//定义一个全局变量
    /*$(".file").on("mouseover mouseout",function(event){
        var $target = $(event.target);
        if(event.type == "mouseover"){
            console.info($target.attr("name"));
            if ($target.attr("name") == "true") {
                $target.addClass("selStyle");
                $target.find("span:first").show();
            }
        }else if(event.type == "mouseout"){   //鼠标离开
            if ($target.attr("name") == "true") {
                $target.removeClass("selStyle");
                $target.find("span:first").hide();
            }
        }
    })*/
    /*var filefile;
    var $uploadFile = $("#uploadFile");
    if (window.FileReader) {
        $uploadFile.change(function () {
            var fileReader = new FileReader(),
                files = this.files,
                file;

            if (!files.length) {//只要不是0就继续，是0退出
                return;
            }

            file = files[0];
            filefile = files[0];
            //readAsBinaryString
            //readAsDataURL方法会使用base-64进行编码，编码的资料由data字串开始，后面跟随的是MIME type，然后再加上base64字串，逗号之后就是编码过的图像文件的内容。
            fileReader.readAsDataURL(file);//将文件以Data URL形式读入页面
            fileReader.onload = function () {//文件读取成功完成时触发
                console.info("file"+file);
                //console.info(filefile);
                var path = $("#path").text();
                var formData = new FormData();
                formData.append("file", file);
                $.ajax({
                    url: "fileInfo/upload?path="+path,
                    type: "post",
                    data: formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,//如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
                    success: function (result) {
                        console.info(result);
                        var files = $("#files");
                        var obj = JSON.parse(result);
                        console.info(obj.fileIconUrl);
                        var date = new Date(obj.fileCreateDate);
                        var content = "<div class=\"file-box\">\n" +
                            "<div class=\"file\">\n" +
                            "    <span class=\"corner\"></span>\n" +
                            "    <div class=\"image\">\n" +
                            "        <a href=\"#\"> <img alt=\"image\" class=\"img-responsive\" src=\'"+obj.fileIconUrl+"\'> </a>\n" +
                            "    </div>\n" +
                            "    <div class=\"file-name\">\n" +
                            "        <a href=\"fileInfo/queryByPath?path="+obj.filePath+"\">\n" +obj.fileName+obj.fileExt+
                            "            <br/><small>\n"+date.getFullYear()+"-"+date.getMonth()+"-"+date.getDay()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+
                            "        </small></a>\n" +
                            "    </div>\n" +
                            "</div>\n" +
                            "                                    </div>";
                        //console.info(content);
                        files.append(content);
                    },
                    error: function () {
                        alert("error");
                    }
                });
            };
        });
    } else {
        $inputImage.addClass("hide");
    }*/

</script>
</body>

</html>