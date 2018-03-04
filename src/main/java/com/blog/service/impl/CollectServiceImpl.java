package com.blog.service.impl;

import com.blog.mapper.CollectMapper;
import com.blog.service.ICollectService;
import com.blog.vo.Collect;
import com.blog.vo.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("collectService")
public class CollectServiceImpl implements ICollectService {
    @Resource
    CollectMapper collectMapper;

    @Override
    public boolean insertCollect(Collect collect) {
        Collect collects = collectMapper.selectCollectByUserUrl(collect);
        if(collects==null){
            collectMapper.insertCollect(collect);
            return false;
        }
        return true;
    }

    @Override
    public int countForSelective(Page<Collect> page) {
        return collectMapper.countForSelective(page);
    }

    @Override
    public List<Collect> selectSelective(Page<Collect> page) {
        return collectMapper.selectSelective(page);
    }

    @Override
    public void deleteCollectById(Collect collect) {
        collectMapper.deleteCollectById(collect);
    }

    @Override
    public Collect selectCollectById(int id) {
        return collectMapper.selectCollectById(id);
    }

    @Override
    public void updateCollect(Collect collect) {
        collectMapper.updateCollect(collect);
    }
}
