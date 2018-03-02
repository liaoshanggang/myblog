package com.blog.service.impl;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import com.blog.service.IVisitorService;
import com.blog.vo.Visitor;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.util.SystemOutLogger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.service.IArticleService;
import com.blog.vo.Article;
import com.blog.vo.Page;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestArticleServiceImpl {
    static Logger logger = Logger.getLogger(TestArticleServiceImpl.class);
    @Resource
    IArticleService ias;
    @Resource
    IVisitorService ivs;

    @Test
    public void test(){
        int i = 2;
        String s = Integer.toString(i);
        System.out.println(s);
        logger.info(s);
    }

    @Test
    public void testAddVisitor() {
        String ip = "192.168.1.3";
        Article article = new Article();
        article.setArtiId(20);

        Visitor v = new Visitor();
        v.setVisitorIp(ip);
        v.setArtiId(article.getArtiId());
        List<Visitor> visitors = ivs.selectVisitorByAid(v);
        if (visitors.size() < 1) {
            ivs.addVisitor(v);
        } else {
            boolean flag = false;
            for (Visitor v2 : visitors) {
                if (ip.equals(v2.getVisitorIp())) {//如果存在
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                ivs.addVisitor(v);
            }
        }
        Integer pageView = ivs.countPageViewByAid(v);
        article.setArtiPageView(pageView);
        ias.updateArticleById(article);
        Article article1 = ias.selectArticleById(article);
    }

    @Test
    public void testUpdateArticleById() {
        Article article = new Article();
		/*article.setArtiCatgId(2);
		article.setArtiTitle("可以了更新1");
		article.setArtiContent("跟新啦啦啦");
		article.setArtiId(5);
		ias.updateArticleById(article);*/
        article.setArtiId(20);
        Article article1 = ias.selectArticleById(article);
        logger.info("....." + article1);
    }

    @Test
    public void testSelectArticleById() {
        Article article = new Article();
        article.setArtiId(15);
        Article article2 = ias.selectArticleById(article);
        logger.info(article2.getArtiTitle() + "" + article2.getArtiContent());
    }

    @Test
    public void testDeleteArticleById() {
        Article article = new Article();
        article.setArtiId(3);
        ias.deleteArticleById(article);
    }

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

        Article article = new Article();
        //article.setArtiTitle("标题");
        //article.setArtiContent("笃行天下");
        //article.setArtiCatgId(1);
        //article.setBeginDate("2018-1-20 18:26:43");
        //article.setEndDate("2018-2-28 18:26:43");
        Page<Article> page = new Page<Article>(article);
        page.setKeyWords("你不做过的事");//后来居上 你不做过的事
        page.setPageSize(5);
        page.setPageNo(1);

        int totalRow = ias.countForSelective(page);
        page.setTotalRow(totalRow);
        logger.info("总记录：" + totalRow);
        logger.info("页数" + page);

        List<Article> list = ias.selectSelective(page);
        for (Article article2 : list) {
            logger.info(article2);
            logger.info(article2.getCategory().getCatgName());
        }

    }

}
