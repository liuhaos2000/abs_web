package com.abs.mobile.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.web.util.Result;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.service.ItemListService;
import com.abs.mobile.service.ItemService;
import com.abs.util.commom.AbsTool;

@Controller
@RequestMapping("/mobile/item")
public class ItemController extends BaseController {
	
    @Resource
    private ItemService itemService;
    
    /**
     * 获取商品列表
     * @return
     */
    @RequestMapping("/getItemPictureList")
    @ResponseBody
    public Result getItemList(
			@RequestParam(value="page", defaultValue="1") int pageNo, 
			@RequestParam(value="rows", defaultValue="2") int pageSize,
			@RequestParam(value="orderby", defaultValue="xiaoliang asc") String orderby,
			String searchparm,String typeId) {
    	Result result = new Result();
    	
        return result;
    }
}
