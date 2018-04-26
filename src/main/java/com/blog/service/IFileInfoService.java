package com.blog.service;

import com.blog.vo.FileInfo;

import java.util.List;

public interface IFileInfoService {
    List<FileInfo> selectFileInfoByPath(FileInfo fileInfo);
    void insertFileInfo(FileInfo fileInfo);
}
