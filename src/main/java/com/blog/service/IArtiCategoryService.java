package com.blog.service;

import java.util.List;

import com.blog.vo.ArtiCategory;
import com.blog.vo.Page;

public interface IArtiCategoryService {
	List<ArtiCategory> selectAllCategory();
	void addArtiCategory(ArtiCategory artiCategory);

    int countForSelective(Page<ArtiCategory> page);

	List<ArtiCategory> selectSelective(Page<ArtiCategory> page);

    void updateArtiCategoryById(ArtiCategory category);

    void deleteArtiCategoryById(ArtiCategory category);
}
