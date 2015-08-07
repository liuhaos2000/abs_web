package com.abs.mobile.batch;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.abs.util.commom.AbsConst;
import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.utils.AklkWeiXinIFUtil;
import com.abs.weixin.utils.WeixinConst;

@Service
public class ServiceStratAutoRun implements ApplicationListener<ContextRefreshedEvent> {

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		if (event.getApplicationContext().getParent() == null) {
			// root
			// application
			// context
			// 没有parent，他就是老大.
			// 需要执行的逻辑代码，当spring容器初始化完成后就会执行该方法。
			System.out.println("ServiceStratAutoRun>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			AccessToken accessToken = AklkWeiXinIFUtil.getAccessToken(WeixinConst.APPID, WeixinConst.APPSECRET);
			
			AbsConst.access_token = accessToken.getToken();
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			System.out.println(AbsConst.access_token);
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		}
	}

}