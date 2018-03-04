package com.blog.service;

import com.blog.vo.Collect;
import com.blog.vo.Page;

import java.util.List;

public interface ICollectService {

    boolean insertCollect(Collect collect);

    int countForSelective(Page<Collect> page);

    List<Collect> selectSelective(Page<Collect> page);

    void deleteCollectById(Collect collect);

    Collect selectCollectById(int id);

    void updateCollect(Collect collect);
}
