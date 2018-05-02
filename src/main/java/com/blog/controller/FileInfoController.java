package com.blog.controller;

import com.blog.service.IFileInfoService;
import com.blog.vo.BlogUsers;
import com.blog.vo.FileInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/fileInfo")
public class FileInfoController {
    static Logger logger = Logger.getLogger(FileInfoController.class);
    @Resource
    IFileInfoService iFileInfoService;
    private final String realPath = "E:\\";
    private final String accessPath = "user/files/";

    @RequestMapping("/queryByPath")
    public String queryFileInfoByPath(String path , ModelMap modelMap){
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFilePath(path);
        List<FileInfo> fileInfos = iFileInfoService.selectFileInfoByPath(fileInfo);
        modelMap.addAttribute("path",path);
        modelMap.addAttribute("fileInfos",fileInfos);
        return "/manage_file";
    }

    public void copyFile(MultipartFile file, String path) throws IOException {
        InputStream input = file.getInputStream();
        OutputStream out = new FileOutputStream(path);
        byte[] b = new byte[1024];
        while ((input.read(b)) != -1) {
            out.write(b);
        }
        input.close();
        out.close();
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    public @ResponseBody
    String upload(HttpServletRequest request, HttpServletResponse response,
                  @RequestParam("file") CommonsMultipartFile file, String path,HttpSession session)
            throws IOException {
        PrintWriter out;
        boolean flag = false;
        BlogUsers user = (BlogUsers) session.getAttribute("logUser");
        if (user == null) {
            return "未登陆，上传失败，请重新登陆！";
        }
        if (file.getSize() > 0&&!file.isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String originalName = originalFilename;//获取原文件名带后缀
            //把路径插入到数据库user/img/abc.jpg，并存放到服务器硬盘上
            String pathD = path+"/"+originalFilename;
            path = path.replace("/","\\");
            String path1 = realPath + File.separator + path + "\\" + originalName;
            FileInfo fileInfo = new FileInfo();
            String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
            String name = StringUtils.remove(originalName, fileExt);
            fileInfo.setFileName(name);
            fileInfo.setFileExt(fileExt);
            fileInfo.setFilePath(pathD);
            fileInfo.setFileIconUrl("img/blog/file-text.jpg");
            //根据后缀名设置
            if(".txt".equals(fileExt)){
                fileInfo.setFileIconUrl("img/blog/folder-yellow.jpg");
            }
            fileInfo.setFileSize(new Long(file.getSize()).intValue());
            fileInfo.setFileCreateDate(new Date());
            fileInfo.setIsDelete(0);
            File file2 = new File(path1);
            fileInfo.setIsFolder(0);
            if(file2.isDirectory()){
                fileInfo.setIsFolder(1);
                fileInfo.setFileIconUrl("img/blog/folder-yellow.jpg");
            }
            fileInfo.setFileDescription("文件");
            iFileInfoService.insertFileInfo(fileInfo);
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(fileInfo);
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File("E://"+path+"/",file.getOriginalFilename()));
            return json;
        }
        return "该文件为空";
    }

    /*@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    public @ResponseBody
    String upload(@RequestParam("file") MultipartFile file,String path, HttpSession session)
            throws IOException {
        BlogUsers user = (BlogUsers) session.getAttribute("logUser");
        if (user == null) {
            return "未登陆，上传失败，请重新登陆！";
        }
        if (!file.isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String originalName = originalFilename;//获取原文件名带后缀
            //把路径插入到数据库user/img/abc.jpg，并存放到服务器硬盘上
            String pathD = path+"/"+originalFilename;
            path = path.replace("/","\\");

            File file1 = new File(realPath + File.separator +path+"\\");
            if(!file1.exists()){
                file1.mkdirs();
            }
            String path1 = realPath + File.separator + path + "\\" + originalName;
            copyFile(file, path1);
            //copyFile(file, realPath + File.separator +path+"\\");
            FileInfo fileInfo = new FileInfo();
            String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
            String name = StringUtils.remove(originalName, fileExt);
            fileInfo.setFileName(name);
            fileInfo.setFileExt(fileExt);
            fileInfo.setFilePath(pathD);
            fileInfo.setFileIconUrl("img/blog/file-text.jpg");
            //根据后缀名设置
            if(".txt".equals(fileExt)){
                fileInfo.setFileIconUrl("img/blog/folder-yellow.jpg");
            }
            fileInfo.setFileSize(new Long(file.getSize()).intValue());
            fileInfo.setFileCreateDate(new Date());
            fileInfo.setIsDelete(0);
            File file2 = new File(path1);
            fileInfo.setIsFolder(0);
            if(file2.isDirectory()){
                fileInfo.setIsFolder(1);
                fileInfo.setFileIconUrl("img/blog/folder-yellow.jpg");
            }
            fileInfo.setFileDescription("文件");
            iFileInfoService.insertFileInfo(fileInfo);
            *//*pathD = fileInfo.getFilePath().replace("/","@");
            fileInfo.setFileIconUrl(pathD);*//*
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(fileInfo);
            return json;
        } else {
            return "该文件为空";//加/在webapp下，不加在views
        }
    }*/

}
