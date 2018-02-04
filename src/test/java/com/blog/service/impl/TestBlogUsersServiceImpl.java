package com.blog.service.impl;

import com.blog.service.IBlogUsersService;
import com.blog.vo.Article;
import com.blog.vo.BlogUsers;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class TestBlogUsersServiceImpl {
	static Logger logger = Logger.getLogger(TestBlogUsersServiceImpl.class);
	@Resource
	IBlogUsersService ibus;

	@Test
	public void testAddArticle() {
		BlogUsers user = new BlogUsers();
		Random random = new Random();
		Integer seq = random.nextInt(200);
		user.setUserName("张三"+seq);
		user.setUserEmail(seq+"123456@qq.com");
		user.setUserPassword("123456"+seq);
		user.setUserType(2);
		ibus.addBlogUser(user);
	}

}
