package com.blog.vo;

import java.io.File;

/**
 * 文件上传包装类
 */
public class FileInfo {

    /**文件*/
    public File file;
    /**文件大小*/
    public String fileSize;
    /**文件md5*/
    public String fileMD5;
    /**存在服务器的名称*/
    public String fullFileName;
    /**原名称 带后缀*/
    public String originalFileName;
    /**原名称*/
    public String fileName;
    /**后缀名*/
    public String suffixName;

    public File getFile() {
        return file;
    }

    public FileInfo setFile(File file) {
        this.file = file;return this;
    }

    public String getFileSize() {
        return fileSize;
    }

    public FileInfo setFileSize(String fileSize) {
        this.fileSize = fileSize;return this;
    }

    public String getFileMD5() {
        return fileMD5;
    }

    public FileInfo setFileMD5(String fileMD5) {
        this.fileMD5 = fileMD5;return this;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public FileInfo setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;return this;
    }

    public String getFileName() {
        return fileName;
    }

    public FileInfo setFileName(String fileName) {
        this.fileName = fileName;return this;
    }

    public String getSuffixName() {
        return suffixName;
    }

    public FileInfo setSuffixName(String suffixName) {
        this.suffixName = suffixName;return this;
    }

    public String getFullFileName() {
        return fullFileName;
    }

    public FileInfo setFullFileName(String fullFileName) {
        this.fullFileName = fullFileName;return this;
    }

    @Override
    public String toString() {
        return "UploadFile{" +
                "(文件)file=" + file +
                ",(文件大小)fileSize='" + fileSize + '\'' +
                ",(文件md5)fileMD5='" + fileMD5 + '\'' +
                ",(文件存在服务器名称)fullFileName='" + fullFileName + '\'' +
                ",(文件原名称带后缀)originalFileName='" + originalFileName + '\'' +
                ",(文件原名称)fileName='" + fileName + '\'' +
                ",(文件后缀)suffixName='" + suffixName + '\'' +
                '}';
    }
}

