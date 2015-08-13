package com.abs.mobile.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abs.mobile.domain.TItemType;
import com.abs.mobile.service.HomeService;
import com.abs.mobile.service.ItemListService;
import com.abs.mobile.service.ItemService;
import com.abs.mobile.service.TypeService;
import com.abs.util.commom.AbsTool;

@Controller
@RequestMapping("/mobile/page")
public class MobilePageController {

    @Resource
    private HomeService homeService;
    @Resource
    private TypeService typeService;
    @Resource
    private ItemListService itemListService;
    @Resource
    private ItemService itemService;
	// index
	@RequestMapping("/index")
	public String toIndex() {

		return "mobile/index";
	}
    // home
    @RequestMapping("/home")
    public String toHome(ModelMap map) {
    	Map<String, Object> resultmap = homeService.getItem();
        map.put("data", resultmap);
        return "mobile/home";
    }
    // type
    @RequestMapping("/type")
    public String toType(ModelMap map) {
        List<TItemType> typeList=typeService.getTypePrentList();
        map.put("typeList", typeList);
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
    public String getItemList(
			@RequestParam(value="page", defaultValue="1") int pageNo, 
			@RequestParam(value="rows", defaultValue="2") int pageSize,
			@RequestParam(value="orderby", defaultValue="min_price asc") String orderby,
			String searchparm,String typeId,ModelMap map) {
        int pgNo = pageNo > 0 ? pageNo - 1 : pageNo;
    	PageInfo pageInfo = new PageInfo(pgNo,pageSize,orderby);
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("searchParm", AbsTool.addLike(searchparm));
    	params.put("typeId", typeId);
    	Page<Map<String,String>> page = itemListService.getItemList(params, pageInfo);
        // 返回结果
        map.put("itemList", page.getContent());
        map.put("page", pageNo);
        map.put("rows", pageSize);
        map.put("orderby", orderby);
        map.put("total", page.getTotalElements());
        
        int shang = (int)page.getTotalElements() / pageSize;
        int yushu = (int)page.getTotalElements() % pageSize;
        if(yushu>0){
            shang = shang+1;
        }
        map.put("pagetotal", shang);
        //参数返回
        map.put("searchparm", searchparm);
        map.put("typeId", typeId);
        return "mobile/itemlist";
    }
    // item
    @RequestMapping("/item")
    public String toItem(String itemId,ModelMap map) {
        
        Map<String, Object> resultMap =  itemService.getItem(itemId);
        
        map.put("result", resultMap);  
        
        return "mobile/item";
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
