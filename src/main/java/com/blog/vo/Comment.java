package com.blog.vo;

import java.util.Date;
import java.util.List;

public class Comment {
    private Integer comtId;

    private Integer comtArtiId;

    private String comtContent;

    private Integer comtUserId;

    private Date comtTime;

    public Integer getComtId() {
        return comtId;
    }

    public void setComtId(Integer comtId) {
        this.comtId = comtId;
    }

    public Integer getComtArtiId() {
        return comtArtiId;
    }

    public void setComtArtiId(Integer comtArtiId) {
        this.comtArtiId = comtArtiId;
    }

    public String getComtContent() {
        return comtContent;
    }

    public void setComtContent(String comtContent) {
        this.comtContent = comtContent == null ? null : comtContent.trim();
    }

    public Integer getComtUserId() {
        return comtUserId;
    }

    public void setComtUserId(Integer comtUserId) {
        this.comtUserId = comtUserId;
    }

    public Date getComtTime() {
        return comtTime;
    }

    public void setComtTime(Date comtTime) {
        this.comtTime = comtTime;
    }

    public Comment() {
        super();
    }

    public Comment(Integer comtId, Integer comtArtiId, String comtContent, Integer comtUserId, Date comtTime) {
        this.comtId = comtId;
        this.comtArtiId = comtArtiId;
        this.comtContent = comtContent;
        this.comtUserId = comtUserId;
        this.comtTime = comtTime;
    }

    public Comment(Integer comtId, Integer comtArtiId, String comtContent, Integer comtUserId, Date comtTime, List<Reply> replies) {
        this.comtId = comtId;
        this.comtArtiId = comtArtiId;
        this.comtContent = comtContent;
        this.comtUserId = comtUserId;
        this.comtTime = comtTime;
        this.replies = replies;
    }

    private List<Reply> replies;

    public List<Reply> getReplies() {
        return replies;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }

    private BlogUsers blogUsers;

    public BlogUsers getBlogUsers() {
        return blogUsers;
    }

    public void setBlogUsers(BlogUsers blogUsers) {
        this.blogUsers = blogUsers;
    }

    private Article article;

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comtId=" + comtId +
                ", comtArtiId=" + comtArtiId +
                ", comtContent='" + comtContent + '\'' +
                ", comtUserId=" + comtUserId +
                ", comtTime=" + comtTime +
                ", replies=" + replies +
                '}';
    }
}