package com.abs.mobile.service;

import java.util.List;

import com.abs.mobile.domain.TRegion;

public interface UserAdderssService {
	
	/**
	 * 取得一级地址
	 * @param request
	 * @return
	 */
	public List<TRegion> getAddressLevel1();
	/**
	 * 取得二级地址
	 * @param request
	 * @return
	 */
	public List<TRegion> getAddressLevel2(String region1);
}
