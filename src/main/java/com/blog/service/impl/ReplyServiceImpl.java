package com.blog.service.impl;

import com.blog.mapper.ReplyMapper;
import com.blog.vo.Reply;
import org.springframework.stereotype.Service;

import com.blog.service.IReplyService;

import javax.annotation.Resource;


@Service("replyService")
public class ReplyServiceImpl implements IReplyService {
    @Resource
    ReplyMapper replyMapper;

    @Override
    public void insertReply(Reply reply) {
        replyMapper.insertReply(reply);
    }
}
