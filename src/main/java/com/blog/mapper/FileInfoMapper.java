package com.blog.mapper;

import com.blog.vo.FileInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileInfoMapper {
    List<FileInfo> selectFileInfoByPath(FileInfo fileInfo);

    void insertFileInfo(FileInfo fileInfo);
}