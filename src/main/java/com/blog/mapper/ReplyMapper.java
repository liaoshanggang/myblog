package com.blog.mapper;

import com.blog.vo.Reply;
import org.springframework.stereotype.Repository;
@Repository
public interface ReplyMapper {

    void insertReply(Reply reply);

    Integer countForComment(Reply reply);
}