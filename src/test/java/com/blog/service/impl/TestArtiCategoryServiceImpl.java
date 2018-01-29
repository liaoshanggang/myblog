package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.service.IArtiCategoryService;
import com.blog.vo.ArtiCategory;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class TestArtiCategoryServiceImpl {
	static Logger logger = Logger.getLogger(TestArtiCategoryServiceImpl.class);
	@Resource
	IArtiCategoryService iacs;
	@Test
	public void testSelectAllCategory() {
		List<ArtiCategory> selectAllCategory = iacs.selectAllCategory();
		for (ArtiCategory artiCategory : selectAllCategory) {
			logger.info(artiCategory.getCatgId()+"==="+artiCategory.getCatgName());
		}
	}

}
