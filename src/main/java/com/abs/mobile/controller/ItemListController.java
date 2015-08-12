package com.abs.mobile.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.service.ItemListService;
import com.abs.util.commom.AbsTool;

@Controller
@RequestMapping("/mobile/itemlist")
public class ItemListController extends BaseController {
	
    @Resource
    private ItemListService itemListService;
    
    /**
     * 获取商品列表
     * @return
     */
    @RequestMapping("/getItemList")
    @ResponseBody
    public Result getItemList(
			@RequestParam(value="page", defaultValue="1") int pageNo, 
			@RequestParam(value="rows", defaultValue="2") int pageSize,
			@RequestParam(value="orderby", defaultValue="xiaoliang asc") String orderby,
			String searchparm,String typeId) {
    	Result result = new Result();
    	PageInfo pageInfo = new PageInfo(pageNo,pageSize,orderby);
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("searchparm", AbsTool.addLike(searchparm));
    	params.put("typeId", typeId);
        List<Map<String, String>> data = itemListService.getItemList(params, pageInfo);
        result.setData(data);
        return result;
    }
}
