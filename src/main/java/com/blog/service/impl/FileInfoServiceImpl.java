package com.blog.service.impl;

import com.blog.mapper.FileInfoMapper;
import com.blog.service.IFileInfoService;
import com.blog.vo.FileInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;

import javax.annotation.Resource;
import java.io.File;
import java.util.ArrayList;
import java.util.List;


@Service("fileInfoService")
public class FileInfoServiceImpl implements IFileInfoService {
    @Resource
    FileInfoMapper fileInfoMapper;

    @Override
    public List<FileInfo> selectFileInfoByPath(FileInfo fileInfo) {
        List<FileInfo> files = new ArrayList<>();
        List<FileInfo> fileInfos = fileInfoMapper.selectFileInfoByPath(fileInfo);
        for (FileInfo file : fileInfos) {
            String filePath = file.getFilePath();
            if(filePath.equals(fileInfo.getFilePath())){
                continue;
            }
            String split = StringUtils.substringAfter(filePath, fileInfo.getFilePath() + "/");
            String[] paths = split.split("/");
            if (paths.length == 1) {
                files.add(file);
            }
        }
        return files;
    }


    @Override
    public FileInfo selDirByPathAndType(FileInfo fileInfo) {
        return fileInfoMapper.selDirByPathAndType(fileInfo);
    }

    @Override
    public List<FileInfo> selFileByFileName(FileInfo fileInfo) {
        return fileInfoMapper.selFileByFileName(fileInfo);
    }

    @Override
    public void insertFileInfo(FileInfo fileInfo,String uploadPathDir) {
        //设置父目录id
        FileInfo fi = new FileInfo();
        fi.setFilePath(uploadPathDir);
        FileInfo fi2 = this.selDirByPathAndType(fi);
        fileInfo.setParentId(fi2.getFileId());
        fileInfoMapper.insertFileInfo(fileInfo);
    }

    @Override
    public boolean batchDelFile(int[] delID,String realPath) {
        //要同时删除硬盘上文件
        boolean flag = false;
        List<FileInfo> fileInfos = this.batchSelFile(delID);
        for (FileInfo fileInfo : fileInfos) {
            flag = deleteFileInfo(realPath+fileInfo.getFilePath());
            if(!flag){//只要有一个删除不了就退出
                flag = false;
                break;
            }
        }
        if(flag){
            fileInfoMapper.batchDelFile(delID);
            return flag;
        }
        return flag;
    }
    private boolean deleteFileInfo(String path) {
        path = path.replace("/","\\");
        //删除了E://
        File file = new File(path);
        return FileSystemUtils.deleteRecursively(file);
    }
    @Override
    public List<FileInfo> batchSelFile(int[] delID) {
        return fileInfoMapper.batchSelFile(delID);
    }
}
