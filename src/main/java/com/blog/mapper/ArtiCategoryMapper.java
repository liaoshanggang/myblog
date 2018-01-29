package com.blog.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.blog.vo.ArtiCategory;
@Repository
public interface ArtiCategoryMapper {
	public List<ArtiCategory> selectAllCategory();
}