package com.blog.service;

import com.blog.vo.Comment;
import com.blog.vo.Page;
import com.blog.vo.RdPage;

import java.util.List;

public interface ICommentService {
    void insertComment(Comment comment);

    List<Comment> selectSelective(Page<Comment> page);

    int countForSelective(Page<Comment> comments);

    List<Comment> selectSelective2(RdPage<Comment> page);

    int countForSelective2(RdPage<Comment> comments);
}
