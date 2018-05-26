package com.blog.service.impl;

import com.blog.service.IFileInfoService;
import com.blog.vo.FileInfo;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.*;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestFileInfoServiceImpl {
    static Logger logger = Logger.getLogger(TestFileInfoServiceImpl.class);
    @Resource
    IFileInfoService iFileInfoService;
    private String realPath = "E:\\";

    @Test
    public void test() {
        for(int i=0;i<10;i++){
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            System.out.println(uuid);
        }
    }

    @Test
    public void batchSelFileTest(){
        int delID[] = {1,2,3};
        List<FileInfo> fileInfos = iFileInfoService.batchSelFile(delID);
        for (FileInfo fileInfo : fileInfos) {
            logger.info(fileInfo);
        }
    }

    @Deprecated
    @Test
    public void deleteRecursivelyTest(){
        //realPath = realPath +"user/files/bg003.jpg";
        realPath = realPath +"user/files/sdf";
        realPath = realPath.replace("/","\\");
        File file = new File(realPath);
        FileSystemUtils.deleteRecursively(file);
    }

    @Test
    public void selectFileInfoByPath(){
        FileInfo info = new FileInfo();
        info.setFilePath("user");//user/文件夹1
        List<FileInfo> fileInfos = iFileInfoService.selectFileInfoByPath(info);
        for (FileInfo file : fileInfos) {
            logger.info(file);
        }
    }

}
