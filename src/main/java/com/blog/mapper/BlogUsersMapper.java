package com.blog.mapper;

import org.springframework.stereotype.Repository;

import com.blog.vo.BlogUsers;

@Repository
public interface BlogUsersMapper {
    
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public BlogUsers login(BlogUsers user);
}