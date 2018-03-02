package com.blog.service.impl;

import com.blog.mapper.VisitorMapper;
import com.blog.vo.Article;
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

    @Override
    public boolean countArticleThumbUp(Visitor v) {
        List<Visitor> visitors = visitorMapper.selectVisitorByAid(v);
        boolean flag = false;
        String ip = v.getVisitorIp();
        int artiId = v.getArtiId();
        if (visitors.size() < 1) {//没有该文章的这个ip//第一次
            visitorMapper.addVisitor(v);
            flag = false;
        } else {
            for (Visitor v2 : visitors) {
                if (ip.equals(v2.getVisitorIp())&&artiId == v2.getArtiId()) {//如果存在这个访问过的记录
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                flag = false;
                visitorMapper.addVisitor(v);
            }
        }
        return flag;
    }
}
