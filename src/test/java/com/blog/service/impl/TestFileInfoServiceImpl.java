package com.blog.service.impl;

import com.blog.mapper.FileInfoMapper;
import com.blog.service.IFileInfoService;
import com.blog.vo.FileInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.FileSystemUtils;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestFileInfoServiceImpl {
    static Logger logger = Logger.getLogger(TestFileInfoServiceImpl.class);
    @Resource
    IFileInfoService iFileInfoService;
    private String realPath = "E:\\";
    @Resource
    FileInfoMapper fileInfoMapper;

    @Test
    public void isExit() {
        //user/files/文件夹1/b71fd869-b711-4aa5-b67d-8a0f133966fe.zip
        //user/files/文件夹2
        /*realPath = realPath+"user/files/文件夹2";
        realPath = realPath.replace("/","\\");
        File file = new File(realPath);
        logger.info(file.exists());*/
        //输入上传目录和文件名
        //输入的文件名
        String uploadPathDir = "user/files/文件夹1";
        String originalFileName = "Docker for Windows Installer";
        JudFileIsExits(uploadPathDir,originalFileName);
    }

    private boolean JudFileIsExits(String uploadPathDir,String originalFileName) {
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName(originalFileName);
        List<FileInfo> fileInfos = fileInfoMapper.selFileByFileName(fileInfo);
        boolean flag = false;
        //解析出数据库的上传目录是否和输入的相同
        for (FileInfo fi:fileInfos) {
            String filePath = fi.getFilePath();//user/files/文件夹1/b71fd869-b711-4aa5-b67d-8a0f133966fe.zip
            String[] splits = StringUtils.split(filePath, "/");
            for (int i = 0; i < splits.length; i++) {
                System.out.println(splits[i]);
            }
            String remove = "/"+splits[splits.length-1];
            String strs = StringUtils.remove(filePath, remove);
            if(strs.equals(uploadPathDir)){//只要存在一个就退出
                flag = true;
                logger.info(strs);
                break;
            }
        }
        return flag;
    }

    @Test
    public void selDirByPathAndType() {
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFilePath("user/files");
        logger.info(fileInfoMapper.selDirByPathAndType(fileInfo));
    }

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
