package com.blog.controller;

import com.blog.service.IArticleService;
import com.blog.service.IReplyService;
import com.blog.vo.Article;
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
    @Resource
    IArticleService ias;

    @RequestMapping("/add")
    public @ResponseBody
    String saveArticle(Reply reply, Article a, HttpSession session) {
        BlogUsers logUser = (BlogUsers) session.getAttribute("logUser");
        if (logUser != null) {
            reply.setReplyUserId(logUser.getUserId());
            iReplyService.insertReply(reply);
            ias.updateArtiComtNumber(a);
            //如果第二次插入的
            return "success";
        }
        return "error";
    }

    @RequestMapping("/modify")
    public @ResponseBody
    String modifyReply(Reply reply) {
        logger.info(reply);
        iReplyService.updateReplyById(reply);
        //如果第二次插入的
        return "success";
    }
/*
    @RequestMapping("/delete")
    public String delRadio(Reply reply) {
        iReplyService.deleteReplyById(reply);
        return "forward:/reply/query";
    }*/

    @RequestMapping("/del")
    public @ResponseBody
    String deleteReplyById(Reply reply, Article a) {
        iReplyService.deleteReplyById(reply);
        ias.updateArtiComtNumber2(a);
        //如果第二次插入的
        return "success";
    }
}
