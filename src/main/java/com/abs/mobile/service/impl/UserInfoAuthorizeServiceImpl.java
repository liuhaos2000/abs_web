package com.abs.mobile.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SessionService;
import com.abs.mobile.service.UserInfoAuthorizeService;
import com.abs.util.commom.AbsConst;
import com.abs.weixin.pojo.OpenId;
import com.abs.weixin.pojo.RefreshToken;
import com.abs.weixin.pojo.WeixinUserInfo;
import com.abs.weixin.utils.WeiXinIFUtil;

@Service
public class UserInfoAuthorizeServiceImpl implements UserInfoAuthorizeService {

	@Resource
	private SessionService sessionService;
	@Resource
	private TUserMapper tUserMapper;
	/**
	 * 当用户访问时执行
	 * @param Openid
	 */
	@Override
	@Transactional
	public void executeGetUserInfo(String code) {

		// 取得OpenId
		OpenId openId = WeiXinIFUtil.getOpenId(code);
		// 拉取用户信息 TODO
		WeixinUserInfo wxUserInfo = WeiXinIFUtil.getUserinfo(openId.getAccess_token(), openId.getOpenid());
		// 获取系统时间
		Date date = new Date();
		// 取得数据库的用户信息
		TUser tUser = tUserMapper.selectByPrimaryKey(openId.getOpenid());
		// 如果不存在
		if (tUser == null) {
			tUser = new TUser();
			tUser.setOpenId(openId.getOpenid());
            if(wxUserInfo!=null){
                tUser.setNickname(wxUserInfo.getNickname());
                tUser.setWeixinSex(wxUserInfo.getSex());
                tUser.setCity(wxUserInfo.getCity());
                tUser.setProvince(wxUserInfo.getProvince());
                tUser.setCountry(wxUserInfo.getCountry());
                tUser.setWeixinImageUrl(wxUserInfo.getHeadimgurl());
            }
            // TODO TOKEN
            
			tUser.setJifen(0);
			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GETUSER");
			tUser.setuDate(date);
			tUser.setuUser("GETUSER");
			// 插入数据库
			tUserMapper.insert(tUser);
        } else {
            // 每次登录时，更新用户信息
            if(wxUserInfo!=null){
                tUser.setNickname(wxUserInfo.getNickname());
                tUser.setWeixinSex(wxUserInfo.getSex());
                tUser.setCity(wxUserInfo.getCity());
                tUser.setProvince(wxUserInfo.getProvince());
                tUser.setCountry(wxUserInfo.getCountry());
                tUser.setWeixinImageUrl(wxUserInfo.getHeadimgurl());
            }
            // TODO TOKEN
            tUser.setDelFlg("0");
            tUser.setcDate(date);
            tUser.setcUser("GETUSER");
            tUser.setuDate(date);
            tUser.setuUser("GETUSER");
            tUserMapper.updateByPrimaryKey(tUser);
        }

		// 写入Session
		sessionService.setLoginUser(tUser);

		return;

	}
	/**
	 * 当用户关注时执行
	 * @param Openid
	 */
	@Override
	@Transactional
	public void executeGetUserAllInfo(String openId) {

		// 获取系统时间
		Date date = new Date();
		// 取得数据库的用户信息
		TUser tUser = tUserMapper.selectByPrimaryKey(openId);
		// 如果不存在,不用去获取用户信息（访问页面时获取）
		if (tUser == null) {
			tUser = new TUser();
			tUser.setOpenId(openId);
//			tUser.setNickname(wxUserInfo.getNickname());
//			tUser.setWeixinSex(wxUserInfo.getSex());
//			tUser.setCity(wxUserInfo.getCity());
//			tUser.setProvince(wxUserInfo.getProvince());
//			tUser.setCountry(wxUserInfo.getCountry());
//			tUser.setWeixinImageUrl(wxUserInfo.getHeadimgurl());
			tUser.setJifen(0);
			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GUANZHU");
			tUser.setuDate(date);
			tUser.setuUser("GUANZHU");
			// 插入数据库
			tUserMapper.insert(tUser);
		} else {

		    // TODO 参数
            RefreshToken refreshToken = 
                   WeiXinIFUtil.getAccessTokenByRefreshToken("");
            WeixinUserInfo wxUserInfo = 
                   WeiXinIFUtil.getUserinfo(refreshToken.getAccessToken(), openId);

			tUser.setNickname(wxUserInfo.getNickname());
			tUser.setWeixinSex(wxUserInfo.getSex());
			tUser.setCity(wxUserInfo.getCity());
			tUser.setProvince(wxUserInfo.getProvince());
			tUser.setCountry(wxUserInfo.getCountry());
			tUser.setWeixinImageUrl(wxUserInfo.getHeadimgurl());
			
			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GUANZHU");
			tUser.setuDate(date);
			tUser.setuUser("GUANZHU");
			tUserMapper.updateByPrimaryKey(tUser);
		}

	}

}
