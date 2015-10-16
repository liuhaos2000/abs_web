package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TOrder;

public interface TOrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(TOrder record);

    int insertSelective(TOrder record);

    TOrder selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(TOrder record);

    int updateByPrimaryKey(TOrder record);
    /**
     * 菜番
     * @return
     */
    String getNewOrderId();
    /**
     * 取得用户订单数
     * @return
     */
    long getUserOrderCount(String openId);
    /**
     * 取得用户订
     * @return
     */
    List<Map<String, Object>> getUserOrderList(String openId);
}