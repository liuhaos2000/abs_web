package com.abs.mobile.service;

import javax.servlet.http.HttpServletRequest;

public interface WXCoreService {
	
	/**
	 * 微信核心处理
	 * @param request
	 * @return
	 */
	public String processRequest(HttpServletRequest request);
	/**
	 * 支付回调
	 * @param request
	 * @return
	 */
	public String paynotify(HttpServletRequest request);
}
