package com.abs.mobile.dao;

import com.abs.mobile.domain.TRegion;

public interface TRegionMapper {
    int deleteByPrimaryKey(Short regionId);

    int insert(TRegion record);

    int insertSelective(TRegion record);

    TRegion selectByPrimaryKey(Short regionId);

    int updateByPrimaryKeySelective(TRegion record);

    int updateByPrimaryKey(TRegion record);
}