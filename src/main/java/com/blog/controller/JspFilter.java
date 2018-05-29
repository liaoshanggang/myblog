package com.blog.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class JspFilter implements Filter {
    static Logger logger = Logger.getLogger(JspFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String uri = request.getRequestURI();
        //http://localhost:8901/myblog/login.jsp
        String url = request.getHeader("Referer");
        //http://localhost:8901
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String contextPath = request.getContextPath();///myblog
        String uri2 = request.getServletPath();///user/login/head
        logger.info("uri================"+uri);
        logger.info("url================"+url);
        logger.info("basePath==========="+basePath);
        logger.info("contextPath========"+contextPath);
        logger.info("uri2==============="+uri2);

        /*if (url != null && url.endsWith(".jsp")) {
            httpServletResponse.sendRedirect(httpServletRequest
                    .getContextPath());
            return;
        }*/
        chain.doFilter(servletRequest, servletResponse);

    }

    @Override
    public void destroy() {
    }

}
