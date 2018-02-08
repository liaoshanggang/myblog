package com.blog.controller;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/file")
public class FileController implements ServletContextAware {
    static Logger logger = Logger.getLogger(BlogUsersController.class);
    @Autowired
    private HttpServletRequest request;
    private ServletContext servletContext;

    private static SimpleDateFormat sdf =
            new SimpleDateFormat("yyyyMMdd-HHmmss");

    /**
     * 通过参数@RequestParam("file") MultipartFile file获取到前端传来的File对象，
     * 并通过file.getInputStream()得到File对象的输入流，
     * 之后再通过输出流将文件写入到D盘，即实现文件上传功能。
     *
     * @param desc
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping("/testFileUpload")
    public String testFileUpload(@RequestParam("desc") String desc, @RequestParam("file") MultipartFile file)
            throws IOException {
        //http://localhost:8901/file/testFileUpload
        //此方法获取到工程webapp文件夹下
        //D:\ws\myblog\target\myblog-1.0\
        String contexPath = request.getSession().getServletContext().getRealPath("/");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getServletPath();
        if (request.getQueryString() != null) {
            url += "?" + request.getQueryString();
        }
        String fileName = file.getOriginalFilename();
        logger.info("desc: " + desc);
        logger.info("OriginalFilename: " + fileName);
        logger.info("InputStream: " + file.getInputStream());
        InputStream input = file.getInputStream();
        logger.info("D:" + File.separator + fileName);

        String path = "D:\\ws\\myblog\\src\\main\\webapp\\blog";
        OutputStream out = new FileOutputStream(path + File.separator + fileName);
        byte[] b = new byte[1024];
        while ((input.read(b)) != -1) {
            out.write(b);
        }
        input.close();
        out.close();
        return "upload/upload_ok";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleUploadData(String name,
                                   @RequestParam("file") CommonsMultipartFile file) {
        if (!file.isEmpty()) {
            //D:\ws\myblog\target\myblog-1.0\blog\
            String path = this.servletContext.getRealPath("/blog/");  //获取本地存储路径
            System.out.println(path);
            String fileName = file.getOriginalFilename();
            String fileType = fileName.substring(fileName.lastIndexOf("."));
            System.out.println(fileType);
            File file2 = new File(path, new Date().getTime() + fileType); //新建一个文件
            try {
                file.getFileItem().write(file2); //将上传的文件写入新建的文件中
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "upload/upload_ok";
        } else {
            return "upload/upload_error";
        }
    }

    //案例1    必须使用@RequestParam注解指定参数
    @RequestMapping(value = "/upload1", method = RequestMethod.POST)
    public String upload(ModelMap modelMap,
                         @RequestParam("file") CommonsMultipartFile file) {
        if (!file.isEmpty()) {
            //得到应用程序所在tomcat的一个绝对路径
            String uploadDirectory =
                    this.servletContext.getRealPath("/blog/");
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
                File destFile = new File(uploadDirectory, uploadFileName);
                file.getFileItem().write(destFile);//得到一项写到目标文件
                //file.transferTo(destFile);
                modelMap.addAttribute("uploadFile", file);//在成功页面显示上传信息
                modelMap.addAttribute("uploadFileName",uploadFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            return "upload/upload_error";//加/在webapp下，不加在views
        }
        return "upload/upload_ok";
    }

    //案例2
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


    @RequestMapping("/download")
    public void download(HttpServletResponse servletResponse,
                         @RequestParam("filename") String fileName) {
        fileName = "/2-20180208-174231.jpg";
        String downloadFile = servletContext.getRealPath("/blog")+ fileName;// /  File.separator + fileName;
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
