package com.blog.controller;

import com.blog.service.IBlogUsersService;
import com.blog.vo.BlogUsers;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/file")
public class FileController implements ServletContextAware {//1、
    static Logger logger = Logger.getLogger(BlogUsersController.class);
    @Resource
    IBlogUsersService iBlogUsersService;
    //2、
    @Autowired
    private HttpServletRequest request;
    private ServletContext servletContext;

    private static SimpleDateFormat sdf =
            new SimpleDateFormat("yyyyMMdd-HHmmss");
    //存放在项目下路径
    //private final String projectPath = "D:\\ws\\myblog\\src\\main\\webapp\\blog";
    //虚拟目录，存放在服务器磁盘上，存储路径与tomcat路径的分离
    private final String realPath = "E:\\user\\img";
    private final String accessPath = "user/img/";

    //临时目录
    //private final String tempPath  = "D:\\ws\\myblog\\target\\myblog-1.0\\";
    public String getContextPath() {//临时目录
        return this.servletContext.getRealPath("/blog/");
    }

    public String getWebappPath() {
        //此方法获取到工程webapp文件夹下 //D:\ws\myblog\target\myblog-1.0\
        return request.getSession().getServletContext().getRealPath("/");
    }

    public String getUrl() {
        //http://localhost:8901/file/testFileUpload1;到控制器方法前
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getServletPath();
        if (request.getQueryString() != null) {
            url += "?" + request.getQueryString();
        }
        return url;
    }

    public void copyPic(MultipartFile file, String path) throws IOException {
        InputStream input = file.getInputStream();
        OutputStream out = new FileOutputStream(path);
        byte[] b = new byte[1024];
        while ((input.read(b)) != -1) {
            out.write(b);
        }
        input.close();
        out.close();
    }

    private String getNewFileName(String originalName) {
        //a.jpg ----> a-20180208-153233.jpg
        int dotIndex = originalName.lastIndexOf(".");
        //生成上传文件的目标名称
        String uploadFileName =
                originalName.substring(0, dotIndex) + "-"
                        + sdf.format(new Date())
                        + originalName.substring(dotIndex);
        return uploadFileName;
    }

    /**
     * 通过参数@RequestParam("file") MultipartFile file获取到前端传来的File对象，
     * 并通过file.getInputStream()得到File对象的输入流，
     * 之后再通过输出流将文件写入到e:/user/img/盘，即实现文件上传功能。通过虚拟目录来访问。
     *
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public @ResponseBody
    String upload(@RequestParam("file") MultipartFile file, HttpSession session)
            throws IOException {
        if (!file.isEmpty()) {
            String originalName = file.getOriginalFilename();//获取原文件名带后缀
            String newFileName = getNewFileName(originalName);

            //把路径插入到数据库user/img/abc.jpg，并存放到服务器硬盘上
            copyPic(file, realPath + File.separator + newFileName);
            BlogUsers user = (BlogUsers) session.getAttribute("logUser");
            BlogUsers user2 = new BlogUsers();
            user2.setUserId(user.getUserId());
            user2.setUserImageUrl(accessPath + newFileName);
            iBlogUsersService.updateUser(user2);

            //临时存放
            String path = getContextPath() + File.separator + newFileName;
            copyPic(file, path);
            //"blog/" + newFileName
            return accessPath + newFileName;
        } else {
            return "该文件为空";//加/在webapp下，不加在views
        }
    }

    /**
     * 上传单个文件   必须使用@RequestParam注解指定参数
     */
    @RequestMapping(value = "/upload1", method = RequestMethod.POST)
    public String upload(ModelMap modelMap,
                         @RequestParam("file") CommonsMultipartFile file) {
        if (!file.isEmpty()) {
            //D:\ws\myblog\target\myblog-1.0\blog\
            //得到应用程序所在tomcat的一个绝对路径
            String uploadDirectory =
                    this.servletContext.getRealPath("/blog/");//获取本地存储路径
            //得到上传文件的原始文件名
            String originalName = file.getOriginalFilename();

            //a.jpg ----> a-20180208-153233.jpg
            int dotIndex = originalName.lastIndexOf(".");
            //生成上传文件的目标名称
            String uploadFileName =
                    originalName.substring(0, dotIndex) + "-"
                            + sdf.format(new Date())
                            + originalName.substring(dotIndex);
            try {
                File destFile = new File(uploadDirectory, uploadFileName);//新建一个文件
                file.getFileItem().write(destFile);//得到一项写到目标文件
                //file.transferTo(destFile);
                modelMap.addAttribute("uploadFile", file);//在成功页面显示上传信息
                modelMap.addAttribute("uploadFileName", uploadFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
            // return "upload/upload_ok";
        } else {
            return "upload/upload_error";//加/在webapp下，不加在views
        }
        return "upload/upload_ok";
    }

    //上传多个文件
    @RequestMapping(value = "/upload2", method = RequestMethod.POST)
    public String upload2(String name, MultipartHttpServletRequest multipartRequest,
                          ModelMap modelMap) {
        //获取服务器存储的真实路径 D:\\dev\\apache-tomcat-7.0.62\\webapps\\springmvc03\\upload\\
        String path = this.servletContext.getRealPath("/blog/");
        System.out.println("服务器存储的真实路径:" + path);

        //得到多个上传的文件
        Map<String, List<MultipartFile>> filemap = multipartRequest.getMultiFileMap();
        if (!filemap.isEmpty()) {
            //循环上传的文件
            for (Map.Entry<String, List<MultipartFile>> entry : filemap.entrySet()) {
                List<MultipartFile> multipartFile = entry.getValue();
                //循环上传单个文件
                for (MultipartFile file : multipartFile) {
                    //得到上传文件的原始文件名
                    String fileName = file.getOriginalFilename();
                    //得到文件的类型 *.jpg,
                    String fileType = fileName.substring(fileName.lastIndexOf(".")); //包含"."在内
                    System.out.println("文件的类型：" + fileType);
                    //新建一个文件
                    String newFileName = fileName.substring(0, fileName.lastIndexOf(".")); // aaa.jpg --> aaa
                    //newFileNameString
                    newFileName = newFileName + "_" + new Date().getTime() + fileType;
                    File destFile = new File(path, newFileName);
                    try {
                        //file.transferTo(destFile); //file: MultipartFile
                        //commons-io.jar中的工具类
                        FileUtils.writeByteArrayToFile(destFile, file.getBytes());
                    } catch (IOException e) {
                        //e.printStackTrace();
                        return "upload/upload_error";
                    }
                }
            }
        }
        return "upload/upload_ok";
    }

    /**
     * 下载
     *
     * @param servletResponse
     * @param fileName
     */
    @RequestMapping("/download")
    public void download(HttpServletResponse servletResponse,
                         @RequestParam("filename") String fileName) {
        fileName = "/2-20180208-174231.jpg";
        String downloadFile = servletContext.getRealPath("/blog") + fileName;// /  File.separator + fileName;
        ServletOutputStream sos = null;
        try {
            servletResponse.reset();
            //设置下载文件的头部信息， 以附件的形式下载filename为客户端弹出的下载框中的默认文件名
            servletResponse.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            servletResponse.setContentType("application/octet-stream; charset=utf-8"); //application/octet-stream表示*.rar文件
            //把下载的文件夹读成二进制
            byte[] buf = FileUtils.readFileToByteArray(new File(downloadFile));
            //将数据写回servlet的输出流
            sos = servletResponse.getOutputStream();
            sos.write(buf);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                sos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
