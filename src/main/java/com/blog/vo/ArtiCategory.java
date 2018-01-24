package com.blog.vo;

import java.math.BigDecimal;

public class ArtiCategory {
    private BigDecimal catgId;

    private String catgName;

    public BigDecimal getCatgId() {
        return catgId;
    }

    public void setCatgId(BigDecimal catgId) {
        this.catgId = catgId;
    }

    public String getCatgName() {
        return catgName;
    }

    public void setCatgName(String catgName) {
        this.catgName = catgName == null ? null : catgName.trim();
    }
}