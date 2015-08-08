package com.abs.mobile.service;

import java.util.List;

import org.buzheng.demo.esm.domain.SysGroup;

import com.abs.mobile.domain.TUser;
import com.abs.util.exception.DataExistsException;

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
