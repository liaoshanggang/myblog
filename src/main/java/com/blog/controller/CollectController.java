package com.blog.controller;

import com.blog.service.IArticleService;
import com.blog.service.ICollectService;
import com.blog.vo.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/query")
    public @ResponseBody
    List<Collect> queryArticle(Collect collect, Integer pageNo, ModelMap modelMap, HttpSession session) {
        logger.info(collect);
        Page<Collect> page = (Page<Collect>) session.getAttribute("collectPage");
        if (page == null || pageNo == null) {
            page = new Page<Collect>(collect);
            page.setPageNo(1);
            page.setPageSize(10);
            int totalRow = iCollectService.countForSelective(page);
            page.setTotalRow(totalRow);
        } else {
            page.setPageNo(pageNo);
        }

        List<Collect> collectList = iCollectService.selectSelective(page);
        modelMap.addAttribute("collectList", collectList);

        session.setAttribute("collectPage", page);
        return collectList;
    }

    @RequestMapping("/del")
    public @ResponseBody
    String deleteCommentById(Collect collect) {
        logger.info(collect);
        iCollectService.deleteCollectById(collect);
        //如果第二次插入的
        return "success";
    }

    @RequestMapping("/selectCollectById/{coltId}")
    public String selectUserById(@PathVariable String coltId, ModelMap modelMap) {
        int id = Integer.valueOf(coltId);// java.lang.NumberFormatException: For input string: "undefined"
        System.out.println(id);
        Collect collect = iCollectService.selectCollectById(id);

        modelMap.addAttribute("collect", collect);
        return "uptCollect";
    }

    @RequestMapping("/updateCollect")
    public @ResponseBody
    Map<String, Object> updateCollect(Collect collect) {
        //判断用户名不能相同
        this.iCollectService.updateCollect(collect);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("coltTitle", collect.getColtTitle());
        map.put("linkUrl", collect.getLinkUrl());
        return map;
    }
}
