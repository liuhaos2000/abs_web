package com.abs.mobile.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TGroupbuyMapper;
import com.abs.mobile.dao.TItemDetailMapper;
import com.abs.mobile.domain.TGroupbuy;
import com.abs.mobile.domain.TGroupbuyKey;
import com.abs.mobile.domain.TItemDetail;
import com.abs.mobile.domain.TItemDetailKey;
import com.abs.mobile.service.ItemGroupBuyService;

@Service
public class ItemGroupBuyServiceImpl implements ItemGroupBuyService {

	@Resource
	private TItemDetailMapper tItemDetailMapper;
	@Resource
	private TGroupbuyMapper tGroupbuyMapper;

	@Override
	public String checkGryupbuyItem(String itemId, String phaseNum) {
		// check 是否是团购
		TGroupbuyKey key = new TGroupbuyKey();
		key.setItemId(Integer.valueOf(itemId));
		key.setPhaseNum(Integer.valueOf(phaseNum));
		TGroupbuy tGroupbuy = tGroupbuyMapper.selectByPrimaryKey(key);
		if (tGroupbuy == null) {
			return null;
		}
		// 返回活动种类
		TItemDetailKey key1 = new TItemDetailKey();
		key1.setItemId(Integer.valueOf(itemId));
		key1.setItemGuige(0);
		key1.setItemYanse(0);
		TItemDetail tItemDetail = tItemDetailMapper.selectByPrimaryKey(key1);
		if (tItemDetail == null) {
			return null;
		} else {
			return tItemDetail.getHuodongFlg();
		}

	}

	@Override
	public Map<String, Object> getItemGryupbuyInfo(String itemId, String phaseNum) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String,String> groupbuyInfo = tGroupbuyMapper.getGroupbuyInfo(itemId, phaseNum);
		resultMap.put("groupbuyInfo", groupbuyInfo);
		
		return resultMap;
	}
}
