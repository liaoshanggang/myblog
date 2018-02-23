package com.blog.service;

import com.blog.vo.Visitor;

import java.util.List;

public interface IVisitorService {
    public List<Visitor> selectVisitorByAid(Visitor visitor);
    public void addVisitor(Visitor visitor);
    Integer countPageViewByAid(Visitor visitor);

}
