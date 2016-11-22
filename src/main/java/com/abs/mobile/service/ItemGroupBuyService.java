package com.abs.mobile.service;

import java.util.Map;

public interface ItemGroupBuyService {
	
	/**
	 * 查看是否是团购
	 * @return 7:团购，8：一元购
	 */
	public  String checkGryupbuyItem(String itemId,String phaseNum);
	
	/**
	 * 取得团购商品
	 * @return
	 */
	public  Map<String, Object> getItemGryupbuyInfo(String itemId,String phaseNum);
}
