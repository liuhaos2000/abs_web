package com.abs.mobile.service;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TCart;

public interface OrderService {
    /**
     * 订单初始化
     */
    public Map<String, Object> initOrder(List<TCart> cartList);
    
    /**
     * 订单提交
     */
    public Map<String, Object> orderSubmit();

}
