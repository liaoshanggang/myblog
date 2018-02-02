package com.blog.vo;

import java.util.Date;

public class ArtiCategory {
	private Integer catgId;

	private String catgName;

	private Date catgTime;

	public Date getCatgTime() {
		return catgTime;
	}

	public void setCatgTime(Date catgTime) {
		this.catgTime = catgTime;
	}

	public Integer getCatgId() {
		return catgId;
	}

	public void setCatgId(Integer catgId) {
		this.catgId = catgId;
	}

	public String getCatgName() {
		return catgName;
	}

	public void setCatgName(String catgName) {
		this.catgName = catgName == null ? null : catgName.trim();
	}

	public ArtiCategory() {
		super();
	}

	public ArtiCategory(Integer catgId, String catgName, Date catgTime) {
		this.catgId = catgId;
		this.catgName = catgName;
		this.catgTime = catgTime;
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

	public ArtiCategory(Integer catgId, String catgName, Date catgTime, String beginDate, String endDate) {
		this.catgId = catgId;
		this.catgName = catgName;
		this.catgTime = catgTime;
		this.beginDate = beginDate;
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "ArtiCategory{" +
				"catgId=" + catgId +
				", catgName='" + catgName + '\'' +
				", catgTime=" + catgTime +
				", beginDate='" + beginDate + '\'' +
				", endDate='" + endDate + '\'' +
				'}';
	}
}