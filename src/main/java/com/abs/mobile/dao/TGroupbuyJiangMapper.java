package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TGroupbuyJiang;
import com.abs.mobile.domain.TGroupbuyJiangKey;

public interface TGroupbuyJiangMapper {
    int deleteByPrimaryKey(TGroupbuyJiangKey key);

    int insert(TGroupbuyJiang record);

    int insertSelective(TGroupbuyJiang record);

    TGroupbuyJiang selectByPrimaryKey(TGroupbuyJiangKey key);

    int updateByPrimaryKeySelective(TGroupbuyJiang record);

    int updateByPrimaryKey(TGroupbuyJiang record);
    
    // 获取一元购兑奖信息
	List<Map<String, String>> getYYGouDuijiangInfo();

}