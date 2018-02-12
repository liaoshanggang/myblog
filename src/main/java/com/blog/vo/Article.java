package com.blog.vo;

import java.util.Date;
import java.util.List;

public class Article {
    private Integer artiId;

    private String artiTitle;

    private Integer artiCatgId;

    private Integer artiUserId;

    private Date artiTime;

    private Integer artiComtNumber;

    private Integer artiPageView;

    private String artiContent;

    public Integer getArtiId() {
        return artiId;
    }

    public void setArtiId(Integer artiId) {
        this.artiId = artiId;
    }

    public String getArtiTitle() {
        return artiTitle;
    }

    public void setArtiTitle(String artiTitle) {
        this.artiTitle = artiTitle == null ? null : artiTitle.trim();
    }

    public Integer getArtiCatgId() {
        return artiCatgId;
    }

    public void setArtiCatgId(Integer artiCatgId) {
        this.artiCatgId = artiCatgId;
    }

    public Integer getArtiUserId() {
        return artiUserId;
    }

    public void setArtiUserId(Integer artiUserId) {
        this.artiUserId = artiUserId;
    }

    public Date getArtiTime() {
        return artiTime;
    }

    public void setArtiTime(Date artiTime) {
        this.artiTime = artiTime;
    }

    public Integer getArtiComtNumber() {
        return artiComtNumber;
    }

    public void setArtiComtNumber(Integer artiComtNumber) {
        this.artiComtNumber = artiComtNumber;
    }

    public Integer getArtiPageView() {
        return artiPageView;
    }

    public void setArtiPageView(Integer artiPageView) {
        this.artiPageView = artiPageView;
    }

    public String getArtiContent() {
        return artiContent;
    }

    public void setArtiContent(String artiContent) {
        this.artiContent = artiContent == null ? null : artiContent.trim();
    }

    public Article() {
        super();
    }

    public Article(Integer artiId, String artiTitle, Integer artiCatgId,
                   Integer artiUserId, Date artiTime, Integer artiComtNumber,
                   Integer artiPageView, String artiContent) {
        super();
        this.artiId = artiId;
        this.artiTitle = artiTitle;
        this.artiCatgId = artiCatgId;
        this.artiUserId = artiUserId;
        this.artiTime = artiTime;
        this.artiComtNumber = artiComtNumber;
        this.artiPageView = artiPageView;
        this.artiContent = artiContent;
    }

    private ArtiCategory category;

    public ArtiCategory getCategory() {
        return category;
    }

    public void setCategory(ArtiCategory category) {
        this.category = category;
    }

    private String beginDate;
    private String endDate;

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public Article(Integer artiId, String artiTitle, Integer artiCatgId,
                   Integer artiUserId, Date artiTime, Integer artiComtNumber,
                   Integer artiPageView, String artiContent, ArtiCategory category,
                   String beginDate, String endDate, List<Comment> comments) {
        this.artiId = artiId;
        this.artiTitle = artiTitle;
        this.artiCatgId = artiCatgId;
        this.artiUserId = artiUserId;
        this.artiTime = artiTime;
        this.artiComtNumber = artiComtNumber;
        this.artiPageView = artiPageView;
        this.artiContent = artiContent;
        this.category = category;
        this.beginDate = beginDate;
        this.endDate = endDate;
        this.comments = comments;
    }

    public Article(Integer artiId, String artiTitle, Integer artiCatgId,
                   Integer artiUserId, Date artiTime, Integer artiComtNumber,
                   Integer artiPageView, String artiContent,
                   String beginDate, String endDate) {
        super();
        this.artiId = artiId;
        this.artiTitle = artiTitle;
        this.artiCatgId = artiCatgId;
        this.artiUserId = artiUserId;
        this.artiTime = artiTime;
        this.artiComtNumber = artiComtNumber;
        this.artiPageView = artiPageView;
        this.artiContent = artiContent;
        this.beginDate = beginDate;
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Article [artiId=" + artiId + ", artiTitle=" + artiTitle
                + ", artiCatgId=" + artiCatgId + ", artiUserId=" + artiUserId
                + ", artiTime=" + artiTime + ", artiComtNumber="
                + artiComtNumber + ", artiPageView=" + artiPageView
                + ", artiContent=" + artiContent + ", category=" + category
                + ", beginDate=" + beginDate + ", endDate=" + endDate + "]";
    }

}