package com.blog.vo;

import java.util.Date;

public class FileInfo {
    private Integer fileId;

    private String fileName;

    private String fileExt;

    private String filePath;

    private String fileIconUrl;

    private Integer fileSize;

    private Date fileModifyDate;

    private Date fileCreateDate;

    private Integer isDelete;

    private Integer isFolder;

    private Integer parentId;

    private String fileDescription;

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFileExt() {
        return fileExt;
    }

    public void setFileExt(String fileExt) {
        this.fileExt = fileExt == null ? null : fileExt.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getFileIconUrl() {
        return fileIconUrl;
    }

    public void setFileIconUrl(String fileIconUrl) {
        this.fileIconUrl = fileIconUrl == null ? null : fileIconUrl.trim();
    }

    public Integer getFileSize() {
        return fileSize;
    }

    public void setFileSize(Integer fileSize) {
        this.fileSize = fileSize;
    }

    public Date getFileModifyDate() {
        return fileModifyDate;
    }

    public void setFileModifyDate(Date fileModifyDate) {
        this.fileModifyDate = fileModifyDate;
    }

    public Date getFileCreateDate() {
        return fileCreateDate;
    }

    public void setFileCreateDate(Date fileCreateDate) {
        this.fileCreateDate = fileCreateDate;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getIsFolder() {
        return isFolder;
    }

    public void setIsFolder(Integer isFolder) {
        this.isFolder = isFolder;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getFileDescription() {
        return fileDescription;
    }

    public void setFileDescription(String fileDescription) {
        this.fileDescription = fileDescription == null ? null : fileDescription.trim();
    }

    public FileInfo() {
        super();
    }

    public FileInfo(Integer fileId, String fileName, String fileExt, String filePath, String fileIconUrl, Integer fileSize, Date fileModifyDate, Date fileCreateDate, Integer isDelete, Integer isFolder, Integer parentId, String fileDescription) {
        this.fileId = fileId;
        this.fileName = fileName;
        this.fileExt = fileExt;
        this.filePath = filePath;
        this.fileIconUrl = fileIconUrl;
        this.fileSize = fileSize;
        this.fileModifyDate = fileModifyDate;
        this.fileCreateDate = fileCreateDate;
        this.isDelete = isDelete;
        this.isFolder = isFolder;
        this.parentId = parentId;
        this.fileDescription = fileDescription;
    }

    @Override
    public String toString() {
        return "FileInfo{" +
                "fileId=" + fileId +
                ", fileName='" + fileName + '\'' +
                ", fileExt='" + fileExt + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileIconUrl='" + fileIconUrl + '\'' +
                ", fileSize=" + fileSize +
                ", fileModifyDate=" + fileModifyDate +
                ", fileCreateDate=" + fileCreateDate +
                ", isDelete=" + isDelete +
                ", isFolder=" + isFolder +
                ", parentId=" + parentId +
                ", fileDescription='" + fileDescription + '\'' +
                '}';
    }
}