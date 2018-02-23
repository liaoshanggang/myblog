package com.blog.service.impl;

import com.blog.mapper.VisitorMapper;
import com.blog.vo.Visitor;
import org.springframework.stereotype.Service;

import com.blog.service.IVisitorService;

import javax.annotation.Resource;
import java.util.List;


@Service("visitorService")
public class VisitorServiceImpl implements IVisitorService {
    @Resource
    VisitorMapper visitorMapper;

    @Override
    public List<Visitor> selectVisitorByAid(Visitor visitor) {
        return visitorMapper.selectVisitorByAid(visitor);
    }

    @Override
    public void addVisitor(Visitor visitor) {
        visitorMapper.addVisitor(visitor);
    }

    @Override
    public Integer countPageViewByAid(Visitor visitor) {
        return visitorMapper.countPageViewByAid(visitor);
    }
}
