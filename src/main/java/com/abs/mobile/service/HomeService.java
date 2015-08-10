package com.abs.mobile.service;

import java.util.List;

import com.abs.mobile.domain.TIndexLunbo;

public interface HomeService {
	
	/**
	 * 取得轮播数据
	 * @param request
	 * @return
	 */
	public List<TIndexLunbo> getLunBoList();
	
}
