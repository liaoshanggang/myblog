package com.blog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.mapper.ArticleMapper;
import com.blog.service.IArticleService;
import com.blog.vo.Article;


@Service("articleService")
public class ArticleServiceImpl implements IArticleService {

	@Resource
	ArticleMapper articleMapper;
	
	@Override
	public void addArticle(Article article) {
		articleMapper.addArticle(article);
	}

	
}
