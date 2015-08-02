package com.abs.mobile.dao;

import com.abs.mobile.domain.TItemType;

public interface TItemTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(TItemType record);

    int insertSelective(TItemType record);

    TItemType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(TItemType record);

    int updateByPrimaryKey(TItemType record);
}