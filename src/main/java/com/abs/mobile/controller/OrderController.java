package com.abs.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.service.CartService;
import com.abs.mobile.service.OrderService;
import com.abs.util.exception.BusinessException;

@Controller
@RequestMapping("/mobile/order")
public class OrderController extends BaseController {
	
    @Resource
    private CartService cartService;
    @Resource
    private OrderService orderService;
    /**
     * 提交订单
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/orderSubmit")
    @ResponseBody
    public Result orderSubmit(TOrder order,String orderItems) throws BusinessException {
        JSONArray json = JSONArray.fromObject(orderItems);
        @SuppressWarnings("unchecked")
        List<TOrderDetail> orderDetailList = 
            (List<TOrderDetail>)JSONArray.toList(json, TOrderDetail.class);
        
        Result request = new Result();
        
        Map<String, Object> resultMap = orderService.orderSubmit(order,orderDetailList);
       
        request.setData(resultMap);
        return request;
    }
    
    /**
     * 更新订单为已经支付状态
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/updOrderToPayed")
    @ResponseBody
    public Result updOrderToPayed(String orderId) throws BusinessException {
        
        Result request = new Result();
        
        Map<String, Object> resultMap = orderService.updOrderToPayed(orderId);
        
        request.setData(resultMap);
        return request;
    }
    
    /**
     * 由于收货人地址发生改变：刷新商品价格
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/reItemPrice")
    @ResponseBody
    public Result reItemPrice(String addId) throws BusinessException {
        
        Result request = new Result();
        
        Map<String, Object> resultMap = orderService.reItemPrice(addId);
        
        request.setData(resultMap);
        return request;
    }
    
    
    /**
     * 从用户订单支付
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/userOrderToPay")
    @ResponseBody
    public Result userOrderToPay(String orderId) throws BusinessException {
        
        Result request = new Result();
        
        Map<String, Object> resultMap = orderService.doPayFromUserOrder(orderId);
       
        request.setData(resultMap);
        return request;
    }
}
