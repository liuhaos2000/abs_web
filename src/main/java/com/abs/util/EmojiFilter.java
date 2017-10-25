package com.abs.util;

import org.apache.commons.lang.StringUtils;


public class EmojiFilter {
	public static String removeNonBmpUnicode(String str) {  
		   if (StringUtils.isEmpty(str)) {  
		       return null;  
		   }  
		   str = str.replaceAll("[^\\u0000-\\uFFFF]", "");  
		  return str;  
		} 
}