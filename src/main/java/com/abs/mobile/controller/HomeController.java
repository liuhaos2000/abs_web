package com.abs.mobile.controller;

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
	

}
