package com.blog.service;

import com.blog.vo.BlogUsers;
import com.blog.vo.Page;

import java.util.List;

public interface IBlogUsersService {
    /**
     * 用戶登录
     *
     * @param user
     * @return
     */
    BlogUsers selectForLogin(BlogUsers user);

    String addBlogUser(BlogUsers user);

    int countForSelective(Page<BlogUsers> page);

    List<BlogUsers> selectSelective(Page<BlogUsers> page);

    //根据id删除用户数据
    void deleteUserById(Integer id);

    //根据id批量删除用户
    void batchDelUser(int[] delID);

    BlogUsers selectUserById(int id);

    void updateUser(BlogUsers user);
}
