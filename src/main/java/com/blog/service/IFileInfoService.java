package com.blog.service;

import com.blog.vo.FileInfo;

import java.util.List;

public interface IFileInfoService {
    List<FileInfo> selectFileInfoByPath(FileInfo fileInfo);
    List<FileInfo> selectFileByPath(FileInfo fileInfo);
    void insertFileInfo(FileInfo fileInfo,String uploadPathDir);

    boolean batchDelFile(int[] delID,String path);

    List<FileInfo> batchSelFile(int[] delID);

    FileInfo selDirByPathAndType(FileInfo fileInfo);

    List<FileInfo> selFileByFileName(FileInfo fileInfo);

    FileInfo selFileIById(FileInfo fileInfo);
}
