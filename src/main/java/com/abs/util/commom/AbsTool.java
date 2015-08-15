package com.abs.util.commom;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

public class AbsTool {
	/**
	 * 加百分号
	 * @param parm
	 * @return
	 */
	public static String addLike(String parm) {
		String result=null;
		if(StringUtils.isNotEmpty(parm)){
			result="%"+parm.trim()+"%";
		}
		return result;
	}
	/**
	 * 商品参数
	 * @param parm
	 * @return
	 */
	public static List<Map<String,String>> changeItemParm(String itemParm) {
		if(StringUtils.isEmpty(itemParm)){
			return null;
		}
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		String[] parms = itemParm.split("\\|");
		for (String  parm: parms) {
			if(StringUtils.isNotEmpty(parm)){
				String[] str = parm.split(":");
				Map<String,String> map = new HashMap<String,String>();
				map.put("key", str[0]);
				map.put("value", str[1]);
				list.add(map);
			}
		}
		return list;
	}

}