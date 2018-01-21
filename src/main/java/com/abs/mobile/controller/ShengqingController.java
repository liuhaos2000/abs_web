package com.abs.mobile.controller;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.service.ShengqingService;
import com.abs.util.exception.BusinessException;

@Controller
@RequestMapping("/mobile/shengqing")
public class ShengqingController extends BaseController {
	
    @Resource
    private ShengqingService shengqingService;
	
    /**
     * 会员申请
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/shengqingvip")
    @ResponseBody
    public Result shengqingvip(String parent) throws BusinessException {
        Result request = new Result();
        shengqingService.ShengqingVip(parent);
        return request;
    }
}
