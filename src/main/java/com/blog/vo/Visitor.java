package com.blog.vo;

import java.math.BigDecimal;
import java.util.Date;

public class Visitor {
    private BigDecimal visitorId;

    private Date visitorTime;

    private String visitorIp;

    private BigDecimal artiId;

    public BigDecimal getVisitorId() {
        return visitorId;
    }

    public void setVisitorId(BigDecimal visitorId) {
        this.visitorId = visitorId;
    }

    public Date getVisitorTime() {
        return visitorTime;
    }

    public void setVisitorTime(Date visitorTime) {
        this.visitorTime = visitorTime;
    }

    public String getVisitorIp() {
        return visitorIp;
    }

    public void setVisitorIp(String visitorIp) {
        this.visitorIp = visitorIp == null ? null : visitorIp.trim();
    }

    public BigDecimal getArtiId() {
        return artiId;
    }

    public void setArtiId(BigDecimal artiId) {
        this.artiId = artiId;
    }
}