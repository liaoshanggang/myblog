package com.blog.mapper;

import com.blog.vo.Page;
import org.springframework.stereotype.Repository;

import com.blog.vo.BlogUsers;

import java.util.List;

@Repository
public interface BlogUsersMapper {
    
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public BlogUsers login(BlogUsers user);

	void addBlogUser(BlogUsers user);

    int countForSelective(Page<BlogUsers> page);

	List<BlogUsers> selectSelective(Page<BlogUsers> page);

    void deleteUserById(Integer id);

	void batchDelUser(int[] delID);

    BlogUsers selectUserById(int id);

	void updateUser(BlogUsers user);
}