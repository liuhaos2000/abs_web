package com.abs.mobile.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TOrderMapper;
import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.HuiyuanService;
import com.abs.mobile.service.SessionService;

@Service
public class HuiyuanServiceImpl implements HuiyuanService {
	@Resource
	private SessionService sessionService;
	@Resource
	private TOrderMapper tOrderMapper;
	@Resource
	private TUserMapper tUserMapper;
	
	
	@Override
	public Map<String, Object> huiyuanInit(String orderId, String payId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 取得用户信息
		TUser tUser = sessionService.getLoginUser();
		TUser tUserDb = tUserMapper.selectByPrimaryKey(tUser.getOpenId());
		
		// 取得当前用户有效订单数量（状态不为 关闭的 订单数量）
		long orderCount = tOrderMapper.getUserOrderCount(tUser.getOpenId());

		resultMap.put("loginUser", tUser);
		resultMap.put("orderCount", orderCount);
		return resultMap;
	}

}
