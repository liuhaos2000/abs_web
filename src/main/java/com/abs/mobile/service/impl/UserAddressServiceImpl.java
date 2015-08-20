package com.abs.mobile.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TRegionMapper;
import com.abs.mobile.dao.TUserAddressMapper;
import com.abs.mobile.domain.TRegion;
import com.abs.mobile.service.UserAdderssService;

@Service
public class UserAddressServiceImpl implements UserAdderssService {

    @Resource
    private TUserAddressMapper tUserAddressMapper;
    @Resource
    private TRegionMapper tRegionMapper;
	/**
	 * 取得一级地址
	 * @param request
	 * @return
	 */
    @Override
	public List<TRegion> getAddressLevel1() {
		return tRegionMapper.getRegion1();
	}
	/**
	 * 取得二级地址
	 * @param request
	 * @return
	 */
	@Override
	public List<TRegion> getAddressLevel2(String parnet) {
		return tRegionMapper.getRegion2(parnet);
	}


}
