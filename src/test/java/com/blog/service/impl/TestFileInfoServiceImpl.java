package com.blog.service.impl;

import com.blog.service.IFileInfoService;
import com.blog.vo.FileInfo;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.*;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestFileInfoServiceImpl {
    static Logger logger = Logger.getLogger(TestFileInfoServiceImpl.class);
    @Resource
    IFileInfoService iFileInfoService;

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
