package com.abs.mobile.controller.mainpage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.buzheng.demo.esm.App;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysUser;
import org.buzheng.demo.esm.service.SysUserService;
import org.buzheng.demo.esm.util.AppHelper;
import org.buzheng.demo.esm.web.util.Result;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/homepage")
@SessionAttributes(App.USER_SESSION_KEY)
public class HomeController extends BaseController {
	
	@Resource
	private SysUserService sysUserService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<SysUser> list() {
		return this.sysUserService.findAll();		
	}
	
	@RequestMapping("/page")
	@ResponseBody
	public Map<String, Object> page(
			@RequestParam(value="page", defaultValue="1") int pageNo, 
			@RequestParam(value="rows", defaultValue="20") int pageSize,
			@ModelAttribute(App.USER_SESSION_KEY) SysUser user) {
		
		pageNo = pageNo > 0 ? pageNo - 1 : pageNo;
		PageInfo pageInfo = new PageInfo(pageNo,pageSize,"USERNAME DESC");
		
		
		Order order = new Order("USERNAME DESC");
		Sort sort = new Sort(order);
		Pageable pageRequest = new PageRequest(pageNo, pageSize,sort);

		Page<SysUser> page = null;
		
		if (user == null) {
			return null;
		}
		
		// 超级管理员才能查全部用户，其他只能查自己机构内部的用户
		if (App.SUPER_ROLE_ID.equals(user.getRoleId())) {
			page = this.sysUserService.findPage(pageInfo);
		} else {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("groupId", user.getGroupId());
			page = this.sysUserService.findPage(params, pageInfo);
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("total", page.getTotalElements());
		data.put("rows", page.getContent());
		
		return data;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Result add(SysUser user) throws Exception {
		this.sysUserService.save(user);
		return new Result();
	}
	
	@RequestMapping("/update")
	@ResponseBody
    public Result update(@Valid SysUser user, BindingResult result) {
        // StandardValidationContext
        if(result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError err : errors) {
                System.out.println("ObjectName:" + err.getObjectName() + "\tFieldName:" + err.getField()
                        + "\tFieldValue:" + err.getRejectedValue() + "\tMessage:" + err.getDefaultMessage() + "\tCode:"
                        +err.getCode());
            }
        }
        
        this.sysUserService.update(user);
        return new Result();
    }
	
	@RequestMapping("/delete")
	@ResponseBody
	public Result delete(@RequestParam("userId") String userId) {
		this.sysUserService.delete(userId);
		return new Result();
	}
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public Result updatePassword(
			@RequestParam("userId") String userId,
			@RequestParam(value = "oldPassword", defaultValue = "") String oldPassword,
			@RequestParam(value = "newPassword", defaultValue = "") String newPassword) {
		
		oldPassword = oldPassword.trim();
		newPassword = newPassword.trim();
		
		if (oldPassword.isEmpty()) {
			throw new IllegalArgumentException("缺少旧密码");
		}
		
		if (newPassword.isEmpty()) {
			throw new IllegalArgumentException("缺少新密码");
		}
		
		if (newPassword.equals(oldPassword)) {
			throw new IllegalArgumentException("新旧密码不能相同");
		}
		
		SysUser user = this.sysUserService.findByUserId(userId);
		if (user != null && AppHelper.encryptPassword(oldPassword).equals(user.getPassword())) {
			this.sysUserService.updatePassword(userId, newPassword.trim());
			return new Result();
		}
		
		return new Result("原密码输入错误");
	}
	
	@RequestMapping("/resetPassword")
	@ResponseBody
	public Result resetPassword(@RequestParam("userId") String userId) {
		
		this.sysUserService.resetPassword(userId);
		return new Result();
	}
	
}