package com.abs.mobile.dao;

import com.abs.mobile.domain.TItemPingjia;
import com.abs.mobile.domain.TItemPingjiaKey;

public interface TItemPingjiaMapper {
    int deleteByPrimaryKey(TItemPingjiaKey key);

    int insert(TItemPingjia record);

    int insertSelective(TItemPingjia record);

    TItemPingjia selectByPrimaryKey(TItemPingjiaKey key);

    int updateByPrimaryKeySelective(TItemPingjia record);

    int updateByPrimaryKey(TItemPingjia record);
}