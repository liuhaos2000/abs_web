package com.abs.mobile.service;

public interface CartService {
	/**
	 * 添加购物车
	 * @return
	 */
	public  int addItem(String itemId,String xinghao,
			String yanse,String shuliang);
	/**
	 * 取得购物车数量
	 * @return
	 */
	public  int getCount();
}
