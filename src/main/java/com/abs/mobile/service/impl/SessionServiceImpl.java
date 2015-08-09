package com.abs.mobile.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SessionService;
import com.abs.util.commom.AbsConst;

@Service
public class SessionServiceImpl implements SessionService {
   
    @Autowired(required = false)
    private  HttpServletRequest request;
    
    @Override
    public TUser getLoginUser() {
        HttpSession session =request.getSession();
        TUser user = (TUser)session.getAttribute(AbsConst.LOGIN_USER);
        return user;
    }

	@Override
	public void setLoginUser(TUser user) {
		HttpSession session =request.getSession();
		session.setAttribute(AbsConst.LOGIN_USER, user);
	}
}
