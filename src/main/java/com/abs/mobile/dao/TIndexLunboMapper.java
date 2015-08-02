package com.abs.mobile.dao;

import com.abs.mobile.domain.TIndexLunbo;

public interface TIndexLunboMapper {
    int deleteByPrimaryKey(Integer lunboId);

    int insert(TIndexLunbo record);

    int insertSelective(TIndexLunbo record);

    TIndexLunbo selectByPrimaryKey(Integer lunboId);

    int updateByPrimaryKeySelective(TIndexLunbo record);

    int updateByPrimaryKey(TIndexLunbo record);
}