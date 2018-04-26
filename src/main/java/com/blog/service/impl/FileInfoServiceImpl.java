package com.blog.service.impl;

import com.blog.mapper.FileInfoMapper;
import com.blog.service.IFileInfoService;
import com.blog.vo.FileInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
    public void insertFileInfo(FileInfo fileInfo) {
        fileInfoMapper.insertFileInfo(fileInfo);
    }
}
