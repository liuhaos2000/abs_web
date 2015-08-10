package com.abs.mobile.controller;

import java.util.List;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TIndexLunbo;
import com.abs.mobile.service.HomeService;

@Controller
@RequestMapping("/mobile/cart")
public class CartController extends BaseController {
	
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/getCount")
    @ResponseBody
    public Result getLunBolist() {
        Result request = new Result();
        request.setData(3);
        return request;
    }
}
