package com.abs.mobile.interceptor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TUser;
import com.abs.util.commom.AbsConst;
import com.abs.util.commom.WeixinConst;

public class SessionInterceptor implements HandlerInterceptor { 

	private Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	private TUserMapper tUserMapper;
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();
		logger.info("uri={}", uri);
		
		uri = uri.replaceFirst(request.getContextPath(), "");

		if (! uri.startsWith("/app/mobile/")) {
			return true;  
		}

		
		// 用户验证时放行
		if (uri.startsWith("/app/mobile/authorize/")) {
			return true;
		}
		
		//=================check start===========================
//		String sessionUri=(String)request.getSession().getAttribute("URI");
//		Date sessionDate=(Date)request.getSession().getAttribute("TIMEST");
//		if(sessionUri!=null && sessionDate!=null){
//			Date sysDate=new Date();
//			long cha=sysDate.getTime()-sessionDate.getTime();
//			//重複請求
//			if(sessionUri.equals(uri)&&cha<2000){
//				
//				return true;
//			}
//		} 
//		request.getSession().setAttribute("URI", uri);
//		request.getSession().setAttribute("TIMEST", new Date());
 
		//==================check end  ==========================
        System.out.println("BBBBBBBBBBBBBBBBBBBBBBBB： "+ request.getRemoteAddr()+ uri);
		// 测试 
//		if (request.getSession().getAttribute(AbsConst.LOGIN_USER) == null) {
//			// 未登录
//		    HttpSession session = request.getSession(); 
//		    TUser user = tUserMapper.selectByPrimaryKey("oWQDLwyAbu_D2mu05eCLf7Ec4Ctc");
//		    
//		    session.setAttribute(AbsConst.LOGIN_USER, user);
//		} 

		// 运行
		if (request.getSession().getAttribute(AbsConst.LOGIN_USER) == null) {
			// 未登录
			
			String redirecturi = WeixinConst.SEVERPATH + "abs_web/app/mobile/authorize/base";
			redirecturi=URLEncoder.encode(redirecturi, "UTF-8");
	        // 参数 
			//String url = request.getServletPath();
	        String state = null;
	        String queryString = request.getQueryString();
	        if (StringUtils.isEmpty(queryString)) {
	            state = uri;
	        } else{
	            state = uri + "?"+queryString;
	            // 转换
	            try {
	                state = URLEncoder.encode(state, "UTF-8");
	            } catch (UnsupportedEncodingException e) {
	                e.printStackTrace();
	            }
	           
	        }
            String rurl = WeixinConst.AUTHORIZE_URL;
            rurl = rurl.replace("APPID", WeixinConst.APPID)
                    .replace("REDIRECT_URI", redirecturi)
                    .replace("STATE", state);
            response.sendRedirect(rurl);
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
            return false;

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
