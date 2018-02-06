package com.blog.controller;

import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;
import com.blog.vo.Page;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class BlogUsersController {
    static Logger logger = Logger.getLogger(BlogUsersController.class);
    @Resource
    IBlogUsersService iBlogUsersService;

    @RequestMapping(value = {"/login"}, method = {RequestMethod.POST, RequestMethod.GET})
    public String login(BlogUsers blogUsers, ModelMap modelMap,
                        HttpSession session, String submitCode) {
        String code = (String) session.getAttribute("validCode");
        if (StringUtils.isEmpty(submitCode) || !StringUtils.equals(code.toLowerCase(), submitCode.toLowerCase())) {
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

    @RequestMapping(value = {"/logOff"}, method = {RequestMethod.POST, RequestMethod.GET})
    public String logOff(ModelMap modelMap,
                         HttpSession session) {
        String contextPath = session.getServletContext().getContextPath();
        session.setAttribute("logUser", null);
        //session.invalidate();
        return "redirect:/showHome";
    }

    @RequestMapping("/code")
    public void createCode(HttpServletResponse response, HttpSession session) {
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

    @RequestMapping("/queryAll")
    public String queryArticle(BlogUsers user, Integer pageNo, ModelMap modelMap, HttpSession session) {
        logger.info(user);
        Page<BlogUsers> page = (Page<BlogUsers>) session.getAttribute("userPage");
        if (page == null || pageNo == null) {
            page = new Page<BlogUsers>(user);
            page.setPageNo(1);
            page.setPageSize(10);
            int totalRow = iBlogUsersService.countForSelective(page);
            page.setTotalRow(totalRow);
        } else {
            page.setPageNo(pageNo);
        }

        List<BlogUsers> list = iBlogUsersService.selectSelective(page);
        modelMap.addAttribute("userList", list);

        session.setAttribute("userPage", page);
        return "/manage_users";
    }

    //	删除用户
    @RequestMapping("/deleteUser")
    public @ResponseBody
    String deleteUser(Integer userId) {
        iBlogUsersService.deleteUserById(userId);
        //如果第二次插入的
        return "success";
    }

    //	批量删除用户
    @RequestMapping("batchDelUser")
    public String delSelectUser(String delId) {
        //删除后链接未改变
        System.out.println(delId);
//		把得到的字符串id数组转换成数字id数组
        String[] delIds = delId.split(",");
        int i = delIds.length;
        int delID[] = new int[i];
        for (int j = 0; j < delIds.length; j++) {
            delID[j] = Integer.parseInt(delIds[j]);
        }
        iBlogUsersService.batchDelUser(delID);
        return "/manage_users";

    }

    @RequestMapping("/selectUserById/{userId}")
    public String selectUserById(@PathVariable String userId, ModelMap modelMap) {

        int id = Integer.valueOf(userId);

        System.out.println(id);


        BlogUsers user = iBlogUsersService.selectUserById(id);

        modelMap.addAttribute("user", user);
        return "model";
    }

    @RequestMapping("/updateUser")
    public @ResponseBody
    Map<String , Object> updateUser(BlogUsers user) {
        //判断用户名不能相同
        this.iBlogUsersService.updateUser(user);
        //如果第二次插入的
        Map<String , Object> map = new HashMap<String ,Object>();
        map.put("userId",user.getUserId());
        map.put("userName",user.getUserName());
        map.put("userNickname", user.getUserNickname());
        map.put("userEmail", user.getUserEmail());
        map.put("userMobile", user.getUserMobile());
        map.put("eduBackground", user.getEduBackground());
        map.put("userProfile", user.getUserProfile());
        return map;
    }
}
