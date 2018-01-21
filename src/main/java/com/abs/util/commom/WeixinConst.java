package com.abs.util.commom;

/**
 * 常量定义
 * 
 * @author Liu
 * @date 2014-04-05
 */
public class WeixinConst {

	public static final String TOKEN= "abs_web_yuedongkeji";

	//运行
	public static final String APPID = "wxe6f7ad732dcc0e34";

	public static final String APPSECRET = "2fdaa37b09503a756f31ca93fc355d6e";

	public static final String SEVERPATH = "http://ruihegouwu.cn/";
	
	public static final String SHOPMAST_USER_OPENID = "oWQDLwyAbu_D2mu05eCLf7Ec4Ctc";
	//发货提醒 TO ITEM MASTER
	public static final String MSG_FAHUO = "4HrSZjN458t202bDIKDz7tBoK42TLdw2gNkb15sH2xE";
	//商品购买成功通知  TO PARENT
	public static final String MSG_GOUMAI_OK = "uGPGaOrTTyXhxbwY7cVucaAXBJgVKCDSZKjxLG9qDR8";
	//订单发货提醒 TO USER AND PARENT
	public static final String MSG_ORDER_SEND = "vs3c6IVS2ERLZUkUQJSndPzUm4e-QVrooTKiUs9UPj0";
	
	//运行
	
	//测试 ---------START
//	public static final String APPID = "wx5d3a57699afdcf6d";
//
//	public static final String APPSECRET = "f82a5314bdcdb704e588cfb8ff1ac497";
//
//	public static final String SEVERPATH = "http://abstest.51vip.biz/";
//	
//	public static final String SHOPMAST_USER_OPENID = "o__evuKaM6-MCC3tKvxdWs64SZkI";
//	//发货提醒 TO ITEM MASTER
//	public static final String MSG_FAHUO = "IJKgukN8FiYXhYwPR09ZxuHg0xsP97EfFnFU59FJmMc";
//	//商品购买成功通知  TO PARENT
//	public static final String MSG_GOUMAI_OK = "-tPQSjXXoJfGgkNZM-qB0t96Uyo2sRpRQ3P4fUP_7LQ";
//	//订单发货提醒 TO USER AND PARENT
//	public static final String MSG_ORDER_SEND = "lMe6yVT40Dq72htGm_EUDDN2u9Ec_mPCG9Z6BRZ4NIo";
	
	//测试--------- END
	
	
	public static final String HOME_PAGE="abs_web/app/mobile/page/index";

	public static String AUTHORIZE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
	// 统一下单
	public static String UNIFIEDORDER="https://api.mch.weixin.qq.com/pay/unifiedorder";
	
	// 微信支付商户号    受理商ID，身份标识
	public static String MCHID = "1489164292";
	// 商户支付密钥Key。审核通过后，在微信发送的邮件中查看
	public static String KEY = "liuhaos2000liuhaos2000liuhaos200";
	// 异步回调地址
	public static String NOTIFY_URL = SEVERPATH+"abs_web/paynotify";
	
	// 重定向地址
	public static String REDIRECT_URL = "http://XXXXXXXXXXXXXXXXXXX/callWeiXinPay";

	// web回调地址
	public static String WEB_NOTIFY_URL = "http://XXXXXXXXXXXXXXXXXXXXXXXXX/weixinPay_notify";
	
	// 客服电话
	public static String KEFU_TEL = "18623076530";

	// 客服Name
	public static String KEFU_NAME = "悦东";
	
	// 公众号Name，微信订单中显示
	public static String KEFU_GZH_NAME = "悦东优选";
	
	// 测试环境FLG
	public static String DBG_FLG="01";
	
}