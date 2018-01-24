package com.blog.vo;

import java.math.BigDecimal;
import java.util.Date;

public class Reply {
    private BigDecimal replyId;

    private BigDecimal replyComtId;

    private String replyContent;

    private Date replyTime;

    public BigDecimal getReplyId() {
        return replyId;
    }

    public void setReplyId(BigDecimal replyId) {
        this.replyId = replyId;
    }

    public BigDecimal getReplyComtId() {
        return replyComtId;
    }

    public void setReplyComtId(BigDecimal replyComtId) {
        this.replyComtId = replyComtId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent == null ? null : replyContent.trim();
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }
}