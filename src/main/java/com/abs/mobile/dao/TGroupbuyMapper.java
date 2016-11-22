package com.abs.mobile.dao;

import java.util.Map;

import com.abs.mobile.domain.TGroupbuy;
import com.abs.mobile.domain.TGroupbuyKey;

public interface TGroupbuyMapper {
    int deleteByPrimaryKey(TGroupbuyKey key);

    int insert(TGroupbuy record);

    int insertSelective(TGroupbuy record);

    TGroupbuy selectByPrimaryKey(TGroupbuyKey key);

    int updateByPrimaryKeySelective(TGroupbuy record);

    int updateByPrimaryKey(TGroupbuy record);
    
    Map<String, String> getGroupbuyInfo(String itemId,String phaseNum);
    
}