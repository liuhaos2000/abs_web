package com.abs.mobile.service.impl;

import java.util.HashMap;
import java.util.Map;

import com.abs.util.commom.AbsTool;


public class UserInfoAuthorizeServiceImplTest {

/**
 * 您好，您已购买成功。
*
*商品信息：{{name.DATA}}
*{{remark.DATA}}
 * @param args
 */
	public static void main(String[] args) {
		
		String strURL="/a?a=a&b=b&parent=aaa";
		
		String result=	AbsTool.getJiexiCanshu(strURL, "parent");
		
		System.out.println(result);
	}
	}
