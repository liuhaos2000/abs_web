package com.abs.mobile.batch;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.abs.util.commom.AbsConst;
import com.abs.util.commom.WeixinConst;
import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.pojo.JsApiTicket;
import com.abs.weixin.pojo.Template;
import com.abs.weixin.pojo.TemplateParam;
import com.abs.weixin.utils.WeiXinIFUtil;

@Service
public class SendTempletMsg  {

	   public void runJobSendMsg() {  
			Template tem=new Template();
			tem.setTemplateId("n2J1K6zRE4SDNhK6o1UKUmlkd3n9P7VK2E7w0zmytW8");
			tem.setTopColor("#00DD00");
			tem.setToUser("o__evuKaM6-MCC3tKvxdWs64SZkI");
			tem.setUrl("");
					
			List<TemplateParam> paras=new ArrayList<TemplateParam>();
			paras.add(new TemplateParam("name","我们已收到您的货款，开始为您打包商品，请耐心等待: )","#FF3333"));
			paras.add(new TemplateParam("remark","¥20.00","#0044BB"));
					
			tem.setTemplateParamList(paras);
					
			boolean result=WeiXinIFUtil.sendTemplateMsg(AbsConst.access_token,tem);
	    }  
 
}
