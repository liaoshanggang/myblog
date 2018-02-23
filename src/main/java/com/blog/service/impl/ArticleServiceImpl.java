package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.blog.mapper.VisitorMapper;
import com.blog.vo.Visitor;
import org.springframework.stereotype.Service;

import com.blog.mapper.ArticleMapper;
import com.blog.service.IArticleService;
import com.blog.vo.Article;
import com.blog.vo.Page;


@Service("articleService")
public class ArticleServiceImpl implements IArticleService {

	@Resource
	ArticleMapper articleMapper;
	@Resource
	VisitorMapper visitorMapper;
	
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

	@Override
	public void deleteArticleById(Article article) {
		articleMapper.deleteArticleById(article.getArtiId());
	}

	/*按ip计算访问量*/
	@Override
	public Article selectArticleById(Article article,String ip) {
		Visitor v = new Visitor();
		v.setVisitorIp(ip);
		v.setArtiId(article.getArtiId());
		List<Visitor> visitors = visitorMapper.selectVisitorByAid(v);
		if(visitors.size()<1){
			visitorMapper.addVisitor(v);
		}else{
			boolean flag = false;
			for (Visitor v2: visitors) {
				if(ip.equals(v2.getVisitorIp())){//如果存在
					flag = true;
					break;
				}
			}
			if(!flag){
				visitorMapper.addVisitor(v);
			}
		}
		//Integer pageView = visitorMapper.countPageViewByAid(v);
		//article.setArtiPageView(pageView);
		Article article1 = articleMapper.selectArticleById(article.getArtiId());
		if(article1.getArtiPageView()==null){
			article.setArtiPageView(1);
		}else{
			article.setArtiPageView(article1.getArtiPageView()+1);
		}
		this.updateArticleById(article);
		Article article2 = articleMapper.selectArticleById(article.getArtiId());
		return article2;
	}
	/*按点击次数计算访问量，不管ip是不是同一个*/
	@Override
	public Article selectArticleById(Article article) {
		Article article1 = articleMapper.selectArticleById(article.getArtiId());
		if(article1.getArtiPageView()==null){
			article.setArtiPageView(1);
		}else{
			article.setArtiPageView(article1.getArtiPageView()+1);
		}
		this.updateArticleById(article);
		article1 = articleMapper.selectArticleById(article.getArtiId());
		return article1;
	}
	@Override
	public void updateArticleById(Article article){
		articleMapper.updateArticleById(article);
	}

	@Override
	public void updateById(Article article) {
		articleMapper.updateById(article);
	}

	//更新评论数
	@Override
	public void updateArtiComtNumber(Article article){
		Article article1 = articleMapper.selectArticleById(article.getArtiId());
		if(article1.getArtiComtNumber()==null){
			article.setArtiComtNumber(1);
		}else{
			article.setArtiComtNumber(article1.getArtiComtNumber()+1);
		}
		this.updateArticleById(article);
	}

}
