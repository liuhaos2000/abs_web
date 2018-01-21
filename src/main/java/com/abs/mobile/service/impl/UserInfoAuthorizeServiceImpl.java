package com.abs.mobile.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SessionService;
import com.abs.mobile.service.UserInfoAuthorizeService;
import com.abs.util.EmojiFilter;
import com.abs.util.commom.AbsConst;
import com.abs.util.commom.AbsTool;
import com.abs.util.commom.WeixinConst;
import com.abs.weixin.pojo.OpenId;
import com.abs.weixin.pojo.WeixinUserInfo;
import com.abs.weixin.utils.WeiXinIFUtil;
import com.vdurmont.emoji.EmojiParser;

@Service
public class UserInfoAuthorizeServiceImpl implements UserInfoAuthorizeService {

	@Resource
	private SessionService sessionService;
	@Resource
	private TUserMapper tUserMapper;

	/**
	 * 当用户访问时执行
	 * 
	 * @param Openid
	 */
	@Override
	@Transactional
	public void executeGetUserInfo(String code, String state) {

		// 取得OpenId
		OpenId openId = WeiXinIFUtil.getOpenId(code);
		// 获取系统时间
		Date date = new Date();
		// 取得数据库的用户信息
		TUser tUser = tUserMapper.selectByPrimaryKey(openId.getOpenid());
		// 如果不存在
		if (tUser == null) {
			tUser = new TUser();
			tUser.setOpenId(openId.getOpenid());
			tUser.setRefreshToken(openId.getRefresh_token());
			tUser.setJifen(0);
			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GETUSER");
			tUser.setuDate(date);
			tUser.setuUser("GETUSER");
			// 用户等级,新规的时候
			tUser.setLever("99");
			String parent = AbsTool.getJiexiCanshu(state, "parent");
			if (StringUtils.isNotEmpty(parent)) {
				tUser.setParent(parent);
			} else {
				tUser.setParent("MASTER");
			}

			// 插入数据库
			tUserMapper.insert(tUser);
		} else {

			// if(StringUtils.isNotEmpty(tUser.getNickname())){
			// //已经有用户信息
			// //启动多线程更新用户信息
			// Thread thread = new Thread(){
			// public void run(){
			// System.out.println("Thread Running");
			// }
			// };
			// thread.start();
			// }else{
			// //还没有用户信息
			// //不启动多线程序
			// }

			// 拉取用户信息 TODO
			WeixinUserInfo wxUserInfo = WeiXinIFUtil.getUserinfo(AbsConst.access_token, openId.getOpenid());
			// 每次登录时，更新用户信息
			if (wxUserInfo != null) {
				//tUser.setNickname(EmojiFilter.removeNonBmpUnicode(wxUserInfo.getNickname()));
				//tUser.setNickname(AbsTool.encodeBase64(wxUserInfo.getNickname().getBytes()));
				tUser.setNickname(EmojiParser.parseToAliases(wxUserInfo.getNickname()));
				tUser.setWeixinSex(wxUserInfo.getSex());
				tUser.setCity(wxUserInfo.getCity());
				tUser.setProvince(wxUserInfo.getProvince());
				tUser.setCountry(wxUserInfo.getCountry());
				tUser.setWeixinImageUrl(wxUserInfo.getHeadimgurl());
			}
			tUser.setRefreshToken(openId.getRefresh_token());
			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GETUSER");
			tUser.setuDate(date);
			tUser.setuUser("GETUSER");
			tUserMapper.updateByPrimaryKey(tUser);
			// 把帶有emoji的名字放回session
			tUser.setNickname(wxUserInfo.getNickname());
		}

		// 写入Session
		sessionService.setLoginUser(tUser);
		sessionService.setShopUser(getShopUser3(tUser,AbsTool.getJiexiCanshu(state, "parent")));
		return;

	}

	/**
	 * 当用户关注时执行
	 * 
	 * @param Openid
	 */
	@Override
	@Transactional
	public void executeGetUserAllInfo(String openId) {

		WeixinUserInfo wxUserInfo = WeiXinIFUtil.getUserinfo(AbsConst.access_token, openId);

		// 获取系统时间
		Date date = new Date();
		// 取得数据库的用户信息
		TUser tUser = tUserMapper.selectByPrimaryKey(openId);
		// 如果不存在
		if (tUser == null) {
			tUser = new TUser();
			tUser.setOpenId(openId);
			if (wxUserInfo != null) {
				//tUser.setNickname(EmojiFilter.removeNonBmpUnicode(wxUserInfo.getNickname()));
				//tUser.setNickname(AbsTool.encodeBase64(wxUserInfo.getNickname().getBytes()));
				tUser.setNickname(EmojiParser.parseToAliases(wxUserInfo.getNickname()));
				tUser.setWeixinSex(wxUserInfo.getSex());
				tUser.setCity(wxUserInfo.getCity());
				tUser.setProvince(wxUserInfo.getProvince());
				tUser.setCountry(wxUserInfo.getCountry());
				tUser.setWeixinImageUrl(wxUserInfo.getHeadimgurl());
			}
			tUser.setJifen(0);
			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GUANZHU");
			tUser.setuDate(date);
			tUser.setuUser("GUANZHU");
			// 用户等级,新规的时候
			tUser.setLever("99");
			tUser.setParent("MASTER");
			// 插入数据库
			tUserMapper.insert(tUser);
		} else {
			if (wxUserInfo != null) {
				//tUser.setNickname(EmojiFilter.removeNonBmpUnicode(wxUserInfo.getNickname()));
				//tUser.setNickname(AbsTool.encodeBase64(wxUserInfo.getNickname().getBytes()));
				tUser.setNickname(EmojiParser.parseToAliases(wxUserInfo.getNickname()));
				tUser.setWeixinSex(wxUserInfo.getSex());
				tUser.setCity(wxUserInfo.getCity());
				tUser.setProvince(wxUserInfo.getProvince());
				tUser.setCountry(wxUserInfo.getCountry());
				tUser.setWeixinImageUrl(wxUserInfo.getHeadimgurl());
			}

			tUser.setDelFlg("0");
			tUser.setcDate(date);
			tUser.setcUser("GUANZHU");
			tUser.setuDate(date);
			tUser.setuUser("GUANZHU");
			tUserMapper.updateByPrimaryKey(tUser);
		}

	}


	/**
	 * 获取店铺的用户信息
	 * 
	 * @param tUser
	 * @param state
	 * @return
	 */
	private TUser getShopUser(TUser tUser, String parentCanShuOpenId) {
		TUser shopUser = null;
		if ("00".equals(tUser.getLever()) || "01".equals(tUser.getLever()) || "02".equals(tUser.getLever())) {
			return tUser;
		} else if ("99".equals(tUser.getLever())) {
			// 参数
			if(StringUtils.isNotEmpty(parentCanShuOpenId)){
				shopUser = tUserMapper.selectByPrimaryKey(parentCanShuOpenId);
				// 如果不存在
				if (shopUser != null) {
					return shopUser;
				}
			}else if(StringUtils.isNotEmpty(tUser.getParent())){
				shopUser = tUserMapper.selectByPrimaryKey(tUser.getParent());
				// 如果不存在
				if (shopUser != null) {
					return shopUser;
				}
			}				
		} 
		//返回可能为空，为空则表示总店
		shopUser = tUserMapper.selectByPrimaryKey(WeixinConst.SHOPMAST_USER_OPENID);
		return shopUser;
	}
	
	/**
	 * 获取店铺的用户信息
	 * 参数优先
	 * @param tUser
	 * @param state
	 * @return
	 */
	private TUser getShopUser2(TUser tUser, String parentCanShuOpenId) {
		TUser shopUser = null;
		if(StringUtils.isNotEmpty(parentCanShuOpenId)){
			shopUser = tUserMapper.selectByPrimaryKey(parentCanShuOpenId);
			// 如果不存在
			if (shopUser != null) {
				return shopUser;
			}
		} else if("00".equals(tUser.getLever()) || "01".equals(tUser.getLever()) || "02".equals(tUser.getLever())){
			return tUser;
		} else if("99".equals(tUser.getLever()) &&
				StringUtils.isNotEmpty(tUser.getParent())){
			shopUser = tUserMapper.selectByPrimaryKey(tUser.getParent());
			// 如果不存在
			if (shopUser != null) {
				return shopUser;
			}
		}
		
		//返回可能为空，为空则表示总店
		shopUser = tUserMapper.selectByPrimaryKey(WeixinConst.SHOPMAST_USER_OPENID);
		return shopUser;
	}
	/**
	 * 获取店铺的用户信息
	 * 只认参数
	 * @param tUser
	 * @param state
	 * @return
	 */
	private TUser getShopUser3(TUser tUser, String parentCanShuOpenId) {
		TUser shopUser = null;
		if(StringUtils.isNotEmpty(parentCanShuOpenId)){
			shopUser = tUserMapper.selectByPrimaryKey(parentCanShuOpenId);
			// 如果不存在
			if (shopUser != null) {
				return shopUser;
			}
		} 		
		//返回可能为空，为空则表示总店
		shopUser = tUserMapper.selectByPrimaryKey(WeixinConst.SHOPMAST_USER_OPENID);
		return shopUser;
	}
}
