package com.abs.mobile.controller;

import java.util.List;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TRegion;
import com.abs.mobile.service.UserAdderssService;

@Controller
@RequestMapping("/mobile/useradress")
public class UserAdressController extends BaseController {
	
    @Resource
    private UserAdderssService userAdderssService;
    
    /**
     * 取得一级地址
     * @return
     */
    @RequestMapping("/getAddressLevel1")
    @ResponseBody
    public Result getAddressLevel1() {
        Result request = new Result();
        List<TRegion> regionList= userAdderssService.getAddressLevel1();
        request.setData(regionList);
        return request;
    }
    /**
     * 取得二三级地址
     * @return
     */
    @RequestMapping("/getAddressLevel2")
    @ResponseBody
    public Result getAddressLevel2(String parent) {
        Result request = new Result();
        List<TRegion> regionList= userAdderssService.getAddressLevel2(parent);
        request.setData(regionList);
        return request;
    }
}
