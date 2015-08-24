package com.abs.mobile.controller;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.service.CartService;

@Controller
@RequestMapping("/mobile/order")
public class OrderController extends BaseController {
	
    @Resource
    private CartService cartService;
	
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/orderSubmit")
    @ResponseBody
    public Result orderSubmit(TOrder order,String orderItems) {
        Result request = new Result();
        
        request.setData("");
        return request;
    }
    
}
