package com.abs.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abs.mobile.service.HomeService;

@Controller
@RequestMapping("/mobile/page")
public class MobilePageController {

    @Resource
    HomeService homeService;
	// index
	@RequestMapping("/index")
	public String toIndex() {

		return "mobile/index";
	}
    // home
    @RequestMapping("/home")
    public String toHome(ModelMap map) {
        List<Map<String, Object>> data = homeService.getItem();
        map.put("data", data);
        return "mobile/home";
    }
    // type
    @RequestMapping("/type")
    public String toType() {
        return "mobile/type";
    }
    // cart
    @RequestMapping("/cart")
    public String toCart() {
        return "mobile/cart";
    }
    // huiyuan
    @RequestMapping("/huiyuan")
    public String toHuiyuan() {
        return "mobile/huiyuan";
    }
    
    // itemlist
    @RequestMapping("/itemlist")
    public String toItemlist(String searchparm,ModelMap map) {
        map.put("searchparm", searchparm);
        return "mobile/itemlist";
    }

    // 系统外
    @RequestMapping("/toWinXinShop")
    public String toWinXinShop(String pageCode,ModelMap map) {
    	map.put("pageCode", pageCode);
    	if("1".equals(pageCode)){
    		return "redirect:http://mp.weixin.qq.com/bizmall/mallshelf?id=&t=mall/list&biz=MzIyODAxMTQ4Mg==&shelf_id=1&showwxpaytitle=1#wechat_redirect";
    	}else if("2".equals(pageCode)){
    		return "redirect:http://mp.weixin.qq.com/bizmall/mallshelf?id=&t=mall/list&biz=MzIyODAxMTQ4Mg==&shelf_id=2&showwxpaytitle=1#wechat_redirect";
    	}
		return null;
    }
}
