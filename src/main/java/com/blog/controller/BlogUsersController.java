package com.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;

@Controller
@RequestMapping("/user")
public class BlogUsersController {
	@Resource
	IBlogUsersService iBlogUsersService;
	
	@RequestMapping(value = { "/login" }, method = { RequestMethod.POST })
	public String login(BlogUsers blogUsers, ModelMap modelMap, HttpSession session) {
		System.out.println(blogUsers);
		BlogUsers user = iBlogUsersService.selectForLogin(blogUsers);
		if(user!=null){
			session.setAttribute("logUser", user);
			return "redirect:/landing.jsp";
		}
		return "redirect:/login.jsp";
	}

}
