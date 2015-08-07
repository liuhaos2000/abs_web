package com.abs.mobile.service;

import java.util.List;

import org.buzheng.demo.esm.domain.SysGroup;

import com.abs.mobile.domain.TUser;
import com.abs.util.exception.DataExistsException;

public interface SessionService {
	
	/**
	 * 更新
	 * @param group
	 * @throws IllegalArgumentException
	 */
	public TUser getLoginUser();
	
}
