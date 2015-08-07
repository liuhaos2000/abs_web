package org.buzheng.demo.esm.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.abs.mobile.domain.TUser;
import com.abs.util.commom.AbsConst;

public class SessionInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();
		logger.info("uri={}", uri);
		
		uri = uri.replaceFirst(request.getContextPath(), "");

		if (! uri.startsWith("/app/mobile/page/")) {
			return true;
		}

		if (request.getSession().getAttribute(AbsConst.LOGIN_USER) == null) {
			// 未登录
		    HttpSession session = request.getSession();
		    
		    session.setAttribute(AbsConst.LOGIN_USER, new TUser());

		}
		
		return true;
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
