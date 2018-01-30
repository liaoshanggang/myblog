package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.service.IArticleService;
import com.blog.vo.Article;
import com.blog.vo.Page;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class TestArticleServiceImpl {
	static Logger logger = Logger.getLogger(TestArticleServiceImpl.class);
	@Resource
	IArticleService ias;
	@Test
	public void testAddArticle() {
		String artiTitle = "标题11";
		Integer artiCatgId = 1;
		Integer artiUserId = 1;
		/*Integer artiComtNumber = 1;
		Integer artiPageView = 1;*/
		String artiContent = "内容11";
		Article article = new Article(null, artiTitle, artiCatgId, artiUserId, null, null, null, artiContent);
		ias.addArticle(article);
	}
	
	
	@Test
	public void testSelectSelective() {
		
		Article article =  new Article();
		article.setArtiTitle("标题");
		article.setArtiContent("内容");
		article.setArtiCatgId(1);
		article.setBeginDate("2018-1-20 18:26:43");
		article.setEndDate("2018-2-28 18:26:43");
		Page<Article> page = new Page<Article>(article);
		
		page.setPageSize(5);
		page.setPageNo(1);
		
		int totalRow = ias.countForSelective(page);
		page.setTotalRow(totalRow);
		logger.info("总记录："+totalRow);
		logger.info("页数"+page);
		
		List<Article> list = ias.selectSelective(page);
		for (Article article2 : list) {
			logger.info(article2);
			logger.info(article2.getCategory().getCatgName());
		}
		
	}

}
