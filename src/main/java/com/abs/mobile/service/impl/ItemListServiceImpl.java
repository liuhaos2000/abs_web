package com.abs.mobile.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.service.ItemListService;

@Service
public class ItemListServiceImpl implements ItemListService {

    @Resource
    private TItemMapper tItemMapper;

    /**
     * 取得商品列表
     * @param params 参数
     * @param pageInfo 翻页信息
     * @return Map
     */
	@Override
	public List<Map<String, String>> getItemList(Map<String, Object> params, PageInfo pageInfo) {
		return tItemMapper.getItemList((String)params.get("searchparm"),pageInfo);
	}



}
