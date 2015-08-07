package com.abs.mobile.controller.mainpage;

import javax.annotation.Resource;

import org.buzheng.demo.esm.service.SysGroupService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SessionService;

@Controller
@RequestMapping("/mobile/page")
public class MobilePageController {
    @Resource
    private SessionService sessionService;
	// index
	@RequestMapping("/index")
	public String toIndex() {
	    TUser tUser =sessionService.getLoginUser();
		return "mobile/index";
	}
    // home
    @RequestMapping("/home")
    public String toHome() {
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
}
