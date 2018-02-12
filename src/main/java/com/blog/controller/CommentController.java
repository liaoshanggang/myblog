package com.blog.controller;

import com.blog.service.ICommentService;
import com.blog.vo.Article;
import com.blog.vo.BlogUsers;
import com.blog.vo.Comment;
import com.blog.vo.Page;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/comment")
public class CommentController {
    static Logger logger = Logger.getLogger(CommentController.class);
    @Resource
    ICommentService iCommentService;

    @RequestMapping("/add")
    public @ResponseBody
    String saveArticle(Comment comment, HttpSession session) {
        BlogUsers logUser = (BlogUsers) session.getAttribute("logUser");
        if (logUser != null) {
            comment.setComtUserId(logUser.getUserId());
            iCommentService.insertComment(comment);
            //如果第二次插入的
            return "success";
        }
        return "error";
    }
}
