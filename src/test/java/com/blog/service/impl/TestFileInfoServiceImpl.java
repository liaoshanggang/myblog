package com.blog.service.impl;

import com.blog.mapper.FileInfoMapper;
import com.blog.service.IFileInfoService;
import com.blog.util.ZIPUtil;
import com.blog.vo.FileInfo;
import com.blog.vo.MyMap;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.FileSystemUtils;

import javax.annotation.Resource;
import java.io.File;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestFileInfoServiceImpl {
    static Logger logger = Logger.getLogger(TestFileInfoServiceImpl.class);
    @Resource
    IFileInfoService iFileInfoService;
    private String realPath = "E:\\";
    @Resource
    FileInfoMapper fileInfoMapper;
    @Deprecated
    @Test
    public void testZIPUtil() {
        String parentDirPath = "user/files";
        String reParentDirPath = parentDirPath.replace("/","\\");//相对E://父路径
        String fileDirPath = "E:\\" + reParentDirPath+"\\";//绝对路径
        //String fileDirPath = "E:/" + parentDirPath+"/";//绝对路径
        //2个源文件
//        String filePath1 = fileDirPath + "文件夹1/";
//        String filePath2 = fileDirPath + "文件夹2/";
        String filePath1 = fileDirPath + "30d15870-ab1f-48d9-b2f0-b5f3ef72012d.zip";
        String filePath2 = fileDirPath + "3840eff4-5891-4ee4-a3b5-e4cc3f1896db.zip";
        String fileZipPath = fileDirPath + "a.zip";
        File f1=new File(filePath1);
        File f2=new File(filePath2);
        File[] srcfile={f1,f2};
        //压缩后的文件
        File zipfile=new File(fileZipPath);
        ZIPUtil.zipFiles(srcfile, zipfile);
        //需要解压缩的文件
        //File file=new File(fileZipPath);
        //解压后的目标目录
        //String dir=fileDirPath;
        //ZIPUtil.unZipFiles(file, dir);
    }
    @Deprecated
    @Test
    public void testFun() {
        //输入
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName("新建文件");//新建文件夹 (1)新建文件夹 (2)新建文件夹 (3)新建文件夹  (2)新建文件夹 (1)
        String fileName = fileInfo.getFileName();
        String parentDirPath = "user/files";
        parentDirPath = parentDirPath.replace("/","\\");

        String fileDirPath = realPath + parentDirPath+"\\";
        String path = fileDirPath+ fileInfo.getFileName();
        String name = fun(fileDirPath, fileName);//新建文件夹
        logger.info(name);
    }
//java.lang.StackOverflowError
    public String fun(String fileDirPath,String fileName){
        File file = new File(fileDirPath+fileName);
        String outName = "";
        boolean exists = file.exists();
        if(exists){
            String autoRename = autoRename(fileName);
            outName = autoRename;
            return fun(fileDirPath,outName);
        }else {
            outName = fileName;
            return outName;
        }
    }
    @Deprecated
    @Test
    public void testAutoName() {
        //java如何解析小括号里面的数字字符串-->java如何获取最后一对小括号
        //最后一个字符是)，往前匹配都是是数字的话，直到前一个字符是(
        String str = "新建文件夹1(((sdfs))(sdfsfs1231)";
        String str2 = "新建文件夹1(((sdfs))(12314rewrwe)(23424)";
        String str3 = "新建文件夹1(((sdfs))(12314rewrwe)(234sdfs24)";
        String str4 = "新建文件夹1(((sdfs))(12314rewrwe)(234sdfs24)(1)";
        String str5 = "新建文件夹1(((sdfs))(12314rewrwe)(234sdfs24)(1ss)";
        String str6 = "新建文件夹1(((sdfs))(12314rewrwe)(234sdfs24)(1ss)s";
        String name = autoRename(str6);
        logger.info(name);

    }

    private static String autoRename(String name) {
        char[] chars = name.toCharArray();
        boolean isLeftBracket = false;
        boolean isDigit = false;
        boolean isRightBracket = false;
        int index = 0;
        String lastChar1 = String.valueOf(chars[chars.length-1]);
        char lastChar2 = chars[chars.length - 2];
        if(")".equals(lastChar1)){
            isRightBracket=true;
            if("(".equals(lastChar2)){
                isLeftBracket = false;
            }else{
                for (int i = chars.length-2; i >0 ; i--) {
                    if(Character.isDigit(chars[i])){
                        isDigit=true;
                    }else {
                        isDigit=false;
                        break;
                    }
                    if(Character.isDigit(chars[i-1])){//判断连续两个是否为数字
                        isDigit=true;
                        continue;
                    }else {
                        if("(".equals(String.valueOf(chars[i-1]))){
                            index = i-1;
                            isLeftBracket = true;
                        }else {
                            isLeftBracket = false;
                            break;
                        }
                    }
                    if(isDigit&&isLeftBracket){
                        break;
                    }
                }
            }
        }

        if(isLeftBracket&&isDigit&&isRightBracket){
            int num = Integer.parseInt(name.substring(index + 1, chars.length - 1));
            name = name.substring(0, index);
            logger.info(num);
            num++;
            name = name +"("+ num +")";
        }else{
            name = name + " (1)";
        }
        return name;
    }
    @Deprecated
    @Test
    public void main() {
        String str = "[CR,(1,1),(2,2)]";
        Pattern p = Pattern.compile("[0-9]+");
        Matcher m = p.matcher(str);
        while(m.find()){
            System.out.println(m.group());
        }

    }
    @Deprecated
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
    @Deprecated
    @Test
    public void selDirByPathAndType() {
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFilePath("user/files");
        logger.info(fileInfoMapper.selDirByPathAndType(fileInfo));
    }
    @Deprecated
    @Test
    public void test() {
        for(int i=0;i<10;i++){
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            System.out.println(uuid);
        }
    }
    @Deprecated
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
    @Deprecated
    @Test
    public void selectFileInfoByPath(){
        FileInfo info = new FileInfo();
        info.setFilePath("user");//user/文件夹1
        List<FileInfo> fileInfos = iFileInfoService.selectFileInfoByPath(info);
        for (FileInfo file : fileInfos) {
            logger.info(file);
        }
    }
    @Deprecated
    @Test
    public void selectFileInfoByPath2(){
        //String path = "E:\\user\\files";
        //String path = "E:/user/files";
        /*
        File file = new File(path);
        if(file.isDirectory()){
            File[] files = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                //logger.info(i+"name=="+files[i].getName());
                logger.info(i+"absolutePath=="+files[i].getAbsolutePath());
                //logger.info(i+"path=="+files[i].getPath());
            }
        }*/
        /*String path = "/user/files";
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFilePath(path);
        List<FileInfo> fileInfoList = iFileInfoService.selectFileByPath(fileInfo);
        for (FileInfo f: fileInfoList) {
            logger.info("====="+f);
        }*/
       /* String path = "user/files/file/file/file";
        String[] splits = path.split("/");
        String[] key = new String[splits.length];
        String[] value = new String[splits.length];
        for (int i = 0; i < splits.length; i++) {
            String path2 = "";
            for (int j = 0; j <= i; j++) {
                path2 = path2 +splits[j]+"/";
            }
            key[i] = splits[i];
            value[i] = path2;
        }
        for (int i = 0; i < splits.length; i++) {
            logger.info(key[i]+"==="+value[i]);
        }*/
       List<MyMap> list = new ArrayList<>();
        String path = "user/files/file/file/file";
        String[] splits = path.split("/");
        for (int i = 0; i < splits.length; i++) {
            String path2 = "";
            for (int j = 0; j <= i; j++) {
                path2 = path2 +splits[j]+"/";
            }
           MyMap myMap = new MyMap(splits[i],path2);
            list.add(myMap);
        }
        for (MyMap my:list) {
            logger.info(my);
        }
    }

}
