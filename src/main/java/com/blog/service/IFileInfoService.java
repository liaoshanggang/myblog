package com.blog.service;

import com.blog.vo.FileInfo;

import java.util.List;

public interface IFileInfoService {
    List<FileInfo> selectFileInfoByPath(FileInfo fileInfo);
    void insertFileInfo(FileInfo fileInfo);

    boolean batchDelFile(int[] delID,String path);

    List<FileInfo> batchSelFile(int[] delID);
}
