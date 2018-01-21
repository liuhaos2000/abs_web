package com.abs.mobile.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SessionService;
import com.abs.mobile.service.ShengqingService;
import com.abs.mobile.service.UserInfoAuthorizeService;
import com.abs.util.exception.BusinessException;

@Service
public class ShengqingServiceImpl implements ShengqingService {
	@Resource
	private TUserMapper tUserMapper;
	@Resource
	private SessionService sessionService;
	@Resource
	private UserInfoAuthorizeService userInfoAuthorizeService;
	
	@Override
    @Transactional(rollbackFor=Exception.class) 
	public void ShengqingVip(String parent) throws BusinessException {
		//throw new BusinessException("ordersubmit.cart.error");
		TUser loginUser=sessionService.getLoginUser();
		TUser parentUser=tUserMapper.selectByPrimaryKey(parent);
		// CHECK
		// 1 Parent 必须是 00,01
		if("00".equals(parentUser.getLever()) || "01".equals(parentUser.getLever())){
		}else{
			//无效的邀请人
			throw new BusinessException("shengqingvip.parent.error");
		}
		//取最新用户数据
		userInfoAuthorizeService.executeGetUserAllInfo(loginUser.getOpenId());
		loginUser = tUserMapper.selectByPrimaryKey(loginUser.getOpenId());
		
		// 2 useropenid 必须不是00,01,02
		if("00".equals(loginUser.getLever()) ||
				"01".equals(loginUser.getLever()) ||
				"02".equals(loginUser.getLever())){
			//已经是会员
			throw new BusinessException("shengqingvip.huiyuan1.error");
		}
		// 3 useropenid 98 申请中，请稍后
		if("98".equals(loginUser.getLever())){
			//申请中
			throw new BusinessException("shengqingvip.huiyuan2.error");
		}
		// 3 useropenid 必须关注 nickname 不为空
		if(StringUtils.isEmpty(loginUser.getNickname())){
			//请关注
			throw new BusinessException("shengqingvip.huiyuan3.error");
		}
		// Check OK 后
		// 更新数据，设置parent，设置等级98 申请中 
		Date date=new Date();
		loginUser.setParent(parent);
		loginUser.setLever("98");
		
        // 或者直接设置成会员，if parent 00，设置01 ， 01的话设置02
//		if("00".equals(parentUser.getLever())){
//			loginUser.setLever("01");
//		}else if("01".equals(parentUser.getLever())){
//			loginUser.setLever("02");
//		}
		
		loginUser.setuDate(date);
		loginUser.setuUser("SHENGQING_VIP");
		tUserMapper.updateByPrimaryKey(loginUser);
		// 更新Session
		sessionService.setLoginUser(loginUser);
		
		 
		
	}


}
