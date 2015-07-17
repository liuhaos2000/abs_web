package com.abs.weixin.utils;

import java.util.Date;

import org.apache.log4j.Logger;

import com.abs.util.Log4jUtil;
import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.pojo.AccessTokenApp;


/**
 * 
 * @author liu
 * @date 2014-04-05
 */
public class AccessTokenUtil {
    
    public static String getAccessToken() {
//        Logger log = Log4jUtil.getLogger();
//        log.debug("------------>getAccessToken---start");
//        AccessTokenApp acc = (AccessTokenApp)ApplistionUtil.get("accessToken");
//        Date sysdate = new Date();
//        if(acc==null || (sysdate.getTime() - acc.getDatetime().getTime())/1000 > 6000 ) {
//            AccessToken accessToken = AklkWeiXinIFUtil.getAccessToken(
//                    WeixinConst.APPID, WeixinConst.APPSECRET);
//            acc=new AccessTokenApp();
//            acc.setToken(accessToken.getToken());
//            acc.setDatetime(sysdate);
//            ApplistionUtil.put("accessToken", acc);
//            log.debug("-----new------->getAccessToken---end"+accessToken.getToken());
//            return accessToken.getToken();
//
//        } else {
//            log.debug("------old------>getAccessToken---end"+acc.getToken());
//            return acc.getToken();
//
//        } 
        return "";
    }
}
