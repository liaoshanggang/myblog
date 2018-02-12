package com.blog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.blog.service.ICommentService;
import com.blog.vo.Comment;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
    @Autowired
    private HttpServletRequest request;

    @Resource
    IArtiCategoryService iArtiCategoryService;
    @Resource
    IArticleService iArticleService;
    @Resource
    ICommentService iCommentService;

    @RequestMapping("/loadCategory")
    public @ResponseBody
    List<ArtiCategory> loadCategory(ModelMap modelMap) {
        List<ArtiCategory> artiCategory = iArtiCategoryService.selectAllCategory();
//		for (ArtiCategory artiCategory2 : artiCategory) {
//			
//			logger.info(artiCategory2.getCatgId()+"=="+artiCategory2.getCatgName());
//		}
        modelMap.addAttribute("artiCategory", artiCategory);
        return artiCategory;
    }

    @RequestMapping("/save")
    public @ResponseBody
    String saveArticle(Article article) {
        //logger.info(article.getArtiTitle()+"=="+article.getArtiCatgId()+"=="+article.getArtiContent());
        article.setArtiUserId(1);
        iArticleService.addArticle(article);
        //如果第二次插入的
        return "success";
    }

    @RequestMapping("/delete")
    public String delRadio(Article article) {
        iArticleService.deleteArticleById(article);
        return "forward:/article/query";
    }
	
	/*@RequestMapping("/queryById")
	public String queryById(Article article,ModelMap modelMap,HttpSession session){
		logger.info(article);
		Article article2 = iArticleService.selectArticleById(article);
		modelMap.addAttribute("article", article2);
		return "/article_detail";
	}*/

    @RequestMapping("/query")
    public String queryArticle(Article article, Integer pageNo, ModelMap modelMap, HttpSession session) {
        logger.info(article);
        Page<Article> page = (Page<Article>) session.getAttribute("artiPage");
        if (page == null || pageNo == null) {
            page = new Page<Article>(article);
            page.setPageNo(1);
            page.setPageSize(10);
            int totalRow = iArticleService.countForSelective(page);
            page.setTotalRow(totalRow);
        } else {
            page.setPageNo(pageNo);
        }

        List<Article> list = iArticleService.selectSelective(page);
        modelMap.addAttribute("articleList", list);

        session.setAttribute("artiPage", page);
        return "/manage_article";
    }

    @RequestMapping("/queryById/{artiId}/{moudule}")
    public String queryById(@PathVariable Integer artiId, @PathVariable String moudule,
                            Comment comment, Integer pageNo,ModelMap modelMap, HttpSession session) {
        Article article = new Article();
        article.setArtiId(artiId);
        Article article1 = iArticleService.selectArticleById(article);
        modelMap.addAttribute("article", article1);
        logger.info(article1);
        if (moudule.equals("modify")) {
            logger.info(moudule);
            return "modify_article";
        } else {//法一，这个，法二，转发到另一个控制器，把文章id带上
            comment.setComtArtiId(artiId);
            Page<Comment> page = (Page<Comment>) session.getAttribute("commentPage");
            if(page==null || pageNo== null){
                page = new Page<Comment>(comment);
                page.setPageNo(1);
                page.setPageSize(2);
                int totalRow = iCommentService.countForSelective(page);
                page.setTotalRow(totalRow);
            }else {
                page.setPageNo(pageNo);
            }
            List<Comment> list = iCommentService.selectSelective(page);
            modelMap.addAttribute("commentList", list);
            session.setAttribute("commentPage", page);
            return "/article_detail";
        }
    }

    @RequestMapping("/modify")
    public @ResponseBody
    String modifyArticle(Article article) {
        //logger.info(article.getArtiTitle()+"=="+article.getArtiCatgId()+"=="+article.getArtiContent());
        //article.setArtiUserId(1);
        logger.info(article);
        iArticleService.updateArticleById(article);
        //如果第二次插入的
        return "success";
    }
}
