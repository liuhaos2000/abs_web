package com.abs.mobile.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TItemDetailMapper;
import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TOrderDetailMapper;
import com.abs.mobile.dao.TOrderMapper;
import com.abs.mobile.dao.TUserAddressMapper;
import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TItem;
import com.abs.mobile.domain.TItemDetail;
import com.abs.mobile.domain.TItemDetailKey;
import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.domain.TOrderDetailKey;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.SendMessageService;
import com.abs.mobile.service.SessionService;
import com.abs.util.commom.AbsConst;
import com.abs.util.commom.AbsTool;
import com.abs.util.commom.WeixinConst;
import com.abs.weixin.pojo.Template;
import com.abs.weixin.pojo.TemplateParam;
import com.abs.weixin.utils.WeiXinIFUtil;

@Service
public class SendMessageServiceImpl implements SendMessageService {

	@Resource
	private SessionService sessionService;
	@Resource
	private TItemMapper tItemMapper;
	@Resource
	private TItemDetailMapper tItemDetailMapper;
	@Resource
	private TUserAddressMapper tUserAddressMapper;
	@Resource
	private TUserMapper tUserMapper;
	@Resource
	private TOrderDetailMapper tOrderDetailMapper;
	@Resource
	private TOrderMapper tOrderMapper;
	/**
	 * 购买成功提醒发货
	 * 提醒代理商，总部购买成功
	 * 状态在调用处已经更新
	 */
	@Override
	public void sendPaySuccessMsg(TOrder order, List<TOrderDetail> orderDetailList) {
		sendToOnwerFahuo(order, orderDetailList);
		sendToParentOrder(order,orderDetailList);
	}
	/**
	 * 发货后发送订单编号
	 */
	@Override
	public void sendFahuoMsg() {
		List<Map<String, String>> orderDetailList = 
				tOrderDetailMapper.getOrderSendFahuoMSG();
		Date date = new Date();
		String stOrderId=null;
		String stGongsiId=null;
		String stWuliuCode=null;
		for(Map<String, String> od :orderDetailList){
			// 发消息
			if(AbsTool.ifNullRetuenKong(od.get("order_id")).equals(stOrderId)&&
					AbsTool.ifNullRetuenKong(od.get("gongsi_name")).equals(stGongsiId)&&
					AbsTool.ifNullRetuenKong(od.get("wuliu_code")).equals(stWuliuCode)){
				
			}else{
				sendToUserAndParentFahuo(od.get("order_id"),od.get("gongsi_name"),od.get("wuliu_code"));
			}
			stOrderId=od.get("order_id");
			stGongsiId=od.get("gongsi_name");
			stWuliuCode=od.get("wuliu_code");
			
			// 更新状态
			TOrderDetailKey key=new TOrderDetailKey();
			key.setOrderId(od.get("order_id"));
			key.setItemId(Integer.valueOf(od.get("item_id")));
			key.setItemGuige(Integer.valueOf(od.get("item_guige")));
			key.setItemYanse(Integer.valueOf(od.get("tuihuo_flg")));
			key.setTuihuoFlg("0");
			TOrderDetail odd= tOrderDetailMapper.selectByPrimaryKey(key);
			odd.setMsgStatus(AbsConst.ORDER_SENDED);
			odd.setuDate(date);
			odd.setuUser("MSG_SEND");
			tOrderDetailMapper.updateByPrimaryKey(odd);
			
		}
		

	}

	@Override
	public void sendOrderClossMsg() {
		// TODO Auto-generated method stub

	}

	private void sendToOnwerFahuo(TOrder order, List<TOrderDetail> orderDetailList) {
		Template tem = new Template();
		tem.setTemplateId(WeixinConst.MSG_FAHUO);
		tem.setTopColor("#00DD00");
		tem.setUrl(WeixinConst.SEVERPATH+WeixinConst.HOME_PAGE);
		List<TemplateParam> paras = new ArrayList<TemplateParam>();
		// FF3333 红色 0044BB蓝色 000000 黑色
		paras.add(new TemplateParam("first", "您有来自悦东的新订单", "#0044BB"));

		paras.add(new TemplateParam("keyword2", order.getName(), "#0044BB"));
		paras.add(new TemplateParam("keyword3", order.getTel(), "#0044BB"));
		paras.add(new TemplateParam("keyword4", order.getAddressFull(), "#0044BB"));

		paras.add(new TemplateParam("remark", "希望您发货后，运单号返回悦东。", "#0044BB"));

		for (TOrderDetail orderDetail : orderDetailList) {

			TItemDetailKey key = new TItemDetailKey();
			key.setItemId(orderDetail.getItemId());
			key.setItemGuige(orderDetail.getItemGuige());
			key.setItemYanse(orderDetail.getItemYanse());
			TItemDetail itemDetail = tItemDetailMapper.selectByPrimaryKey(key);

			TItem item = tItemMapper.selectByPrimaryKey(orderDetail.getItemId());

			paras.add(new TemplateParam("keyword1",
					item.getItemName() + AbsTool.ifNullRetuenKong(itemDetail.getGuigeText())
							+ AbsTool.ifNullRetuenKong(itemDetail.getYanseText()) 
							+ "  数量："
							+ itemDetail.getShuliang().toString()
							+ "  价格："
							+ itemDetail.getCost().multiply(
									new BigDecimal(itemDetail.getShuliang().intValue())),
					"#0044BB"));
			tem.setTemplateParamList(paras);
			tem.setToUser(item.getOwnerOpenId());
			WeiXinIFUtil.sendTemplateMsg(AbsConst.access_token, tem);

			paras.remove(paras.size() - 1);
		}
	}

	private void sendToParentOrder(TOrder order, List<TOrderDetail> orderDetailList) {
		Template tem = new Template();
		tem.setTemplateId(WeixinConst.MSG_GOUMAI_OK);
		tem.setTopColor("#00DD00");
		tem.setUrl(WeixinConst.SEVERPATH+WeixinConst.HOME_PAGE);
		List<TemplateParam> paras = new ArrayList<TemplateParam>();
		// FF3333 红色 0044BB蓝色 000000 黑色
		paras.add(new TemplateParam("first", "您的客户购买了悦东商品", "#0044BB"));

		paras.add(new TemplateParam("keyword2", "1", "#0044BB"));
		paras.add(new TemplateParam("keyword3", order.getShijiPrice().toString(), "#0044BB"));

		paras.add(new TemplateParam("remark", "您的积分将于月底计入您的账户！", "#0044BB"));

		String itemAll = "";
		for (TOrderDetail orderDetail : orderDetailList) {
			TItem item = tItemMapper.selectByPrimaryKey(orderDetail.getItemId());
			itemAll = itemAll + item.getItemName() + " " + orderDetail.getShuliang().toString() + "件   ";
		}
		paras.add(new TemplateParam("keyword1", itemAll, "#0044BB"));

		if ("02".equals(order.getpUserLv())) {
			paras.add(new TemplateParam("keyword4", order.getLv02Lirun().toString(), "#0044BB"));
		} else if ("01".equals(order.getpUserLv())) {
			paras.add(new TemplateParam("keyword4", order.getLv01Lirun().toString(), "#0044BB"));
		} else {
			paras.add(new TemplateParam("keyword4", order.getLv00Lirun().toString(), "#0044BB"));
		}

		tem.setTemplateParamList(paras);
		tem.setToUser(order.getpOpenId());
		// 先给店铺User发
		WeiXinIFUtil.sendTemplateMsg(AbsConst.access_token, tem);

		// 如果是二级用户，需要给一级用户 和 顶级用户发
		if ("02".equals(order.getpUserLv())) {
			if(paras.size()==6){
				paras.remove(paras.size() - 1);
				paras.add(new TemplateParam("keyword4", order.getLv01Lirun().toString(), "#0044BB"));
				tem.setTemplateParamList(paras);
				TUser parentUser= tUserMapper.selectByPrimaryKey(order.getpOpenId());
				tem.setToUser(parentUser.getOpenId());
				WeiXinIFUtil.sendTemplateMsg(AbsConst.access_token, tem);
				
				paras.remove(paras.size() - 1);
				paras.add(new TemplateParam("keyword4", order.getLv00Lirun().toString(), "#0044BB"));
				tem.setTemplateParamList(paras);
				tem.setToUser(WeixinConst.SHOPMAST_USER_OPENID);
				WeiXinIFUtil.sendTemplateMsg(AbsConst.access_token, tem);
				
			}
			
		} else if ("01".equals(order.getpUserLv())) {
			// 如果是一级用户，需要给顶级用户发
			if(paras.size()==6){
				paras.remove(paras.size() - 1);
				paras.add(new TemplateParam("keyword4", order.getLv00Lirun().toString(), "#0044BB"));
				tem.setTemplateParamList(paras);
				tem.setToUser(WeixinConst.SHOPMAST_USER_OPENID);
				WeiXinIFUtil.sendTemplateMsg(AbsConst.access_token, tem);
			}
		} 

	}
	private void sendToUserAndParentFahuo(String orderId,String gongsiName,String wuliuCode) {
		Template tem = new Template();
		tem.setTemplateId(WeixinConst.MSG_ORDER_SEND);
		tem.setTopColor("#00DD00");
		tem.setUrl(WeixinConst.SEVERPATH+WeixinConst.HOME_PAGE);
		List<TemplateParam> paras = new ArrayList<TemplateParam>();
		// FF3333 红色 0044BB蓝色 000000 黑色
		paras.add(new TemplateParam("keyword1", orderId, "#0044BB"));
		paras.add(new TemplateParam("keyword2", gongsiName, "#0044BB"));
		paras.add(new TemplateParam("keyword3", wuliuCode, "#0044BB"));
		paras.add(new TemplateParam("remark", "点击查看完整的物流信息 。如有问题请致电"+WeixinConst.KEFU_TEL+"或直接在微信公众号里留言，悦东将在第一时间为您服务！", "#0044BB"));

		TOrder od = tOrderMapper.selectByPrimaryKey(orderId);
		paras.add(new TemplateParam("first", "您在"+WeixinConst.KEFU_GZH_NAME+"购买的商品已经发货", "#0044BB"));
		tem.setTemplateParamList(paras);
		tem.setToUser(od.getOpenId());
		// 发给客户
		WeiXinIFUtil.sendTemplateMsg(AbsConst.access_token, tem);
		
	}
}
