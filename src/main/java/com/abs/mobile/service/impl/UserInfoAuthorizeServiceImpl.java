package com.abs.mobile.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SessionService;
import com.abs.mobile.service.UserInfoAuthorizeService;
import com.abs.weixin.pojo.OpenId;
import com.abs.weixin.utils.AklkWeiXinIFUtil;

@Service
public class UserInfoAuthorizeServiceImpl implements UserInfoAuthorizeService {

	@Resource
	private SessionService sessionService;
	@Resource
	private TUserMapper tUserMapper;

	@Override
	@Transactional
	public void executeGetUserInfo(String code) {

		// 取得OpenId
		OpenId openId = AklkWeiXinIFUtil.getOpenId(code);
		// 获取系统时间
		Date date = new Date();
		// 取得数据库的用户信息
		TUser tUser = tUserMapper.selectByPrimaryKey(openId.getOpenid());
		// 如果不存在
		if (tUser == null) {
			tUser = new TUser();
			tUser.setOpenId(openId.getOpenid());
			tUser.setJifen(0);
			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GETUSER");
			tUser.setuDate(date);
			tUser.setuUser("GETUSER");
			// 插入数据库
			tUserMapper.insert(tUser);
		}
		
		// 写入Session
		sessionService.setLoginUser(tUser);
		
		return;

	}

}
