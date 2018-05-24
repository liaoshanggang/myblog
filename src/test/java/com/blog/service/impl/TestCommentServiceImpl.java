package com.blog.service.impl;

import com.blog.service.ICommentService;
import com.blog.service.IReplyService;
import com.blog.vo.*;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestCommentServiceImpl {
    static Logger logger = Logger.getLogger(TestCommentServiceImpl.class);
    @Resource
    ICommentService ics;
    @Resource
    IReplyService irs;
    @Deprecated
    @Test
    public void testDeleteCommentById() {
        /*删除20的同时更新回复id*/
        Comment comment = new Comment();
        comment.setComtId(18);

        Reply r = new Reply();
        r.setReplyId(2);
        r.setReplyComtId(comment.getComtId());
        irs.updateReplyById(r);

        ics.deleteCommentById(comment);
    }

    @Test
    public void testSelectForCommentArticle() {
        Comment comment = new Comment();
        Page<Comment> page = new Page<Comment>(comment);

        page.setPageSize(3);
        page.setPageNo(1);

        int totalRow = ics.countForCommentArticle(page);
        page.setTotalRow(totalRow);
        logger.info("总记录：" + totalRow);
        logger.info("页数" + page);

        List<Comment> list = ics.selectForCommentArticle(page);
        for (Comment c : list) {
            logger.info("info" + c + "article" + c.getArticle());
        }
    }

    @Test
    public void testSelectSelective2() {
        /******************************************************/
        List<Integer> list1 = new ArrayList<>();//存放begin-end
        Integer count = 0;
        Integer count2 = 0;
        Integer count3 = 0;
        Comment comment = new Comment();
        comment.setComtArtiId(69);
        RdPage<Comment> page = new RdPage<Comment>(comment);
        int totalRow = ics.countForSelective2(page); //page.setTotalRow(totalRow);//总行数
//        totalRow =3;
        logger.info(totalRow);
        page.setPageSize(totalRow);
        page.setPageNo(1);
        page.setFirstIndex(1);
        page.setLastIndex(totalRow);
        List<Comment> list = ics.selectSelective2(page);
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
            if ((count2) % 5 == 0) {
                list1.add(count2 - count3 + count);
            }
            if (count2 == list.size()) {
                list1.add(count2 - count3 + count);
            }
        }
        logger.info("count===" + count + "count2===" + count2 + "count3===" + count3);
        /******************************************************/
        //list1每页的最后一条数
        logger.info("list1==" + list1);
        //arr存储固定页的记录数
        int[] arr = new int[list1.size()];
        for (int i = 0; i < list1.size(); i++) {
            if ((i + 1) == list1.size()) {
                break;
            }
            //logger.info("差" + (list1.get(i + 1) - list1.get(i)));
            arr[i + 1] = (list1.get(i + 1) - list1.get(i));
            if (i == 0) {
                arr[0] = list1.get(0);
            }
            //list1.add(i,list1.get(i+1)-list1.get(i));//logger.info("第"+(i+1)+"页显示"+list1.get(i)+"行");
        }
        for (int i = 0; i < arr.length; i++) {
            logger.info("每页要显示的不同记录数" + arr[i]);
        }
        /***********************************************************************/
        //通过页数来查找对于页要显示的记录数
        int no = 6;
        int size = 0;
        for (int i = 1; i <= arr.length; i++) {//563331
            if (i == no) {
                size = arr[i - 1];
            }
        }
        /***********************************************************************/
        Comment comment2 = new Comment();
        comment2.setComtArtiId(69);
        RdPage<Comment> rdPage = new RdPage<Comment>(comment2);//查询条件

        rdPage.setPageNo(no);//当前的页号
        rdPage.setPageSize(size);//当前页的记录数
        int totalR = ics.countForSelective2(rdPage);
        //totalR=3;
        rdPage.setTotalRow(totalR);//总行数
        rdPage.setTotalPage(arr.length);//总页数
        rdPage.setFirstIndex(list1.get(no - 1) - size + 1);//本页数据首条记录索引
        rdPage.setLastIndex(list1.get(no - 1));//本页数据最后条记录索引
        logger.info("总记录：" + totalRow);
        logger.info("页数" + rdPage);

        list = ics.selectSelective2(rdPage);
        showSel(list);
    }

    @Test
    public void testSelectSelective() {
        /*Comment comment =  new Comment();
        comment.setComtArtiId(68);
        Page<Comment> page = null;
        Integer pageNo = 2;
        List<Comment> list = ics.selectSelective(comment, pageNo, page);
        for (Comment comment1 : list) {
            logger.info("评论"+comment1.getComtId()+"");
            List<Reply> replies = comment1.getReplies();
            for (Reply replie:replies) {
                logger.info(replie.getReplyId()+"=="+replie.getReplyContent());
            }
        }*/
        Comment comment = new Comment();
        comment.setComtArtiId(69);
        Page<Comment> page = new Page<Comment>(comment);

        page.setPageSize(3);
        page.setPageNo(1);

        int totalRow = ics.countForSelective(page);
        page.setTotalRow(totalRow);
        logger.info("总记录：" + totalRow);
        logger.info("页数" + page);

        List<Comment> list = ics.selectSelective(page);
        showSel(list);
    }

    private void showSel(List<Comment> list) {
        for (Comment comment1 : list) {
            logger.info("评论" + comment1.getComtId() + comment1.getComtContent() + "用户" + comment1.getBlogUsers().getUserName() + "回复");
            List<Reply> replies = comment1.getReplies();
            for (Reply replie : replies) {
//if(replie.getReplyComtId()!=null){
                logger.info(replie.getReplyId() + "==" + replie.getReplyContent() + replie.getBu().getUserName());
//}
            }
        }
    }

    @Test
    public void testSelectSelective3() {
        /*未找到要求的 FROM 关键字 前面，问题*/
        Comment comment = new Comment();
        //comment.setComtArtiId(69);
        Page<Comment> page = new Page<Comment>(comment);

        page.setPageSize(50);
        page.setPageNo(1);

        int totalRow = ics.countForSelective(page);
        page.setTotalRow(totalRow);
        logger.info("总记录：" + totalRow);
        logger.info("页数" + page);

        List<Comment> list = ics.selectSelective(page);
        for (Comment comment1 : list) {
            logger.info("用户" + comment1.getBlogUsers() + "评论" + comment1 + "文章" + comment1.getArticle());
            List<Reply> replies = comment1.getReplies();
            for (Reply replie : replies) {
                logger.info("-->用户" + replie.getBu() + "回复" + replie);
            }
        }
    }

    @Test
    public void testSelectSelective4() {
        /*未找到要求的 FROM 关键字 前面，问题*/
        Comment comment = new Comment();
        comment.setComtUserId(1);
        List<Reply> replies1 = new ArrayList<>();
        for (Reply r : replies1) {
            r.setReplyUserId(1);
        }
        comment.setReplies(replies1);
        Page<Comment> page = new Page<Comment>(comment);

        page.setPageSize(50);
        page.setPageNo(1);

        int totalRow = ics.countForSelective(page);
        page.setTotalRow(totalRow);
        logger.info("总记录：" + totalRow);
        logger.info("页数" + page);

        List<Comment> list = ics.selectSelective(page);
        for (Comment comment1 : list) {
            logger.info("用户" + comment1.getBlogUsers() + "评论" + comment1 + "文章" + comment1.getArticle());
            List<Reply> replies = comment1.getReplies();
            for (Reply replie : replies) {
                logger.info("-->用户" + replie.getBu() + "回复" + replie);
            }
        }
    }

}
