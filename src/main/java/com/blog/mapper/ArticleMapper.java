package com.blog.mapper;

import org.springframework.stereotype.Repository;

import com.blog.vo.Article;
@Repository
public interface ArticleMapper {
	public void addArticle(Article article);
}