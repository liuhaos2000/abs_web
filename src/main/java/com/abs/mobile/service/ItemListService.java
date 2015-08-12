package com.abs.mobile.service;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;

public interface ItemListService {
	
	/**
	 * 取得商品列表
	 * @param request
	 * @return
	 */
	public List<Map<String, String>> getItemList(Map<String, Object> params,PageInfo pageInfo);

}
