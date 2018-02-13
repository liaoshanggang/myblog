package com.blog.vo;

import java.util.Date;

public class Reply {
    private Integer replyId;

    private Integer replyComtId;

    private Integer replyUserId;

    private String replyContent;

    private Date replyTime;

    private BlogUsers bu;

    public BlogUsers getBu() {
        return bu;
    }

    public void setBu(BlogUsers bu) {
        this.bu = bu;
    }

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

    public Integer getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(Integer replyUserId) {
        this.replyUserId = replyUserId;
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