package com.blog.vo;

import java.math.BigDecimal;
import java.util.Date;

public class Album {
    private BigDecimal albumId;

    private String albumName;

    private String albumSrc;

    private String albumDescription;

    private Date uploadTime;

    public BigDecimal getAlbumId() {
        return albumId;
    }

    public void setAlbumId(BigDecimal albumId) {
        this.albumId = albumId;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName == null ? null : albumName.trim();
    }

    public String getAlbumSrc() {
        return albumSrc;
    }

    public void setAlbumSrc(String albumSrc) {
        this.albumSrc = albumSrc == null ? null : albumSrc.trim();
    }

    public String getAlbumDescription() {
        return albumDescription;
    }

    public void setAlbumDescription(String albumDescription) {
        this.albumDescription = albumDescription == null ? null : albumDescription.trim();
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }
}