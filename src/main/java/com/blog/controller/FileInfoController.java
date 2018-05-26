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
import org.springframework.util.FileSystemUtils;
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
import java.util.UUID;

@Controller
@RequestMapping("/fileInfo")
public class FileInfoController {
    static Logger logger = Logger.getLogger(FileInfoController.class);
    @Resource
    IFileInfoService iFileInfoService;
    private final String realPath = "E:\\";
    private final String accessPath = "user/files/";
    private String[] fileIconUrls = {"img/blog/file-text.jpg","img/blog/folder-yellow.jpg"};
    @RequestMapping("/queryByPath")
    public String queryFileInfoByPath(String path , ModelMap modelMap){
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFilePath(path);
        List<FileInfo> fileInfos = iFileInfoService.selectFileInfoByPath(fileInfo);
        modelMap.addAttribute("path",path);
        modelMap.addAttribute("fileInfos",fileInfos);
        return "/manage_file";
    }

    /**
     * HttpServletRequest request, HttpServletResponse response, PrintWriter out; boolean flag = false;
     * @param file
     * @param uploadPathDir
     * @param session
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    public @ResponseBody
    String upload(@RequestParam("file") CommonsMultipartFile file, String uploadPathDir,HttpSession session)
            throws IOException {
        BlogUsers user = (BlogUsers) session.getAttribute("logUser");
        if (user == null) {
            return "未登陆，上传失败，请重新登陆！";
        }
        if (file.getSize() > 0&&!file.isEmpty()) {
            //把文件上传到服务器硬盘上，并把信息插入到数据库
            //原文件的基本信息
            String originalFileNameExt = file.getOriginalFilename();        //原文件名带后缀
            int fileSize = new Long(file.getSize()).intValue();

            //明确一些数据库访问路径的和硬盘路径等信息，数据库1,2,3为数据库文件信息需要的，硬盘1，2，3为上传文件需要的
            String fileExt = originalFileNameExt.substring(originalFileNameExt.lastIndexOf("."));//后缀名==数据库1
            String originalFileName = StringUtils.remove(originalFileNameExt, fileExt);             //原文件名==数据库2
            String uuid = UUID.randomUUID().toString(); //uuid 如：817ba6c6-38ad-4417-aad5-10c1dda36b30
            String newFileNameExt = uuid+fileExt;                                   //新文件名 uuid+后缀===硬盘1
            String filePath = uploadPathDir+"/"+newFileNameExt;                    //存放到数据库的文件相对路径==数据库3
            uploadPathDir = uploadPathDir.replace("/","\\");//转换到window下的分割符//===硬盘2
            String path1 = realPath + File.separator + uploadPathDir + "\\" + originalFileNameExt;//文件目录===硬盘3

            //存信息到数据库
            FileInfo fileInfo = new FileInfo();
            fileInfo.setFileName(originalFileName);
            fileInfo.setFileExt(fileExt);
            fileInfo.setFilePath(filePath);
            fileInfo.setFileSize(fileSize);
            fileInfo.setFileCreateDate(new Date());
            fileInfo.setFileIconUrl(fileIconUrls[0]);//设置默认的
            fileInfo.setIsDelete(0);//设置默认为文件
            fileInfo.setFileDescription("文件");//设置默认为文件

            //根据后缀名设置
            if(".txt".equals(fileExt)){
                fileInfo.setFileIconUrl(fileIconUrls[0]);
            }
            //判断是否为目录
            File file2 = new File(path1);
            fileInfo.setIsFolder(0);
            if(file2.isDirectory()){
                fileInfo.setIsFolder(1);
                fileInfo.setFileIconUrl(fileIconUrls[1]);
                fileInfo.setFileDescription("文件夹");
            }

            //上传文件到服务器硬盘上
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File("E://"+uploadPathDir+"/",newFileNameExt));
            //插入文件信息到数据库
            iFileInfoService.insertFileInfo(fileInfo);

            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(fileInfo);
            //return json;
        }
        return "该文件为空";
    }
    //	批量删除文件信息
    @RequestMapping(value = "batchDelFile", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    public @ResponseBody String delSelectFile(String delId) {
        //删除后链接未改变
        System.out.println(delId);
//		把得到的字符串id数组转换成数字id数组
        String[] delIds = delId.split(",");
        int i = delIds.length;
        int delID[] = new int[i];
        for (int j = 0; j < delIds.length; j++) {
            delID[j] = Integer.parseInt(delIds[j]);
        }
        if(iFileInfoService.batchDelFile(delID,realPath)){
            return "success";
        }
        return "error";
    }
    /*public void copyFile(MultipartFile file, String path) throws IOException {
            InputStream input = file.getInputStream();
            OutputStream out = new FileOutputStream(path);
            byte[] b = new byte[1024];
            while ((input.read(b)) != -1) {
                out.write(b);
            }
            input.close();
            out.close();
        }*/
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
