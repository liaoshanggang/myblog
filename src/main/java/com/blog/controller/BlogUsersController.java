package com.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;

@Controller
@RequestMapping("/user")
public class BlogUsersController {
	static Logger logger = Logger.getLogger(BlogUsersController.class);
	@Resource
	IBlogUsersService iBlogUsersService;

	@RequestMapping(value = { "/login" }, method = { RequestMethod.POST ,RequestMethod.GET})
	public String login(BlogUsers blogUsers, ModelMap modelMap,
			HttpSession session) {
		logger.info(blogUsers);
		BlogUsers user = iBlogUsersService.selectForLogin(blogUsers);
		if (user != null) {
			session.setAttribute("logUser", user);
			return "redirect:/index.jsp";
		}
		return "redirect:/login.jsp";
	}

	@RequestMapping(value = { "/logOff" }, method = { RequestMethod.POST ,RequestMethod.GET})
	public String logOff(ModelMap modelMap,
						HttpSession session) {
		String contextPath = session.getServletContext().getContextPath();
		session.setAttribute("logUser",null);
		return "redirect:/showHome";
	}

}
