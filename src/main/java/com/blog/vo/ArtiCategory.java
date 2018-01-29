package com.blog.vo;

public class ArtiCategory {
	private Integer catgId;

	private String catgName;

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

	public ArtiCategory(Integer catgId, String catgName) {
		super();
		this.catgId = catgId;
		this.catgName = catgName;
	}

}