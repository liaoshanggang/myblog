package com.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.vo.BlogUsers;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 安全访问拦截器
 */
public class SecureInterceptor extends HandlerInterceptorAdapter {
    static Logger logger = Logger.getLogger(SecureInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        logger.info("1、preHandle():" + request.getRequestURL());
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = request.getSession();
        BlogUsers logUser = (BlogUsers) session.getAttribute("logUser");
        String url = httpServletRequest.getRequestURI();
        if (logUser == null) {
            // 未登录，重定向到登录页面
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            logger.info(request.getContextPath() + "/login.jsp");
            return false;
        }else if(logUser.getUserType()==0&&url.contains("bg_mgt")){
            return false;
        }else{
            // 普通会员已登录，继续向后调用
            //request.getRequestDispatcher("/login").forward(request,response);
            return true;
        }
    }
}
