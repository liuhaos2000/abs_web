package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TItem;

public interface TItemMapper {
    int deleteByPrimaryKey(Integer itemId);

    int insert(TItem record);

    int insertSelective(TItem record);

    TItem selectByPrimaryKey(Integer itemId);

    int updateByPrimaryKeySelective(TItem record);

    int updateByPrimaryKeyWithBLOBs(TItem record);

    int updateByPrimaryKey(TItem record);
    
    List<Map<String, String>> getItemTejia();
}