package com.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.vo.Article;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.FileNotFoundException;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class BlogUsersController {
	static Logger logger = Logger.getLogger(BlogUsersController.class);
	@Resource
	IBlogUsersService iBlogUsersService;

	@RequestMapping(value = { "/login" }, method = { RequestMethod.POST ,RequestMethod.GET})
	public String login(BlogUsers blogUsers, ModelMap modelMap,
			HttpSession session,String submitCode) {
		String code = (String) session.getAttribute("validCode");
		if(StringUtils.isEmpty(submitCode)||!StringUtils.equals(code,submitCode)){
			return "redirect:/index.jsp";
		}
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

	@RequestMapping("/code")
	public void createCode(HttpServletResponse response, HttpSession session){
		try {
			//将验证码写到本地文件中
			ValidateCode vCode = new ValidateCode();
			session.setAttribute("validCode", vCode.getCode());

			vCode.write(response.getOutputStream());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/reg")
	public @ResponseBody
	String addBlogUser(BlogUsers user) {
		//logger.info(article.getArtiTitle()+"=="+article.getArtiCatgId()+"=="+article.getArtiContent());
		//article.setArtiUserId(1);
		logger.info(user);
		iBlogUsersService.addBlogUser(user);
		//如果第二次插入的
		return "success";
	}

}
