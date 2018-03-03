package com.blog.mapper;

import com.blog.vo.Collect;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectMapper {

    void insertCollect(Collect collect);

    Collect selectCollectByUserUrl(Collect collect);
}