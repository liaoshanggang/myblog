package com.blog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.service.IArtiCategoryService;
import com.blog.service.IArticleService;
import com.blog.vo.ArtiCategory;
import com.blog.vo.Article;
import com.blog.vo.Page;

@Controller
@RequestMapping("/article")
public class ArticleController {
	static Logger logger = Logger.getLogger(ArticleController.class);
	@Resource
	IArtiCategoryService iArtiCategoryService;
	@Resource
	IArticleService iArticleService;
	@RequestMapping("/loadCategory")
	public @ResponseBody List<ArtiCategory> loadCategory(ModelMap modelMap) {
		List<ArtiCategory> artiCategory = iArtiCategoryService.selectAllCategory();
//		for (ArtiCategory artiCategory2 : artiCategory) {
//			
//			logger.info(artiCategory2.getCatgId()+"=="+artiCategory2.getCatgName());
//		}
		modelMap.addAttribute("artiCategory", artiCategory);
		return artiCategory;
	}
	
	@RequestMapping("/save")
	public @ResponseBody String saveArticle(Article article) {
		//logger.info(article.getArtiTitle()+"=="+article.getArtiCatgId()+"=="+article.getArtiContent());
		article.setArtiUserId(1);
		iArticleService.addArticle(article);
		//如果第二次插入的
		return "success";
	}
	
	@RequestMapping("/query")
	public String selRadio(Article article,Integer pageNo,ModelMap modelMap,HttpSession session){
		logger.info(article);
		Page<Article> page = (Page<Article>) session.getAttribute("artiPage");
		if(page==null || pageNo== null){
			page = new Page<Article>(article);
			page.setPageNo(1);
			page.setPageSize(3);
			int totalRow = iArticleService.countForSelective(page);
			page.setTotalRow(totalRow);
		}else {
			page.setPageNo(pageNo);
		}

		List<Article> list = iArticleService.selectSelective(page);
		modelMap.addAttribute("articleList", list);

		session.setAttribute("artiPage", page);
		//iArticleService.selectSelective(page);
		//views/manage_article.jsp
		return "/manage_article";
	}
}
