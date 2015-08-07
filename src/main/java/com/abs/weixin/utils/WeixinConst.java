package com.abs.weixin.utils;

/**
 * 常量定义
 * 
 * @author Liu
 * @date 2014-04-05
 */
public class WeixinConst {

	public static final String TOKEN = "abs_web_ruihegouwu";

//	public static final String APPID = "wx5d3a57699afdcf6d";
//
//	public static final String APPSECRET = "8bc912a5409d71ac82932ca82e95aad6";
//	public static final String severPath = "http://mfbtest.duapp.com/";
	   public static final String APPID = "wx9e5e703df0bcd7c7";

	    public static final String APPSECRET = "562cbd9ff4298c150b78da63e34a2d89";
	    
	    public static final String SEVERPATH = "http://qbctest.wicp.net/";

	public static String AUTHORIZE_URL = 
			"https://open.weixin.qq.com/connect/oauth2/authorize?"
	        +"appid={0}&redirect_uri=http://mfbtest.duapp.com"
	        + "{1}&response_type=code&scope=snsapi_base&state={2}#wechat_redirect";

}