package com.blog.service.impl;

import com.blog.service.IArtiCategoryService;
import com.blog.service.IArticleService;
import com.blog.vo.ArtiCategory;
import com.blog.vo.Article;
import com.blog.vo.Page;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class TestArtiCategoryServiceImpl {
	static Logger logger = Logger.getLogger(TestArtiCategoryServiceImpl.class);
	@Resource
	IArtiCategoryService iacs;
    @Resource
    IArticleService iac;
    @Test
    public void testDeleteArtiCategoryById() {
        /*删除20的同时更新文章类别id*/
        ArtiCategory category = new ArtiCategory();
        category.setCatgId(15);
        Article article = new Article();
        article.setArtiId(1);
        article.setArtiCatgId(category.getCatgId());
        iac.updateById(article);
        iacs.deleteArtiCategoryById(category);
    }
    @Test
    public void testUpdateArtiCategoryById(){
        Integer catgId = 14;
        String catgName = "Python";
        Date catgTime = null;
        ArtiCategory category = new ArtiCategory(catgId,catgName,catgTime);
        iacs.updateArtiCategoryById(category);
    }

	@Test
	public void testSelectAllCategory() {
		List<ArtiCategory> selectAllCategory = iacs.selectAllCategory();
		for (ArtiCategory artiCategory : selectAllCategory) {
			logger.info(artiCategory.getCatgId()+"==="+artiCategory.getCatgName());
		}
	}
	@Test
	public void testAddArtiCategory() {
        Integer catgId = null;
        String catgName = "Python";
        Date catgTime = null;
        ArtiCategory category = new ArtiCategory(catgId,catgName,catgTime);
		iacs.addArtiCategory(category);
	}

    @Test
    public void testSelectSelective() {

        ArtiCategory category =  new ArtiCategory();
        category.setCatgName(null);
        category.setBeginDate("2018-1-20 18:26:43");
        category.setEndDate("2018-2-28 18:26:43");
        Page<ArtiCategory> page = new Page<ArtiCategory>(category);

        page.setPageSize(5);
        page.setPageNo(1);

        int totalRow = iacs.countForSelective(page);
        page.setTotalRow(totalRow);
        logger.info("总记录："+totalRow);
        logger.info("页数"+page);

        List<ArtiCategory> list = iacs.selectSelective(page);
        for (ArtiCategory category2 : list) {
            logger.info(category2.getCatgName());
        }

    }
}
