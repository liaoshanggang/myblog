package com.blog.mapper;

import com.blog.vo.Collect;
import com.blog.vo.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectMapper {

    void insertCollect(Collect collect);

    Collect selectCollectByUserUrl(Collect collect);

    int countForSelective(Page<Collect> page);

    List<Collect> selectSelective(Page<Collect> page);

    void deleteCollectById(Collect collect);

    Collect selectCollectById(int id);

    void updateCollect(Collect collect);
}