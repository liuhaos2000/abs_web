package com.abs.mobile.service.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SessionService;
import com.abs.util.commom.AbsConst;
import com.abs.util.commom.AbsTool;
import com.abs.weixin.utils.Sign;
import com.abs.weixin.utils.SignUtil;
import com.vdurmont.emoji.EmojiParser;

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

	@Override
	public Map<String, String> getSignInfo(String requestmap) {
		String uri = request.getRequestURI();
		String url="http://"+request.getServerName()+
				request.getContextPath()+
				request.getServletPath()+
				requestmap;
				if(request.getQueryString()!=null){
					url+="?"+request.getQueryString();
				}

				
				
		Map<String,String> reult =  Sign.sign(AbsConst.jsapi_ticket, url);
		return reult;
	}

    @Override
    public String getUserIp() {
        return request.getRemoteAddr();
    }

	@Override
	public TUser getShopUser() {
        HttpSession session =request.getSession();
        TUser user = (TUser)session.getAttribute(AbsConst.SHOP_USER);
        return user;
	}

	@Override
	public void setShopUser(TUser user) {
		if(!StringUtils.isEmpty(user.getNickname())){
			user.setNickname(EmojiParser.parseToUnicode(user.getNickname()));
		}
		HttpSession session =request.getSession();
		session.setAttribute(AbsConst.SHOP_USER, user);
	}
}
