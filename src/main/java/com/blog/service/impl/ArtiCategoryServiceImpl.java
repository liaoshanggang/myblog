package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.mapper.ArtiCategoryMapper;
import com.blog.service.IArtiCategoryService;
import com.blog.vo.ArtiCategory;


@Service("artiCategoryService")
public class ArtiCategoryServiceImpl implements IArtiCategoryService {
	@Resource
	ArtiCategoryMapper artiCategoryMapper;
	@Override
	public List<ArtiCategory> selectAllCategory() {
		return artiCategoryMapper.selectAllCategory();
	}

	
}
