package com.abs.mobile.dao;

import com.abs.mobile.domain.TUserAddress;
import com.abs.mobile.domain.TUserAddressKey;

public interface TUserAddressMapper {
    int deleteByPrimaryKey(TUserAddressKey key);

    int insert(TUserAddress record);

    int insertSelective(TUserAddress record);

    TUserAddress selectByPrimaryKey(TUserAddressKey key);

    int updateByPrimaryKeySelective(TUserAddress record);

    int updateByPrimaryKey(TUserAddress record);
}