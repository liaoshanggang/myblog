package com.blog.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.service.IArtiCategoryService;
import com.blog.service.IArticleService;
import com.blog.vo.ArtiCategory;
import com.blog.vo.Article;

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
		return "success";
	}

}
