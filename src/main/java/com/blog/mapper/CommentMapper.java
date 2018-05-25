package com.blog.mapper;

import com.blog.vo.Comment;
import com.blog.vo.Page;
import com.blog.vo.RdPage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {

    void insertComment(Comment comment);

    List<Comment> selectSelective(Page<Comment> comments);

    int countForSelective(Page<Comment> comments);

    List<Comment> selectSelective2(RdPage<Comment> page);

    int countForSelective2(RdPage<Comment> comment);

    List<Comment> selectForCommentArticle(Page<Comment> page);

    int countForCommentArticle(Page<Comment> comments);

    void deleteCommentById(Integer comtId);

    void updateCommentById(Comment comment);
}