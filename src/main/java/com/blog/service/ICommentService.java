package com.blog.service;

import com.blog.vo.Comment;
import com.blog.vo.Page;

import java.util.List;

public interface ICommentService {
    void insertComment(Comment comment);

    List<Comment> selectSelective(Page<Comment> page);

    int countForSelective(Page<Comment> comments);
}
