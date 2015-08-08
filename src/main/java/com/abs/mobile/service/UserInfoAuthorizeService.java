package com.abs.mobile.service;

public interface UserInfoAuthorizeService {
	
	/**
	 * 从微信获取用户信息，并放入Session
	 * @param code
	 */
	public void executeGetUserInfo(String code);
	
}
