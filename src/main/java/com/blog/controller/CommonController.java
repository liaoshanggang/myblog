package com.blog.controller;

import com.blog.service.IArticleService;
import com.blog.vo.Article;
import com.blog.vo.Page;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/")
public class CommonController {
	static Logger logger = Logger.getLogger(CommonController.class);
	@Resource
	IArticleService iArticleService;

	@RequestMapping(value = {"/showHome/{moudule}"}, method = {RequestMethod.POST, RequestMethod.GET})
	public String queryArticle(Article article, @PathVariable(value = "moudule",required = false) String moudule, Integer pageNo, String keyWords, ModelMap modelMap, HttpSession session){
		logger.info(article);
		Page<Article> page = (Page<Article>) session.getAttribute("artiPage");
		if(page==null || pageNo== null){
			page = new Page<Article>(article);
			if(keyWords!=null){
				page.setKeyWords(keyWords);
			}
			page.setPageNo(1);
			page.setPageSize(10);
			int totalRow = iArticleService.countForSelective(page);
			page.setTotalRow(totalRow);
		}else {
			page.setPageNo(pageNo);
		}
		List<Article> list = iArticleService.selectSelective(page);
		for (Article a:list) {
			String str = StripHT(a.getArtiContent());
			if(str.length()>200){
				a.setArtiContent(str.substring(0,180));
			}else{
				a.setArtiContent(str);
			}
		}
		modelMap.addAttribute("articleList", list);

		session.setAttribute("artiPage", page);
		if("search".equals(moudule)){
			return "search";
		}
		return "../home";
	}
	//从html中提取纯文本
	public static String StripHT(String strHtml) {
		String txtcontent = strHtml.replaceAll("</?[^>]+>", ""); //剔出<html>的标签
		txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");//去除字符串中的空格,回车,换行符,制表符
		return txtcontent;
	}
	@RequestMapping("showFile")
	public String showFile(ModelMap modelMap,HttpSession session){
		return "upload/upload";
	}
}
