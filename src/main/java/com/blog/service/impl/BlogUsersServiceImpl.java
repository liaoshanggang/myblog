package com.blog.service.impl;

import javax.annotation.Resource;

import com.blog.util.LoginConstant;
import com.blog.vo.Page;
import org.springframework.stereotype.Service;

import com.blog.mapper.BlogUsersMapper;
import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;

import java.util.List;

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

	@Override
	public String addBlogUser(BlogUsers user) {
		int num = blogUsersMapper.selectUserByName(user);
		if(num>=1){
			return LoginConstant.REG_ERROR_MESSAGE_USEREXIST;
		}else{
			blogUsersMapper.addBlogUser(user);
			return "success";
		}
	}

	@Override
	public int countForSelective(Page<BlogUsers> page) {
		return blogUsersMapper.countForSelective(page);
	}

	@Override
	public List<BlogUsers> selectSelective(Page<BlogUsers> page) {
		return blogUsersMapper.selectSelective(page);
	}

	@Override
	public void deleteUserById(Integer id) {
		blogUsersMapper.deleteUserById(id);
	}

	@Override
	public void batchDelUser(int[] delID) {
		blogUsersMapper.batchDelUser(delID);
	}

	@Override
	public BlogUsers selectUserById(int id) {
		return blogUsersMapper.selectUserById(id);
	}

	@Override
	public void updateUser(BlogUsers user) {
		this.blogUsersMapper.updateUser(user);
	}


}
