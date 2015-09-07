package org.buzheng.demo.esm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page")
public class PageController {
	
	// 用户管理页面
	@RequestMapping("/sysuser")
	public String sysUser() {
		return "system/user";
	}
	
	// 角色管理页面
	@RequestMapping("/sysrole")
	public String sysRole() {
		return "system/role";
	}
	
	// 菜单管理页面
	@RequestMapping("/sysmenu")
	public String sysMenu() {
		return "system/menu";
	}
	
	// 菜单管理页面
	@RequestMapping("/sysgroup")
	public String sysGroup() {
		return "system/group";
	}
		
	// 修改密码页面
	@RequestMapping("/syspasswd")
	public String sysPasswd() {
		return "system/password";
	}
	
	// 修改密码页面
    @RequestMapping("/type")
    public String sysType() {
        return "system/type";
    }
    
    
    /**
     * 商品
     * 商品类型
     */
    // 修改密码页面
    @RequestMapping("/itemtype")
    public String itemtype() {
        return "item/itemtype";
    }
    /**
     * 店铺设置
     * 主业轮播
     */
    // 修改密码页面
    @RequestMapping("/lunbo")
    public String lunbo() {
        return "shop/lunbo";
    }
    /**
     * 店铺设置
     * 物流设置
     */
    @RequestMapping("/wuliu")
    public String wuliu() {
        return "shop/wuliu";
    }
    
    
    
}
