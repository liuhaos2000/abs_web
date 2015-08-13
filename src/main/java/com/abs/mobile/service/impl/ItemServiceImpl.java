package com.abs.mobile.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TItemPictureMapper;
import com.abs.mobile.domain.TItemPicture;
import com.abs.mobile.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService {

    @Resource
    private TItemMapper tItemMapper;
    @Resource
    private TItemPictureMapper tItemPictureMapper;
    @Override
    public  Map<String, Object> getItem(String itemId) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        // 取得商品图片
        List<TItemPicture> tupianList = tItemPictureMapper.getItemPictures(itemId);
        resultMap.put("tupianList", tupianList);
        // 商品基本信息取得
        
        return resultMap;
    }



}
