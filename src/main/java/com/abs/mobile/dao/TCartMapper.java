package com.abs.mobile.dao;

import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TCartKey;

public interface TCartMapper {
    int deleteByPrimaryKey(TCartKey key);

    int insert(TCart record);

    int insertSelective(TCart record);

    TCart selectByPrimaryKey(TCartKey key);

    int updateByPrimaryKeySelective(TCart record);

    int updateByPrimaryKey(TCart record);
    
    /**
     * 取件数
     * @param openId
     * @return
     */
    long getCount(String openId);
}