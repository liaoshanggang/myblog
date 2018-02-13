<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/13
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="social-body">
    <form action="" name="a1" id="replyForm"><%--javascript:void(0);--%>
        <input type="hidden" class="form-control" name=""
               value=""/>
        <textarea class="form-control" name="replyContent" placeholder="写点什么..."
                  required></textarea>
        <button id="addReply" class="form-control btn btn-white"
                style="background-color: #F8F8F8;">提交评论<%=new Date()%>
        </button>
    </form>
</div>
<script>
    $('#addReply').click(function () {
        alert("sdsf");
        var data = $('#replyForm').serialize();
        console.log("序列化" + data);
        $.ajax({
            url: "reply/add",
            type: "post",
            data: data,
            dataType: "json",
            success: function (result) {
                //$(".show").empty();
                console.info(result);
            },
            error: function () {
                alert("error");
            }
        });
    });
</script>