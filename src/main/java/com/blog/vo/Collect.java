package com.blog.vo;

public class Collect {
    private Integer coltId;

    private Integer coltUserId;

    private String coltTitle;

    private String linkUrl;

    private String coltDescription;

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
}