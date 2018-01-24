package com.blog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.mapper.BlogUsersMapper;
import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;

@Service("blogUsersService")
public class BlogUsersServiceImpl implements IBlogUsersService {

	// 可以为属性注入依赖
		@Resource
		BlogUsersMapper blogUsersMapper;

		// 把事务控制在Service层，这个业务方法有可能要多个数据库操作完成，所有操作要在一个事务完成，粗粒度
		// 如果一个service类需要用到多个Mapper映射器接口，那么你可注入多个
		/**
		 * 用户登录
		 */
		@Override
		public BlogUsers selectForLogin(BlogUsers user) {
			return blogUsersMapper.login(user);
		}

	
}
