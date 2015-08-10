package com.abs.mobile.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TIndexLunboMapper;
import com.abs.mobile.domain.TIndexLunbo;
import com.abs.mobile.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService {

    @Resource
    private TIndexLunboMapper tIndexLunboMapper;
    
    /**
     * 获取轮播数据
     */
    @Override
    public List<TIndexLunbo> getLunBoList() {
        //return null;
        return tIndexLunboMapper.getLunboList();
    }



}
