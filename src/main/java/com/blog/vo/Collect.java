package com.blog.vo;

import java.math.BigDecimal;

public class Collect {
    private BigDecimal coltId;

    private BigDecimal coltUserId;

    private String coltTitle;

    private String linkUrl;

    private String coltDescription;

    public BigDecimal getColtId() {
        return coltId;
    }

    public void setColtId(BigDecimal coltId) {
        this.coltId = coltId;
    }

    public BigDecimal getColtUserId() {
        return coltUserId;
    }

    public void setColtUserId(BigDecimal coltUserId) {
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