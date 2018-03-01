package com.blog.service;

import com.blog.vo.Reply;

public interface IReplyService {

    void insertReply(Reply reply);

    Integer countForComment(Reply reply);

    void updateReplyById(Reply reply);

    void deleteReplyById(Reply reply);
}
