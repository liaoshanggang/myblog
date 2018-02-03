package com.blog.controller;

import com.blog.service.IArtiCategoryService;
import com.blog.service.IArticleService;
import com.blog.vo.ArtiCategory;
import com.blog.vo.Article;
import com.blog.vo.Page;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/category")
public class ArtiCategoryController {
	static Logger logger = Logger.getLogger(ArtiCategoryController.class);
	@Resource
	IArtiCategoryService iArtiCategoryService;
	@Resource
	IArticleService iArticleService;
	@RequestMapping(value = { "/add" }, method = { RequestMethod.POST ,RequestMethod.GET})
	public String addArtiCategory(ArtiCategory category, ModelMap modelMap,
								  HttpSession session) {
		iArtiCategoryService.addArtiCategory(category);
		return "redirect:/category/query";
	}

	@RequestMapping("/query")
	public String queryArticle(ArtiCategory category, Integer pageNo, ModelMap modelMap, HttpSession session){
		logger.info(category);
		Page<ArtiCategory> page = (Page<ArtiCategory>) session.getAttribute("categoryPage");
		if(page==null || pageNo== null){
			page = new Page<ArtiCategory>(category);
			page.setPageNo(1);
			page.setPageSize(10);
			int totalRow = iArtiCategoryService.countForSelective(page);
			page.setTotalRow(totalRow);
		}else {
			page.setPageNo(pageNo);
		}

		List<ArtiCategory> list = iArtiCategoryService.selectSelective(page);
		modelMap.addAttribute("categoryList", list);

		session.setAttribute("categoryPage", page);
		return "/manage_category";
	}

	@RequestMapping("/modify")
	public @ResponseBody
	String updateArtiCategoryById(ArtiCategory category) {
		logger.info(category);
		iArtiCategoryService.updateArtiCategoryById(category);
		//如果第二次插入的
		return "success";
	}

	@RequestMapping("/del")
	public @ResponseBody
	String deleteArtiCategoryById(ArtiCategory category) {
		logger.info(category);
		Article article = new Article();
		article.setArtiCatgId(category.getCatgId());
		article.setArtiId(1);
		iArticleService.updateById(article);
		iArtiCategoryService.deleteArtiCategoryById(category);
		//如果第二次插入的
		return "success";
	}

}
