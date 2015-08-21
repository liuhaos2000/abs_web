package com.abs.mobile.service;

import com.abs.mobile.domain.TUser;

public interface SessionService {
	
	/**
	 * 获取Session中的User
	 */
	public TUser getLoginUser();
	/**
	 * 设置Session中的User
	 */
	public void setLoginUser(TUser user);
}
