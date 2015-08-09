package com.abs.mobile.dao;

import com.abs.mobile.domain.TWuliuDetail;
import com.abs.mobile.domain.TWuliuDetailKey;

public interface TWuliuDetailMapper {
    int deleteByPrimaryKey(TWuliuDetailKey key);

    int insert(TWuliuDetail record);

    int insertSelective(TWuliuDetail record);

    TWuliuDetail selectByPrimaryKey(TWuliuDetailKey key);

    int updateByPrimaryKeySelective(TWuliuDetail record);

    int updateByPrimaryKey(TWuliuDetail record);
}