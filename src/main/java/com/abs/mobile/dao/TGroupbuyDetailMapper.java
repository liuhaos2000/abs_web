package com.abs.mobile.dao;

import com.abs.mobile.domain.TGroupbuyDetail;
import com.abs.mobile.domain.TGroupbuyDetailKey;

public interface TGroupbuyDetailMapper {
    int deleteByPrimaryKey(TGroupbuyDetailKey key);

    int insert(TGroupbuyDetail record);

    int insertSelective(TGroupbuyDetail record);

    TGroupbuyDetail selectByPrimaryKey(TGroupbuyDetailKey key);

    int updateByPrimaryKeySelective(TGroupbuyDetail record);

    int updateByPrimaryKey(TGroupbuyDetail record);
}