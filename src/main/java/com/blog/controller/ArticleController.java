package com.blog.controller;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.blog.service.ICommentService;
import com.blog.vo.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.service.IArtiCategoryService;
import com.blog.service.IArticleService;

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

    @RequestMapping(value = {"/selectShowMore/{moudule}"}, method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    List<Article> selectShowMore(Article article,@PathVariable String moudule, Integer pageNo, ModelMap modelMap, HttpSession session) {
        logger.info(article);
        Page<Article> page = (Page<Article>) session.getAttribute("artiPage");
        if (page == null || pageNo == null) {
            page = new Page<Article>(article);
            page.setPageNo(1);
            /*if("archives".equals(moudule)){
                page.setPageSize(20);
            }else{
                page.setPageSize(10);
            }*/
            page.setPageSize(10);
            int totalRow = iArticleService.countForSelective(page);
            page.setTotalRow(totalRow);
        } else {
            page.setPageNo(pageNo);
        }
        List<Article> articleList = new ArrayList<>();
        if("archives".equals(moudule)){
            if(pageNo==1){
                List<Article> articleList1 = iArticleService.selectSelective(page);
                page.setPageNo(2);
                List<Article> articleList2 = iArticleService.selectSelective(page);
                //Java将两个list合并，只需要把list1和list2内容都添加都集合list中即可
                articleList.addAll(articleList1);
                articleList.addAll(articleList2);
            }else{
                articleList = iArticleService.selectSelective(page);
            }
        }else{
            articleList = iArticleService.selectSelective(page);
        }
        //List<Article> articleList = iArticleService.selectSelective(page);
        session.setAttribute("artiPage", page);
        /*try {
            Thread.sleep(5000);

        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }*/
        /*Timer timer = new Timer();
        TimerTask task = new TimerTask() {
            @Override
            public void run() {

            }
        };
        timer.schedule(task, 2000);*/
        return articleList;
    }

    @RequestMapping("/selectHot")
    public @ResponseBody
    List<Article> selectHotArticles(ModelMap modelMap) {
        List<Article> hotArticles = iArticleService.selectHotArticles();
        modelMap.addAttribute("hotArticles", hotArticles);
        return hotArticles;
    }

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
    public String delRadio(Article article,int pageNo,ModelMap modelMap) {
        iArticleService.deleteArticleById(article);
        modelMap.addAttribute("pageNo",pageNo);
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
                            Comment comment, Integer pageNo, ModelMap modelMap, HttpSession session) {
        Article article = new Article();
        article.setArtiId(artiId);

        String accessIp = getAccessIp();

        Article article1 = iArticleService.selectArticleById(article,accessIp);
        modelMap.addAttribute("article", article1);
        logger.info(article1);
        if (moudule.equals("modify")) {
            logger.info(moudule);
            return "modify_article";
        } else {//法一，这个，法二，转发到另一个控制器，把文章id带上
            /*comment.setComtArtiId(artiId);
            Page<Comment> page = (Page<Comment>) session.getAttribute("commentPage");
            if(page==null || pageNo== null){
                page = new Page<Comment>(comment);
                page.setPageNo(1);
                page.setPageSize(3);
                int totalRow = iCommentService.countForSelective(page);
                page.setTotalRow(totalRow);
            }else {
                page.setPageNo(pageNo);
            }
            List<Comment> list = iCommentService.selectSelective(page);
            modelMap.addAttribute("commentList", list);
            session.setAttribute("commentPage", page);*/
            //================================================================
            //list1每页的最后一条数
            List<Integer> curLastIndexs = getCurLastIndexs(artiId);
            //arr存储固定页的记录数
            int[] curPageSizes = getCurPageSizes(curLastIndexs);
            //================================================================
            //通过页数来查找对于页要显示的记录数
            if (pageNo == null) {
                pageNo = 1;
            }
            int size = getPageSize(curPageSizes, pageNo);
            //================================================================
            comment.setComtArtiId(artiId);
            RdPage<Comment> page = new RdPage<Comment>(comment);//查询条件
            page.setPageNo(pageNo);//当前的页号
            page.setPageSize(size);//当前页的记录数
            int totalR = iCommentService.countForSelective2(page);
            page.setTotalRow(totalR);//总行数
            page.setTotalPage(curPageSizes.length);//总页数
            logger.info("总记录：" + totalR);
            logger.info("页数" + page);
            if (curLastIndexs.size() > 0) {
                page.setFirstIndex(curLastIndexs.get(pageNo - 1) - size + 1);//本页数据首条记录索引
                page.setLastIndex(curLastIndexs.get(pageNo - 1));//本页数据最后条记录索引
            }
            List<Comment> list = iCommentService.selectSelective2(page);
            modelMap.addAttribute("commentList", list);
            session.setAttribute("commentPage", page);
            /***********************************************************************/
            return "/article_detail";
        }
    }

    private String getAccessIp() {
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("PRoxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        InetAddress a;
        try {
            a = InetAddress.getLocalHost();
            System.out.println("主机名称: " + a.getHostName()+"ip:"+ip);
        } catch (Exception e) {
        }
        return ip;
    }

    private int getPageSize(int[] arr, Integer pageNo) {
        int size = 0;
        for (int i = 1; i <= arr.length; i++) {//563331
            if (i == pageNo) {
                size = arr[i - 1];
            }
        }
        return size;
    }

    private int[] getCurPageSizes(List<Integer> curLastIndexs) {
        int[] curPageSizes = new int[curLastIndexs.size()];
        for (int i = 0; i < curLastIndexs.size(); i++) {
            if ((i + 1) == curLastIndexs.size()) {
                break;
            }
            //logger.info("差" + (list1.get(i + 1) - list1.get(i)));
            curPageSizes[i + 1] = (curLastIndexs.get(i + 1) - curLastIndexs.get(i));
            if (i == 0) {
                curPageSizes[0] = curLastIndexs.get(0);
            }
            //list1.add(i,list1.get(i+1)-list1.get(i));//logger.info("第"+(i+1)+"页显示"+list1.get(i)+"行");
        }
        logger.info("每页要显示的不同记录数" + curPageSizes);
        return curPageSizes;
    }

    public List<Integer> getCurLastIndexs(Integer artiId) {
        /******************************************************/
        Comment comment = new Comment();
        comment.setComtArtiId(artiId);
        RdPage<Comment> page = new RdPage<Comment>(comment);
        List<Integer> curLastIndexs = new ArrayList<>();//存放begin-end
        Integer count = 0;
        Integer count2 = 0;
        Integer count3 = 0;
        int totalRow = iCommentService.countForSelective2(page); //page.setTotalRow(totalRow);//总行数
        logger.info(totalRow);
        int num;
        if(totalRow<=3){
            num = totalRow;
        }else{
            num = 3 ;
        }
        page.setPageSize(totalRow);
        page.setPageNo(1);
        page.setFirstIndex(1);
        page.setLastIndex(totalRow);
        List<Comment> list = iCommentService.selectSelective2(page);
        for (Comment c : list) {
            Reply r = new Reply();
            r.setReplyComtId(c.getComtId()); //count += irs.countForComment(r);//logger.info("count==="+count);
            List<Reply> replies = c.getReplies();
            count2++;//logger.info("count2==="+count2);
            if (replies.size() >= 1) {
                count3++;//logger.info("count3==="+count3);
            }
            for (Reply replie : replies) {
                count++;//回复为0的不计算//logger.info("count==="+count);
            }
            logger.info("count===" + count + "count2===" + count2 + "count3===" + count3);
            logger.info(count2 + "-" + count3 + "+" + count + "=" + (count2 - count3 + count));
            if ((count2) % num == 0) {
                curLastIndexs.add(count2 - count3 + count);
            }
            if (count2 == list.size()) {
                curLastIndexs.add(count2 - count3 + count);
            }
        }
        logger.info("count===" + count + "count2===" + count2 + "count3===" + count3);
        logger.info("curLastIndexs==" + curLastIndexs);
        return curLastIndexs;
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
