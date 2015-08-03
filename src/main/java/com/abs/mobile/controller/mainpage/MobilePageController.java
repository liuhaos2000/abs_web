package com.abs.mobile.controller.mainpage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mobile/page")
public class MobilePageController {
	
	// index
	@RequestMapping("/index")
	public String toIndex() {
		return "mobile/index";
	}
    // home
    @RequestMapping("/home")
    public String toHome() {
        return "mobile/home";
    }

}
