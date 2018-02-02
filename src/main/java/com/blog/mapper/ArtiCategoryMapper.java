package com.blog.mapper;

import com.blog.vo.ArtiCategory;
import com.blog.vo.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ArtiCategoryMapper {
	public List<ArtiCategory> selectAllCategory();

	public void addArtiCategory(ArtiCategory artiCategory);

	int countForSelective(Page<ArtiCategory> page);

	List<ArtiCategory> selectSelective(Page<ArtiCategory> page);

    void updateArtiCategoryById(ArtiCategory category);

    void deleteArtiCategoryById(ArtiCategory category);
}