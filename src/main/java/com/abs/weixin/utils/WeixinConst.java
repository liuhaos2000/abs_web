package com.abs.weixin.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/**
 * 常量定义
 * 
 * @author Liu
 * @date 2014-04-05
 */
public class WeixinConst {

	public static final String TOKEN = "iclik";

//	public static final String APPID = "wx5d3a57699afdcf6d";
//
//	public static final String APPSECRET = "8bc912a5409d71ac82932ca82e95aad6";
//	public static final String severPath = "http://mfbtest.duapp.com/";
	   public static final String APPID = "wx9c7713176c68cf82";

	    public static final String APPSECRET = "954f1660478f3909d3e49294508a9203";
	    
	    public static final String SEVERPATH = "http://maifangbang.duapp.com/";

	public static String AUTHORIZE_URL = 
			"https://open.weixin.qq.com/connect/oauth2/authorize?"
	        +"appid={0}&redirect_uri=http://mfbtest.duapp.com"
	        + "{1}&response_type=code&scope=snsapi_base&state={2}#wechat_redirect";

}