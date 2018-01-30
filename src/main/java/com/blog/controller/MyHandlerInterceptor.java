package com.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyHandlerInterceptor implements HandlerInterceptor {
	static Logger logger = Logger.getLogger(MyHandlerInterceptor.class);
	
	/**
	 * 预处理
	 * 该方法在行为（控制器的处理方法）执行前执行，可以实现对数据的预处理，比如：编码、安全控制等。
	 * 如果方法返回true,则继续执行action
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		logger.info("1、preHandle():"+request.getRequestURL());
		logger.info(handler);
		logger.info("----------------------------------------");
		return true;
	}

	/**
	 * 后处理
	 * 
	 * 该方法在行为（控制器的处理方法）执行后，生成视图前执行。在这里，我们有机会修改视图层数据。
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("3、postHandle():"+request.getRequestURL());
		logger.info(handler);
		logger.info("----------------------------------------");
	}

	/**
	 * 视图生成后，即jsp执行未响应前
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("5、postHandle():"+request.getRequestURL());
		logger.info("----------------------------------------");
	}

}
