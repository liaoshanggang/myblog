package com.blog.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.blog.vo.Article;
import com.blog.vo.Page;
@Repository
public interface ArticleMapper {
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

	public void deleteArticleById(Integer artiId);

	public Article selectArticleById(Integer integer);

	public void updateArticleById(Article article);
}