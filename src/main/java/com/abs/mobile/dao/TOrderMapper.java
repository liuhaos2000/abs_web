package com.abs.mobile.dao;

import com.abs.mobile.domain.TOrder;

public interface TOrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(TOrder record);

    int insertSelective(TOrder record);

    TOrder selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(TOrder record);

    int updateByPrimaryKey(TOrder record);
}