package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.mapper.ArticleMapper;
import com.blog.service.IArticleService;
import com.blog.vo.Article;
import com.blog.vo.Page;


@Service("articleService")
public class ArticleServiceImpl implements IArticleService {

	@Resource
	ArticleMapper articleMapper;
	
	@Override
	public void addArticle(Article article) {
		articleMapper.addArticle(article);
	}

	@Override
	public List<Article> selectSelective(Page<Article> articles) {
		return articleMapper.selectSelective(articles);
	}

	@Override
	public int countForSelective(Page<Article> articles) {
		return articleMapper.countForSelective(articles);
	}

	
}
