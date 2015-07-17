package com.abs.mobile.controller.mainpage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mobile/page")
public class MobilePageController {
	
	// 用户管理页面
	@RequestMapping("/mainpage")
	public String sysUser() {
		return "mobile/mainpage";
	}
	

}
