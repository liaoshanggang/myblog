package com.blog.service.impl;

import com.blog.service.ICommentService;
import com.blog.vo.Comment;
import com.blog.vo.Page;
import com.blog.vo.Reply;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class TestCommentServiceImpl {
	static Logger logger = Logger.getLogger(TestCommentServiceImpl.class);
	@Resource
	ICommentService ics;
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
		Comment comment =  new Comment();
		comment.setComtArtiId(68);
		Page<Comment> page = new Page<Comment>(comment);

		page.setPageSize(2);
		page.setPageNo(2);

		int totalRow = ics.countForSelective(page);
		page.setTotalRow(totalRow);
		logger.info("总记录："+totalRow);
		logger.info("页数"+page);

		List<Comment> list = ics.selectSelective(page);
		for (Comment comment1 : list) {
			logger.info("评论"+comment1.getComtId()+"");
            List<Reply> replies = comment1.getReplies();
            for (Reply replie:replies) {
                //if(replie.getReplyComtId()!=null){
                    logger.info(replie.getReplyId()+"=="+replie.getReplyContent());
                //}
            }
		}
	}

}
