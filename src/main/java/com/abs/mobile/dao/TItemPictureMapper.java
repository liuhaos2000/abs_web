package com.abs.mobile.dao;

import com.abs.mobile.domain.TItemPicture;
import com.abs.mobile.domain.TItemPictureKey;

public interface TItemPictureMapper {
    int deleteByPrimaryKey(TItemPictureKey key);

    int insert(TItemPicture record);

    int insertSelective(TItemPicture record);

    TItemPicture selectByPrimaryKey(TItemPictureKey key);

    int updateByPrimaryKeySelective(TItemPicture record);

    int updateByPrimaryKey(TItemPicture record);
}