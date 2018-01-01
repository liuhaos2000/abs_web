package com.abs.mobile.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.abs.util.commom.AbsTool;
import com.thoughtworks.xstream.converters.basic.BigDecimalConverter;

import net.sf.json.JSONArray;


public class MyTest {

/**
 * 您好，您已购买成功。
*
*商品信息：{{name.DATA}}
*{{remark.DATA}}
 * @param args
 */
		
	    public static void main(String[] args) {
	    	
	    	String aaa="abc";
	    	Integer bbb=123;
	    	BigDecimal ccc= new BigDecimal("1.12");
	    	Object obj=bbb;
	    	if(obj instanceof String){
	    		System.out.println(obj);
	    	}else if(obj instanceof Integer){
	    		System.out.println(obj.toString());
	    	}else if(obj instanceof BigDecimal){
	    		System.out.println(obj.toString());
	    	}
	    	
	    	
	    	
	    	
	    }
	    		
	    	
	 
		
	}
