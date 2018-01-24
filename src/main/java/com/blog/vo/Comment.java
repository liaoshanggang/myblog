package com.blog.vo;

import java.math.BigDecimal;
import java.util.Date;

public class Comment {
    private BigDecimal comtId;

    private BigDecimal comtArtiId;

    private String comtContent;

    private BigDecimal comtUserId;

    private Date comtTime;

    public BigDecimal getComtId() {
        return comtId;
    }

    public void setComtId(BigDecimal comtId) {
        this.comtId = comtId;
    }

    public BigDecimal getComtArtiId() {
        return comtArtiId;
    }

    public void setComtArtiId(BigDecimal comtArtiId) {
        this.comtArtiId = comtArtiId;
    }

    public String getComtContent() {
        return comtContent;
    }

    public void setComtContent(String comtContent) {
        this.comtContent = comtContent == null ? null : comtContent.trim();
    }

    public BigDecimal getComtUserId() {
        return comtUserId;
    }

    public void setComtUserId(BigDecimal comtUserId) {
        this.comtUserId = comtUserId;
    }

    public Date getComtTime() {
        return comtTime;
    }

    public void setComtTime(Date comtTime) {
        this.comtTime = comtTime;
    }
}