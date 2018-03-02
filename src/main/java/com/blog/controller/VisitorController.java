package com.blog.controller;

import com.blog.service.IVisitorService;
import com.blog.vo.Visitor;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;

@Controller
@RequestMapping("/visitor")
public class VisitorController {
    static Logger logger = Logger.getLogger(VisitorController.class);
    @Autowired
    private HttpServletRequest request;
    @Resource
    IVisitorService iVisitorService;

    @RequestMapping("/thumbUp")
    public @ResponseBody
    String selectHotArticles(Visitor v,ModelMap modelMap) {
        String accessIp = getAccessIp();
        v.setVisitorIp(accessIp);
        if(iVisitorService.countArticleThumbUp(v)){
            return "error";
        }
        Integer integer = iVisitorService.countPageViewByAid(v);
        return Integer.toString(integer);
    }

    private String getAccessIp() {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("PRoxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        InetAddress a;
        try {
            a = InetAddress.getLocalHost();
            System.out.println("主机名称: " + a.getHostName() + "ip:" + ip);
        } catch (Exception e) {
        }
        return ip;
    }
}
