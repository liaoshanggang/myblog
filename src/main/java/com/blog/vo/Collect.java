package com.blog.vo;

import java.util.Date;

public class Collect {
    private Integer coltId;

    private Integer coltUserId;

    private String coltTitle;

    private String linkUrl;

    private String coltDescription;

    private Date coltTime;

    public Date getColtTime() {
        return coltTime;
    }

    public void setColtTime(Date coltTime) {
        this.coltTime = coltTime;
    }

    public Integer getColtId() {
        return coltId;
    }

    public void setColtId(Integer coltId) {
        this.coltId = coltId;
    }

    public Integer getColtUserId() {
        return coltUserId;
    }

    public void setColtUserId(Integer coltUserId) {
        this.coltUserId = coltUserId;
    }

    public String getColtTitle() {
        return coltTitle;
    }

    public void setColtTitle(String coltTitle) {
        this.coltTitle = coltTitle == null ? null : coltTitle.trim();
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl == null ? null : linkUrl.trim();
    }

    public String getColtDescription() {
        return coltDescription;
    }

    public void setColtDescription(String coltDescription) {
        this.coltDescription = coltDescription == null ? null : coltDescription.trim();
    }

    public Collect() {
        super();
    }

    public Collect(Integer coltId, Integer coltUserId, String coltTitle, String linkUrl, String coltDescription, Date coltTime) {
        this.coltId = coltId;
        this.coltUserId = coltUserId;
        this.coltTitle = coltTitle;
        this.linkUrl = linkUrl;
        this.coltDescription = coltDescription;
        this.coltTime = coltTime;
    }
}