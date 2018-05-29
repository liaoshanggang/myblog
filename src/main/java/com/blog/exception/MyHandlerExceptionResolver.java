package com.blog.exception;

import com.blog.controller.ArticleController;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.apache.logging.log4j.core.util.JsonUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Component
public class MyHandlerExceptionResolver implements HandlerExceptionResolver {

    static Logger logger = Logger.getLogger(HandlerExceptionResolver.class);
  
    @Override  
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                                         Exception ex) {
  
        logger.error("服务器出错", ex);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<>();
        ModelAndView modelAndView = new ModelAndView();

        map.put("code","error");
        map.put("msg","服务器出错了");
        // 解析出异常类型
        CustomException customException = null;
        // 若该异常类型是自定义的异常，直接取出异常信息在错误页面展示即可。
        if(ex instanceof CustomException){
            customException = (CustomException)ex;
        }else{
            // 如果不是自定义异常，构造一个系统自定义的异常类型，信息为“未知错误”
            customException = new CustomException("服务器出错了");
        }
        //错误信息
        String message = customException.getMessage();
        //如果是ajax请求，就返回一个json格式的出错提示信息  
        if (request.getHeader("X-Requested-With") != null) {  
            try {
                String asString = mapper.writeValueAsString(map);
                response.getWriter().println(asString);
            } catch (IOException e) {
                logger.error("服务器失败时发送错误提示信息失败", e);  
            }  
            //返回一个空的ModelAndView表示已经手动生成响应  
            //return null表示使用默认的处理方式，等于没处理  
            return modelAndView;
        } else {
            //将错误信息传到页面
            modelAndView.addObject("message",message);
            //指向错误页面
            modelAndView.setViewName("500");
            return modelAndView;
        }  
    }  
}  