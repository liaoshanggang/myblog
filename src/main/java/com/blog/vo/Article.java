package com.blog.vo;

import java.util.Date;

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

    
    
}