package com.blog.service.impl;

import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;
import com.blog.vo.Page;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestBlogUsersServiceImpl {
    static Logger logger = Logger.getLogger(TestBlogUsersServiceImpl.class);
    @Resource
    IBlogUsersService ibus;
    @Deprecated
    @Test
    public void testSelectSelective() {

        BlogUsers user = new BlogUsers();
        Page<BlogUsers> page = new Page<BlogUsers>(user);

        user.setUserName("张");
        user.setUserNickname("");
        //user.setUserEmail("1");
        //user.setUserMobile("1");

        page.setPageSize(5);
        page.setPageNo(1);

        int totalRow = ibus.countForSelective(page);
        page.setTotalRow(totalRow);
        logger.info("总记录：" + totalRow);
        logger.info("页数" + page);

        List<BlogUsers> list = ibus.selectSelective(page);
        for (BlogUsers user2 : list) {
            logger.info(user2);
        }

    }
    @Deprecated
    @Test
    public void testAddBlogUser() {
        for (int i = 0; i < 30; i++) {
            BlogUsers user = new BlogUsers();
            user.setUserName("张三" + i);
            user.setUserEmail(i + "@qq.com");
            user.setUserPassword("123456");
            user.setUserNickname("张三" + i);
            user.setUserMobile("" + i);
            user.setUserType(2);
            ibus.addBlogUser(user);
        }

    }
    @Deprecated
    @Test
    public void testDeleteUserById() {

        Integer id = 42;
        ibus.deleteUserById(id);
    }
}
