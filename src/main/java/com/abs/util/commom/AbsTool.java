package com.abs.util.commom;

import org.apache.commons.lang.StringUtils;

public class AbsTool {
	/**
	 * 加百分号
	 * @param parm
	 * @return
	 */
	public static String addLike(String parm) {
		String result="";
		if(StringUtils.isNotEmpty(parm)){
			result="%"+parm.trim()+"%";
		}
		return result;
	}

}