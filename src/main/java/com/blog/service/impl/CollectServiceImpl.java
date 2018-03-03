package com.blog.service.impl;

import com.blog.mapper.CollectMapper;
import com.blog.service.ICollectService;
import com.blog.vo.Collect;
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
}
