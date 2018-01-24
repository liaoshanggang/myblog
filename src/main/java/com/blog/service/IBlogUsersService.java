package com.blog.service;

import com.blog.vo.BlogUsers;

public interface IBlogUsersService {
	/**
	 * 用戶登录
	 * @param user
	 * @return
	 */
	BlogUsers selectForLogin(BlogUsers user);
	

}
