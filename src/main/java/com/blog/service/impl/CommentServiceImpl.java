package com.blog.service.impl;

import com.blog.mapper.CommentMapper;
import com.blog.service.ICommentService;
import com.blog.vo.Article;
import com.blog.vo.Comment;
import com.blog.vo.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("commentService")
public class CommentServiceImpl implements ICommentService {
    @Resource
    CommentMapper commentMapper;
    @Override
    public void insertComment(Comment comment) {
        commentMapper.insertComment(comment);
    }

    @Override
    public List<Comment> selectSelective(Page<Comment> page) {
        return commentMapper.selectSelective(page);
    }

    @Override
    public int countForSelective(Page<Comment> comment) {
        return commentMapper.countForSelective(comment);
    }

}
