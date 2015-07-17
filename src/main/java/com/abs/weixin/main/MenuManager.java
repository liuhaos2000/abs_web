package com.abs.weixin.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.pojo.Button;
import com.abs.weixin.pojo.CommonButton;
import com.abs.weixin.pojo.ComplexButton;
import com.abs.weixin.pojo.Menu;
import com.abs.weixin.pojo.ViewButton;
import com.abs.weixin.utils.AklkWeiXinIFUtil;
import com.abs.weixin.utils.WeixinConst;

/**
 * 菜单管理器类
 * 
 * @author zhangzhi
 * @date 2014-04-09
 */
public class MenuManager {
	private static Logger log = LoggerFactory.getLogger(MenuManager.class);

	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = WeixinConst.APPID;
		// 第三方用户唯一凭证密钥
		String appSecret = WeixinConst.APPSECRET;

		// 调用接口获取access_token
		AccessToken at = AklkWeiXinIFUtil.getAccessToken(appId, appSecret);

		if (null != at) {
			// 调用接口创建菜单
			int result = AklkWeiXinIFUtil.createMenu(getMenu(), at.getToken());

			// 判断菜单创建结果
			if (0 == result)
				log.info("菜单创建成功！");
			else
				log.info("菜单创建失败，错误码：" + result);
		}
	}

	/**
	 * 组装菜单数据
	 * 
	 * @return
	 */
	private static Menu getMenu() {

        ViewButton btn11 = new ViewButton();
        btn11.setName("新房搜索");
        btn11.setType("view");
        btn11.setUrl("http://m.soufun.com/xf/jn.html");
        
        ViewButton btn12 = new ViewButton();
        btn12.setName("精彩资讯");
        btn12.setType("view");
        btn12.setUrl("http://xw.qq.com/m/house/");
        
        CommonButton btn21 = new CommonButton();
        btn21.setName("菜单");
        btn21.setType("click");
        btn21.setKey("21");


		ViewButton btn31 = new ViewButton();
		btn31.setName("报名看房");
		btn31.setType("view");
		btn31.setUrl(WeixinConst.SEVERPATH + "k1/k10101.do");
		
		ViewButton btn32 = new ViewButton();
		btn32.setName("看房有礼");
		btn32.setType("view");
		btn32.setUrl(WeixinConst.SEVERPATH + "k2/k20101.do");
		
		ViewButton btn33 = new ViewButton();
		btn33.setName("在线团购");
		btn33.setType("view");
		btn33.setUrl(WeixinConst.SEVERPATH + "k3/k30101.do");
		
		ViewButton btn34 = new ViewButton();
		btn34.setName("动态播报");
		btn34.setType("view");
		btn34.setUrl(WeixinConst.SEVERPATH + "k4/k40101.do");
		

		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("新房");
		mainBtn1.setSub_button(new Button[] { btn11,btn12 });

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("买房赚钱");
		mainBtn2.setSub_button(new Button[] { btn21 });

		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("看房团");
		mainBtn3.setSub_button(new Button[] { btn21 });

		/**
		 * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br>
		 * 
		 * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br>
		 * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br>
		 * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 });
		 */
		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2 });

		return menu;
	}
}