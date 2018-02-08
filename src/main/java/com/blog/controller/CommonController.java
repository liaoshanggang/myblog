package com.blog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.service.IArticleService;
import com.blog.vo.Article;
import com.blog.vo.Page;


@Controller
@RequestMapping("/")
public class CommonController {
	static Logger logger = Logger.getLogger(CommonController.class);
	@Resource
	IArticleService iArticleService;
	
	@RequestMapping("showHome")
	public String queryArticle(Article article,Integer pageNo,ModelMap modelMap,HttpSession session){
		logger.info(article);
		Page<Article> page = (Page<Article>) session.getAttribute("artiPage");
		if(page==null || pageNo== null){
			page = new Page<Article>(article);
			page.setPageNo(1);
			page.setPageSize(10);
			int totalRow = iArticleService.countForSelective(page);
			page.setTotalRow(totalRow);
		}else {
			page.setPageNo(pageNo);
		}

		List<Article> list = iArticleService.selectSelective(page);
		modelMap.addAttribute("articleList", list);

		session.setAttribute("artiPage", page);
		return "../home";
	}
	@RequestMapping("showFile")
	public String showFile(ModelMap modelMap,HttpSession session){
		return "upload/upload";
	}
}
