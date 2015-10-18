package com.abs.mobile.service;

import java.util.Map;

import com.abs.util.exception.BusinessException;

public interface CartService {
	/**
	 * 添加购物车
	 * @return
	 * @throws BusinessException 
	 */
	public  int addItem(String itemId,String xinghao,
			String yanse,String shuliang) throws BusinessException;
	/**
	 * 取得购物车数量
	 * @return
	 */
	public  int getCount();
	/**
	 * 取得购物车数据
	 * @return
	 */
    public Map<String, Object> getCartItem();
    /**
     * 取得购物车数据
     * @return
     */
    public int delItemFromCart(String itemId,String guige,String yanse);
    
    /**
     * check商品是否有足够的数量，下架，
     * 删除，等不可购买原因
     * @param itemId
     * @param xinghao
     * @param yanse
     * @param shuliang
     * @return
     */
	public boolean checkItem(String itemId,String xinghao,
			String yanse,String shuliang);
    
}
