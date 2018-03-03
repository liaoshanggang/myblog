package com.blog.controller;

import com.blog.service.IArticleService;
import com.blog.service.ICollectService;
import com.blog.vo.Article;
import com.blog.vo.BlogUsers;
import com.blog.vo.Collect;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/collect")
public class CollectController {
    static Logger logger = Logger.getLogger(CollectController.class);
    @Autowired
    private HttpServletRequest request;
    @Resource
    ICollectService iCollectService;
    @Resource
    IArticleService iArticleService;

    @RequestMapping("/add")
    public @ResponseBody
    String collectArticle(Collect collect, Article a, HttpSession session) {
        BlogUsers logUser = (BlogUsers) session.getAttribute("logUser");
        if (logUser != null) {
            String header_referer = request.getHeader("Referer");
            collect.setLinkUrl(header_referer);
            Article a2 = iArticleService.selectArticleById(a);
            collect.setColtTitle(a2.getArtiTitle());
            collect.setColtUserId(logUser.getUserId());
            collect.setColtDescription("文章收藏");
            if(!iCollectService.insertCollect(collect)){
                return "success";
            }
            //如果第二次插入的
            return "exit";
        }
        return "error";
    }
}
