package com.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 安全访问拦截器
 */
public class SecureInterceptor extends HandlerInterceptorAdapter {
    static Logger logger = Logger.getLogger(MyHandlerInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        logger.info("1、preHandle():" + request.getRequestURL());
        HttpSession session = request.getSession();
        if (session.getAttribute("logUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            logger.info(request.getContextPath() + "/login.jsp");
            return false;
        }
        return true;
    }
}
