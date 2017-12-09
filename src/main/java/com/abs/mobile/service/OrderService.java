package com.abs.mobile.service;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.util.exception.BusinessException;

public interface OrderService {
    /**
     * 订单初始化
     * @throws BusinessException 
     */
    public Map<String, Object> initOrder(List<TCart> cartList) ;
    
    /**
     * 订单提交
     * @param orderDetailList 
     * @param order 
     * @throws BusinessException 
     */
    public Map<String, Object> orderSubmit(TOrder order, List<TOrderDetail> orderDetailList) throws BusinessException;

    /**
     * 跟新订单状态为已支付
     * @param orderId 
     * @param payId 
     */
    public Map<String, Object> updOrderToPayed(String orderId);
    /**
     * 由于收货人地址发生改变：刷新商品价格
     * @return
     * @throws BusinessException 
     */
	public Map<String, Object> reItemPrice(String addId);
	
    /**
     * 用户订单察看
     * @return
     */
    public Map<String, Object> getUserOrder();
    
    /**
     * 用户订单察看  然后支付
     * @return
     */
    public Map<String, Object> doPayFromUserOrder(String orderId);
}
