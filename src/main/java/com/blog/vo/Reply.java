package com.blog.vo;

import java.util.Date;

public class Reply {
    private Integer replyId;

    private Integer replyComtId;

    private String replyContent;

    private Date replyTime;

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Integer getReplyComtId() {
        return replyComtId;
    }

    public void setReplyComtId(Integer replyComtId) {
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

    public Reply(Integer replyId, Integer replyComtId, String replyContent, Date replyTime) {
        this.replyId = replyId;
        this.replyComtId = replyComtId;
        this.replyContent = replyContent;
        this.replyTime = replyTime;
    }

    public Reply() {
        super();
    }

    @Override
    public String toString() {
        return "Reply{" +
                "replyId=" + replyId +
                ", replyComtId=" + replyComtId +
                ", replyContent='" + replyContent + '\'' +
                ", replyTime=" + replyTime +
                '}';
    }
}