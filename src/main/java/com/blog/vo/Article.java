package com.blog.vo;

import java.math.BigDecimal;
import java.util.Date;

public class Article {
    private BigDecimal artiId;

    private String artiTitle;

    private BigDecimal artiCatgId;

    private BigDecimal artiUserId;

    private Date artiTime;

    private BigDecimal artiComtNumber;

    private BigDecimal artiPageView;

    private String artiContent;

    public BigDecimal getArtiId() {
        return artiId;
    }

    public void setArtiId(BigDecimal artiId) {
        this.artiId = artiId;
    }

    public String getArtiTitle() {
        return artiTitle;
    }

    public void setArtiTitle(String artiTitle) {
        this.artiTitle = artiTitle == null ? null : artiTitle.trim();
    }

    public BigDecimal getArtiCatgId() {
        return artiCatgId;
    }

    public void setArtiCatgId(BigDecimal artiCatgId) {
        this.artiCatgId = artiCatgId;
    }

    public BigDecimal getArtiUserId() {
        return artiUserId;
    }

    public void setArtiUserId(BigDecimal artiUserId) {
        this.artiUserId = artiUserId;
    }

    public Date getArtiTime() {
        return artiTime;
    }

    public void setArtiTime(Date artiTime) {
        this.artiTime = artiTime;
    }

    public BigDecimal getArtiComtNumber() {
        return artiComtNumber;
    }

    public void setArtiComtNumber(BigDecimal artiComtNumber) {
        this.artiComtNumber = artiComtNumber;
    }

    public BigDecimal getArtiPageView() {
        return artiPageView;
    }

    public void setArtiPageView(BigDecimal artiPageView) {
        this.artiPageView = artiPageView;
    }

    public String getArtiContent() {
        return artiContent;
    }

    public void setArtiContent(String artiContent) {
        this.artiContent = artiContent == null ? null : artiContent.trim();
    }
}