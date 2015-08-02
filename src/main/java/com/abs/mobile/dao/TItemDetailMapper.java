package com.abs.mobile.dao;

import com.abs.mobile.domain.TItemDetail;
import com.abs.mobile.domain.TItemDetailKey;

public interface TItemDetailMapper {
    int deleteByPrimaryKey(TItemDetailKey key);

    int insert(TItemDetail record);

    int insertSelective(TItemDetail record);

    TItemDetail selectByPrimaryKey(TItemDetailKey key);

    int updateByPrimaryKeySelective(TItemDetail record);

    int updateByPrimaryKey(TItemDetail record);
}