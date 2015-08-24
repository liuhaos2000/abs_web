package com.abs.mobile.controller;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.service.CartService;
import com.abs.mobile.service.OrderService;

@Controller
@RequestMapping("/mobile/order")
public class OrderController extends BaseController {
	
    @Resource
    private CartService cartService;
    @Resource
    private OrderService orderService;
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/orderSubmit")
    @ResponseBody
    public Result orderSubmit(TOrder order,String orderItems) {
        JSONArray json = JSONArray.fromObject(orderItems);
        @SuppressWarnings("unchecked")
        List<TOrderDetail> orderDetailList = 
            (List<TOrderDetail>)JSONArray.toList(json, TOrderDetail.class);
        
        orderService.orderSubmit(order,orderDetailList);
        
        
        Result request = new Result();
        
        request.setData("");
        return request;
    }
    
}
