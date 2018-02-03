package com.blog.service;

import java.util.List;

import com.blog.vo.Article;
import com.blog.vo.Page;

public interface IArticleService {
	
	public void addArticle(Article article);
	
	/**
	 * 
	 * @param articles
	 * @return
	 */
	public List<Article> selectSelective(Page<Article> articles);
	
	/**
	 * 获得查询文章的总计录数
	 * @param articles
	 * @return
	 */
	public int countForSelective(Page<Article> articles);

	public void deleteArticleById(Article smdQuestions);
	
	public Article selectArticleById(Article article);

	public void updateArticleById(Article article);

	void updateById(Article article);
}
