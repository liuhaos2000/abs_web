package com.abs.mobile.service.impl;

import java.nio.ByteOrder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TCartMapper;
import com.abs.mobile.dao.TItemDetailMapper;
import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TItemPictureMapper;
import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TCartKey;
import com.abs.mobile.domain.TItem;
import com.abs.mobile.domain.TItemDetail;
import com.abs.mobile.domain.TItemDetailKey;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.CartService;
import com.abs.mobile.service.IndexService;
import com.abs.mobile.service.SessionService;
import com.abs.util.exception.BusinessException;

@Service
public class IndexServiceImpl implements IndexService {
	@Resource
	private SessionService sessionService;
	@Override
	public Map<String, Object> getShearInfo() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// JSAPI 签名信息
		resultMap.put("signInfo", sessionService.getSignInfo("/mobile/page/index"));
		return resultMap;
	}

}
