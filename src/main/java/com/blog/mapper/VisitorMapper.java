package com.blog.mapper;

import com.blog.vo.Visitor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VisitorMapper {

    List<Visitor> selectVisitorByAid(Visitor visitor);

    void addVisitor(Visitor visitor);

    Integer countPageViewByAid(Visitor visitor);

    void delByAid(Integer artiId);
}