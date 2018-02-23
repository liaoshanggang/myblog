package com.blog.controller;

import com.blog.service.IArticleService;
import com.blog.service.ICommentService;
import com.blog.service.IReplyService;
import com.blog.vo.*;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/comment")
public class CommentController {
    static Logger logger = Logger.getLogger(CommentController.class);
    @Resource
    ICommentService iCommentService;
    @Resource
    IReplyService irs;
    @Resource
    IArticleService ias;

    @RequestMapping("/add")
    public @ResponseBody
    String saveArticle(Comment comment, HttpSession session) {
        BlogUsers logUser = (BlogUsers) session.getAttribute("logUser");
        if (logUser != null) {
            comment.setComtUserId(logUser.getUserId());
            iCommentService.insertComment(comment);
            Article a = new Article();
            a.setArtiId(comment.getComtArtiId());
            ias.updateArtiComtNumber(a);
            //如果第二次插入的
            return "success";
        }
        return "error";
    }

    @RequestMapping("/query")
    public String queryComment(Comment comment, Integer pageNo, ModelMap modelMap, HttpSession session) {
        logger.info(comment);
        if(comment.getComtUserId()!=null){
            List<Reply> replies1 = new ArrayList<>();
            for (Reply r:replies1) {
                r.setReplyUserId(comment.getComtUserId());
            }
        }
        Page<Comment> page = (Page<Comment>) session.getAttribute("commentPage2");
        if (page == null || pageNo == null) {
            page = new Page<Comment>(comment);
            page.setPageNo(1);
            page.setPageSize(10);
            int totalRow = iCommentService.countForSelective(page);
            page.setTotalRow(totalRow);
        } else {
            page.setPageNo(pageNo);
        }

        List<Comment> list = iCommentService.selectSelective(page);
        modelMap.addAttribute("commentList2", list);

        session.setAttribute("commentPage2", page);
        return "/manage_comment";
    }
    @RequestMapping("/del")
    public @ResponseBody
    String deleteCommentById(Comment comment) {
        logger.info(comment);
        Reply r = new Reply();
        r.setReplyId(2);
        r.setReplyComtId(comment.getComtId());
        irs.updateReplyById(r);
        iCommentService.deleteCommentById(comment);
        //如果第二次插入的
        return "success";
    }
}
