package com.abs.mobile.batch;

import org.springframework.stereotype.Service;

import com.abs.util.commom.AbsConst;
import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.utils.AklkWeiXinIFUtil;
import com.abs.weixin.utils.WeixinConst;

@Service
public class AccessTokenBatch  {

	   public void job1() {  
             System.out.println("AccessTokenBatch : get acess token");
		     AccessToken accessToken = AklkWeiXinIFUtil.getAccessToken(
             WeixinConst.APPID, WeixinConst.APPSECRET);
		     System.out.println(accessToken.getToken());
		     AbsConst.access_token = accessToken.getToken();
	    }  
 
}
