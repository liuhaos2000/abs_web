package com.abs.mobile.service.impl;

import org.apache.commons.lang.StringUtils;

public class UserInfoAuthorizeServiceImplTest {


	public static void main(String[] args) {
		String aaa= "/asdf=asdf&parent=dfdfdfdfddfdf&fff=123";
		String bbb=getJiexiCanshu(aaa);
		System.out.println(bbb);
	}
	
	private static String getJiexiCanshu(String state){
		String[] parms = state.split("&");
		for (String  parm: parms) {
			if(StringUtils.isNotEmpty(parm)){
				String[] str = parm.split("=");
				if("parent".equals(str[0])){
					return str[1];
				}
			}
		}
		return null;
	}
}
