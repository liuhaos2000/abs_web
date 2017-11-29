package com.abs.mobile.dao;

import com.abs.mobile.domain.TWuliuGongsi;

public interface TWuliuGongsiMapper {
    int deleteByPrimaryKey(String gongsiId);

    int insert(TWuliuGongsi record);

    int insertSelective(TWuliuGongsi record);

    TWuliuGongsi selectByPrimaryKey(String gongsiId);

    int updateByPrimaryKeySelective(TWuliuGongsi record);

    int updateByPrimaryKey(TWuliuGongsi record);
}