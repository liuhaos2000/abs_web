package org.buzheng.demo.esm.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.buzheng.demo.esm.App;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysType;
import org.buzheng.demo.esm.domain.SysUser;
import org.buzheng.demo.esm.service.DataExistsException;
import org.buzheng.demo.esm.service.SysTypeService;
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
@RequestMapping("/sys/type")
@SessionAttributes(App.USER_SESSION_KEY)
public class SysTypeController extends BaseController {
	
	@Resource
	private SysTypeService sysTypeService;
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> page(
			@RequestParam(value="page", defaultValue="1") int pageNo, 
			@RequestParam(value="rows", defaultValue="20") int pageSize,
			@ModelAttribute(App.USER_SESSION_KEY) SysUser user) {
		
		pageNo = pageNo > 0 ? pageNo - 1 : pageNo;
		PageInfo pageInfo = new PageInfo(pageNo,pageSize,"TYPE_CODE ASC");
		
		
		Order order = new Order("TYPE_CODE ASC");
		Sort sort = new Sort(order);
		Pageable pageRequest = new PageRequest(pageNo, pageSize,sort);

		Page<SysType> page = null;
		
		if (user == null) {
			return null;
		}
		
		// 查询
		page = this.sysTypeService.findPage(pageInfo);
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("total", page.getTotalElements());
		data.put("rows", page.getContent());
		
		return data;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Result add(SysType type) throws Exception {
		this.sysTypeService.save(type);
		return new Result();
	}
	
	@RequestMapping("/update")
	@ResponseBody
    public Result update(@Valid SysType type, BindingResult result) throws Exception {
        // StandardValidationContext
        if(result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError err : errors) {
                System.out.println("ObjectName:" + err.getObjectName() + "\tFieldName:" + err.getField()
                        + "\tFieldValue:" + err.getRejectedValue() + "\tMessage:" + err.getDefaultMessage() + "\tCode:"
                        +err.getCode());
            }
        }
        
        this.sysTypeService.update(type);
        return new Result();
    }
	
	@RequestMapping("/delete")
	@ResponseBody
	public Result delete(@RequestParam("typeCode") String typeCode) {
		this.sysTypeService.delete(typeCode);
		return new Result();
	}
	
	
}
