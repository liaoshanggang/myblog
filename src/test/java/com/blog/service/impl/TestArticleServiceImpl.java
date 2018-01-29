package com.blog.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.service.IArticleService;
import com.blog.vo.Article;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class TestArticleServiceImpl {
	static Logger logger = Logger.getLogger(TestArticleServiceImpl.class);
	@Resource
	IArticleService ias;
	@Test
	public void testAddArticle() {
		String artiTitle = "标题";
		Integer artiCatgId = 1;
		Integer artiUserId = 1;
		/*Integer artiComtNumber = 1;
		Integer artiPageView = 1;*/
		String artiContent = "内容";
		Article article = new Article(null, artiTitle, artiCatgId, artiUserId, null, null, null, artiContent);
		ias.addArticle(article);
	}

}
