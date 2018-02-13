package com.blog.controller;

import com.blog.service.IReplyService;
import com.blog.vo.BlogUsers;
import com.blog.vo.Reply;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/reply")
public class ReplyController {
    static Logger logger = Logger.getLogger(ReplyController.class);
    @Resource
    IReplyService iReplyService;

    @RequestMapping("/add")
    public @ResponseBody
    String saveArticle(Reply reply, HttpSession session) {
        BlogUsers logUser = (BlogUsers) session.getAttribute("logUser");
        if (logUser != null) {
            iReplyService.insertReply(reply);
            //如果第二次插入的
            return "success";
        }
        return "error";
    }
}
