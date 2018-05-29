package com.blog.exception;

/**
 * Created by forward on 2018/5/29.
 * 自定义异常类
 */  
public class CustomException extends Exception {  
    //异常信息  
    public String message;  
    public CustomException(String message){  
        super(message);  
        this.message = message;  
    }  
  
    @Override  
    public String getMessage() {  
        return message;  
    }  
  
    public void setMessage(String message) {  
        this.message = message;  
    }  
} 