package com.blog.service.impl;

import com.blog.mapper.ArtiCategoryMapper;
import com.blog.mapper.ArticleMapper;
import com.blog.service.IArtiCategoryService;
import com.blog.vo.ArtiCategory;
import com.blog.vo.Article;
import com.blog.vo.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Service("artiCategoryService")
public class ArtiCategoryServiceImpl implements IArtiCategoryService {
    @Resource
    ArtiCategoryMapper artiCategoryMapper;

    @Override
    public List<ArtiCategory> selectAllCategory() {
        return artiCategoryMapper.selectAllCategory();
    }

    @Override
    public void addArtiCategory(ArtiCategory artiCategory) {
        artiCategoryMapper.addArtiCategory(artiCategory);
    }

    @Override
    public int countForSelective(Page<ArtiCategory> page) {
        return artiCategoryMapper.countForSelective(page);
    }

    @Override
    public List<ArtiCategory> selectSelective(Page<ArtiCategory> page) {
        List<ArtiCategory> categoryList = artiCategoryMapper.selectSelective(page);
        List<ArtiCategory> list = new ArrayList<>();
        for (ArtiCategory category: categoryList) {
            int i = artiCategoryMapper.countArticleNum(category);
            category.setArticleNum(i);
            list.add(category);
        }
        return list;
        //return artiCategoryMapper.selectSelective(page);
    }

    @Override
    public void updateArtiCategoryById(ArtiCategory category) {
        artiCategoryMapper.updateArtiCategoryById(category);
    }

    @Override
    public void deleteArtiCategoryById(ArtiCategory category) {
        artiCategoryMapper.deleteArtiCategoryById(category);
    }


}
