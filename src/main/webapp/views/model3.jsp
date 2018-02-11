<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/9
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>--%>
<!-- 修改用户信息模态框 -->
<link href="css/plugins/cropper/cropper.min.css" rel="stylesheet">
<style type="text/css">
    .cropper-view-box,
    .cropper-face {
        border-radius: 50%;
    }
</style>
<div class="modal inmodal fade" id="uptPic" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">修改头像</h4>
            </div>
            <%--<c:if test="${not empty user}">&lt;%&ndash;之前userCookie空情况&ndash;%&gt;--%>
            <form id="uptMyheadForm" action="" method="post">
                <div class="modal-body" id="updateMyhead">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="image-crop" style="width: 404px;height: 404px;">
                                <img src="../${user.userImageUrl}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4>预览图像</h4>
                            <div class="img-preview img-preview-sm"></div>
                            <%--style="width: 95.99px;height: 95.99px;"--%>
                            <p>
                                您可以上传新的图像到裁剪容器，并轻松下载新的裁剪图像。
                            </p>
                            <div class="btn-group">
                                <label title="上传新图像" for="inputImage" class="btn btn-primary">
                                    <input type="file" accept="image/*" name="file" id="inputImage" class="hide">
                                    更换头像
                                </label>
                                <label title="Donload image" id="download" class="btn btn-primary">下载</label>
                            </div>
                            <h4>其他方法</h4>
                            <div class="btn-group">
                                <button class="btn btn-white" id="zoomIn" type="button">放大</button>
                                <button class="btn btn-white" id="zoomOut" type="button">缩小</button>
                                <button class="btn btn-white" id="rotateLeft" type="button">向左旋转</button>
                                <button class="btn btn-white" id="rotateRight" type="button">右旋</button>
                                <button class="btn btn-warning" id="setDrag" type="button">新修剪</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <input id="uptMyHead" type="button" class="btn btn-primary" value="确认修改">
                </div>
                <%-- </c:if>--%>
            </form>
        </div>
    </div>
</div>
<!-- Image cropper -->
<script src="js/plugins/cropper/cropper.min.js"></script>
<script>
    //$.fn.cropper方法来初始化该图片剪裁插件。
    var $image = $(".image-crop > img");
    $($image).cropper({
        //viewMode : 3,
        aspectRatio: 1,//类型：Number，默认值NaN。设置剪裁容器的比例。
        preview: ".img-preview",//类型：String(jQuery选择器)，默认值”。添加额外的元素（容器）的预览。
        done: function (data) {//类型：Function，默认值null。当改变剪裁容器或图片时的事件函数。
            // Output the result data for cropping image.
        }
    });
    var filefile;
    var $inputImage = $("#inputImage");
    if (window.FileReader) {
        $inputImage.change(function () {
            var fileReader = new FileReader(),
                files = this.files,
                file;

            if (!files.length) {//只要不是0就继续，是0退出
                return;
            }

            file = files[0];
            filefile = files[0];
            if (/^image\/\w+$/.test(file.type)) {
                //readAsBinaryString
                //readAsDataURL方法会使用base-64进行编码，编码的资料由data字串开始，后面跟随的是MIME type，然后再加上base64字串，逗号之后就是编码过的图像文件的内容。
                fileReader.readAsDataURL(file);//将文件以Data URL形式读入页面
                fileReader.onload = function () {//文件读取成功完成时触发
                    $inputImage.val("");
                    // 通过 reader.result 来访问生成的 DataURL
                    $image.cropper("reset", true).cropper("replace", this.result);
                };
            } else {
                /*showMessage("Please choose an image file.");*/
                alert("看清楚，这个需要图片！");
            }
        });
    } else {
        $inputImage.addClass("hide");
    }
    $("#uptMyHead").click(function () {
        var file = filefile;
        if (file == null) {
            alert("请选择文件");
            return;
        }
        //原名称 带后缀
        var originalFileName = file.name;
        //获取文件类型名称
        var filetype = originalFileName.substring(originalFileName.lastIndexOf('.'), originalFileName.length);
        //计算文件大小
        var fileSize = 0;
        // //如果文件大小大于1024字节X1024字节，则显示文件大小单位为MB，否则为KB
        if (file.size > 1024 * 1024) {
            fileSize = Math.round(file.size * 100 / (1024 * 1024)) / 100;

            if (fileSize > 10) {
                alert('错误，文件超过10MB，禁止上传！');
                return;
            }
            fileSize = fileSize.toString() + 'MB';
        }
        else {
            fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
        }
        console.info("文件类型名称" + filetype + "文件大小" + fileSize);
        var data = $image.cropper("getDataURL");
        file = new File([convertBase64UrlToBlob(data)], originalFileName);
        var formData = new FormData();
        formData.append("file", file);  // 文件对象
        //formData.append('file', $('#inputImage')[0].files[0]);
        //var file = $('input[name="file"][type="file"]').prop('files')[0];
        console.info(formData);
        $.ajax({
            url: "file/upload",
            type: "post",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,//如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
            success: function (result) {
                $('#uptPic').modal('hide');
                //alert(result);
                $("#myHead").attr("src", "../" + result);
            },
            error: function () {
                alert("error");
            }
        });
    });

    /**
     * 将以base64的图片url数据转换为Blob
     * @param urlData
     *            用url方式表示的base64图片数据
     */
    function convertBase64UrlToBlob(urlData) {

        var bytes = window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte

        //处理异常,将ascii码小于0的转换为大于0
        var ab = new ArrayBuffer(bytes.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }

        return new Blob([ab], {type: 'image/jpg'});
    }

    $("#download").click(function () {
        window.open($image.cropper("getDataURL"));
    });

    $("#zoomIn").click(function () {
        $image.cropper("zoom", 0.1);
    });

    $("#zoomOut").click(function () {
        $image.cropper("zoom", -0.1);
    });

    $("#rotateLeft").click(function () {
        $image.cropper("rotate", 45);
    });

    $("#rotateRight").click(function () {
        $image.cropper("rotate", -45);
    });

    $("#setDrag").click(function () {
        $image.cropper("setDragMode", "crop");
    });

</script>