package com.blog.controller;

import com.blog.service.IBlogUsersService;
import com.blog.util.LoginConstant;
import com.blog.vo.BlogUsers;
import com.blog.vo.Page;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = {"/login2/{moudule}"}, method = {RequestMethod.POST, RequestMethod.GET},produces = "text/plain;charset=utf-8")
    public @ResponseBody
    String loginAjax(BlogUsers blogUsers,@PathVariable String moudule, ModelMap modelMap,
                     HttpSession session, String submitCode) {
        String code = (String) session.getAttribute("validCode");
        if(code==null){
            return "error";
        }
        if (StringUtils.isEmpty(submitCode) || !StringUtils.equals(code.toLowerCase(), submitCode.toLowerCase())) {
            return LoginConstant.LOGIN_ERROR_MESSAGE_VALIDATECODE;
        }
        if (loginMethod(blogUsers, moudule, session)) return "success";
        return LoginConstant.LOGIN_ERROR_MESSAGE_USERERROR;
    }

    private boolean loginMethod(BlogUsers blogUsers, String moudule, HttpSession session) {
        BlogUsers user = iBlogUsersService.selectForLogin(blogUsers);
        if (user != null) {
            session.setAttribute("logUser", user);
            if(moudule.equals("head")){
                return true;
            }else if(moudule.equals("admin")){
                return true;
            }else if(moudule.equals("reg")){
                return true;
            }
        }
        return false;
    }

    @RequestMapping(value = {"/login/{moudule}"}, method = {RequestMethod.POST, RequestMethod.GET})
    public String login(BlogUsers blogUsers,@PathVariable String moudule, ModelMap modelMap,
                        HttpSession session, String submitCode) {

        String code = (String) session.getAttribute("validCode");
        if(code==null){
            return "redirect:index.jsp";
        }
        if (StringUtils.isEmpty(submitCode) || !StringUtils.equals(code.toLowerCase(), submitCode.toLowerCase())) {
            return getReturn();
        }
        logger.info(blogUsers);
        BlogUsers user = iBlogUsersService.selectForLogin(blogUsers);
        if (user != null) {
            session.setAttribute("logUser", user);
            if(moudule.equals("head")){
                return getReturn();
            }else if(moudule.equals("admin")){
                return "redirect:/article/query";
            }
        }
        return getReturn();
    }

    public String getReturn(){
        String returnStr = "redirect:index.jsp";
        //http://localhost:8901/myblog/login.jsp
        String header_referer = request.getHeader("Referer");
        /*有views和jsp的直接，没有的用redirect+""*/
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();//http://localhost:8901
        String url2 =  request.getServletPath();///user/login/head
        if (request.getQueryString() != null) {
            url += "?" + request.getQueryString();
        }
        String contextPath = request.getContextPath();///myblog
        String head = url+contextPath;
        boolean isContainViews = false;
        boolean isContainJsp = false;
        if(header_referer.contains("views")){
            isContainViews = true;
            //header_referer = header_referer.replace("/views","");
        }
        if(header_referer.endsWith(".jsp")){
            isContainJsp = true;
            //header_referer = StringUtils.substringBetween(header_referer, contextPath, ".jsp");
        }/*else{
            header_referer = header_referer.substring(head.length(), header_referer.length());
        }*/
        if(isContainViews&&isContainJsp){
            header_referer = header_referer.replace("/views","");
            header_referer = StringUtils.substringBetween(header_referer, contextPath, ".jsp");
            returnStr =   header_referer;
        }else if(isContainJsp){
            header_referer = StringUtils.substringBetween(header_referer, contextPath, ".jsp");
            returnStr =  ".."+header_referer;
        }else if(!isContainViews&&!isContainJsp){
            header_referer = header_referer.substring(head.length(), header_referer.length());
            returnStr = "redirect:"+header_referer;
        }
        return returnStr;
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

    @RequestMapping(value = {"/reg"},produces = "text/plain;charset=utf-8")
    public @ResponseBody
    String addBlogUser(BlogUsers user , HttpSession session) {
        if(user.getUserPassword().length()<5||user.getUserPassword().length()>50){
            return LoginConstant.REG_ERROR_MESSAGE_USERPASSWORD;
        }
        user.setUserType(2);
        user.setUserImageUrl("user/img/common-20180225-155739.jpg");
        String info = iBlogUsersService.addBlogUser(user);
        if("success".equals(info)){
            this.loginMethod(user,"reg",session);
        }
        //如果第二次插入的
        return  info;
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

    @RequestMapping("/selectUserById/{userId}/{moudule}")
    public String selectUserById(@PathVariable String userId,@PathVariable String moudule, ModelMap modelMap) {
        if(userId==null||userId.equals("undefined")){
            return "../home";
        }
        int id = Integer.valueOf(userId);// java.lang.NumberFormatException: For input string: "undefined"

        System.out.println(id);


        BlogUsers user = iBlogUsersService.selectUserById(id);

        modelMap.addAttribute("user", user);
        if(moudule.equals("showMe")){
            return "model2";
        }else if(moudule.equals("showUser")){
            return "model";
        }else if(moudule.equals("uptPic")){
            return "model3";
        }else {
            return "model4";
        }
    }
    @RequestMapping("/updateUser")
    public @ResponseBody Map<String , Object> updateUser(BlogUsers user) {
        //判断用户名不能相同
        return getStringObjectMap(user,"updateUser");
    }

    @RequestMapping(value = {"/showMe"}, method = {RequestMethod.POST, RequestMethod.GET})
    public String showMe(ModelMap modelMap,
                         HttpSession session) {
        BlogUsers user = (BlogUsers) session.getAttribute("logUser");
        if(user!=null){
            BlogUsers curUser = iBlogUsersService.selectUserById(user.getUserId());
            modelMap.addAttribute("curUser",curUser);
        }
        return "edit_profile";
    }

    @RequestMapping("/uptMyInfo")
    public @ResponseBody Map<String , Object> uptMyInfo(BlogUsers user) {
        //判断用户名不能相同
        return getStringObjectMap(user,"uptMyInfo");
    }

    public Map<String, Object> getStringObjectMap(BlogUsers user, String moudule) {
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
        if(moudule.equals("uptMyInfo")){
            map.put("userSex",user.getUserSex());
            map.put("userBirthday",user.getUserBirthday());
            map.put("userAddress",user.getUserAddress());
        }
        return map;
    }
}
