package com.abs.mobile.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TCartMapper;
import com.abs.mobile.dao.TItemDetailMapper;
import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TOrderDetailMapper;
import com.abs.mobile.dao.TOrderMapper;
import com.abs.mobile.dao.TRegionMapper;
import com.abs.mobile.dao.TUserAddressMapper;
import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TCartKey;
import com.abs.mobile.domain.TItem;
import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.domain.TRegion;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.domain.TUserAddress;
import com.abs.mobile.domain.TUserAddressKey;
import com.abs.mobile.service.OrderService;
import com.abs.mobile.service.SessionService;
import com.abs.util.commom.AbsConst;
import com.abs.util.exception.BusinessException;
import com.abs.weixin.pojo.PayParm;
import com.abs.weixin.utils.MessageUtil;
import com.abs.weixin.utils.Sign;
import com.abs.weixin.utils.WeiXinIFUtil;
import com.abs.weixin.utils.WeixinConst;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private TCartMapper tCartMapper;
    @Resource
    private SessionService sessionService;
    @Resource
    private TUserAddressMapper tUserAddressMapper;
    @Resource
    private TRegionMapper tRegionMapper;
    @Resource
    private TOrderMapper tOrderMapper;
    @Resource
    private TOrderDetailMapper tOrderDetailMapper;
    @Resource
    private TItemDetailMapper tItemDetailMapper;
    @Resource
    private TItemMapper tItemMapper;
    /**
     * 订单初始化
     */
    @Override
    @Transactional(rollbackFor=Exception.class) 
    public Map<String, Object> initOrder(List<TCart> cartList) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        for(TCart tcart : cartList){
            if(tcart==null){
                resultMap.put("message", "没有购物数据！");
                return resultMap;
            }
        }
        TUser user=sessionService.getLoginUser();
        Date date = new Date();
        //1 更新Cart到数据库
        for(TCart tcart : cartList){
            TCartKey key = new TCartKey();
            key.setItemId(tcart.getItemId());
            key.setItemGuige(tcart.getItemGuige());
            key.setItemYanse(tcart.getItemYanse());
            key.setOpenId(user.getOpenId());
            TCart dbCart = tCartMapper.selectByPrimaryKey(key);
            dbCart.setShuliang(tcart.getShuliang());
            dbCart.setDelFlg(tcart.getDelFlg());
            dbCart.setuDate(date);
            dbCart.setuUser("TOORDER");
            tCartMapper.updateByPrimaryKey(dbCart);
        }
        
        //2取得用户地址
        List<Map<String,String>> uadList = tUserAddressMapper.getUserAddress(user.getOpenId());
        resultMap.put("uadList", uadList);
        String toArea = "";
        if(uadList!=null && uadList.size()>=1){
        	toArea = uadList.get(0).get("region_name1");
        }
        
        //3返回商品清单
        List<Map<String, Object>> itemlist = tCartMapper.getItemFromCartWhitYoufei(user.getOpenId(),toArea);
        List<Map<String, Object>> itemlistGrouped = groupItem(itemlist);
        Map<String, String> priceTotal = sumPrice(itemlist);
        resultMap.put("itemlistGrouped", itemlistGrouped);
        resultMap.put("priceTotal", priceTotal);
        resultMap.put("itemlist", itemlist);
        // 画面结构组装
        // owner
        //    1 名称 金额
        //    2 名称  金额
        //        发货地：XX，运费：00.00
        //    1 名称 金额
        //    2 名称  金额
        //        发货地：XX，运费：00.00
        
        //        if(itemlist.size()>0){
//        	for(int i=0;i<itemlist.size();i++){
//        		// list中删除未选中的商品
//        		if(!("1".equals(itemlist.get(i).get("del_flg")))){  
//        			itemlist.remove(i);  
//        			i=i-1;
//                }  
//        	}
//        }


        // 4一级地址
        List<TRegion> regionList= tRegionMapper.getRegion1();
        resultMap.put("regionList", regionList);
        //5可用积分
        resultMap.put("jifen", user.getJifen());
        //6商品总价
//        Map priceMap = tCartMapper.getItemFromCartTotalPrice(user.getOpenId(),"5");
//        BigDecimal p = (BigDecimal)priceMap.get("item_total_price");
//        Map youfeiMap = tCartMapper.getItemFromCartTotalYoufei(user.getOpenId(),"5");
//        BigDecimal y = (BigDecimal)youfeiMap.get("youfei_total");
        //7
        
        // JSAPI 签名信息
        //resultMap.put("signInfo", sessionService.getSignInfo("/mobile/page/order"));
        
        
        return resultMap;
    }




	/**
     * 提交订单，返回支付结果
     * @throws BusinessException 
     */
    @Override
    @Transactional(rollbackFor=Exception.class) 
    public Map<String, Object> orderSubmit(TOrder order, 
            List<TOrderDetail> orderDetailList) throws BusinessException {
        
        TUser user =sessionService.getLoginUser();
        Date date = new Date();
        // 一.生成订单
        //1.CHECK 
        //checkOrder(order,orderDetailList,user);
        //2.采集订单号
        String orderId = getNewOrderId();
        //3.订单插入
        //3.1 order 就绪
        order.setOrderId(orderId);
        // TODO
        //order.setOrderZhifuId(orderZhifuId);
        order.setOrderDate(date);
        order.setStatus(AbsConst.ORDER_WAIT_PAY);
        order.setOpenId(user.getOpenId());
        if(!("1".equals(order.getJifenFlg()))){
            //未使用积分
            order.setJifenDixiao(null);
        }
        order.setcDate(date);
        order.setcUser("ORDERSUBMIT");
        order.setuDate(date);
        order.setuUser("ORDERSUBMIT");
        // 3.2 明细就绪
        //String orderName = null;
        for (TOrderDetail tOrderDetail : orderDetailList) {
            
            Map<String, String> detail = tItemDetailMapper.getItemSalePrice(String.valueOf(tOrderDetail.getItemId()),
                    String.valueOf(tOrderDetail.getItemGuige()), 
                    String.valueOf(tOrderDetail.getItemYanse()));
            
            TItem tItem= tItemMapper.selectByPrimaryKey(tOrderDetail.getItemId());

            // if(orderName==null){
            // orderName=tItem.getItemName();
            // }
            
            // order_id
            tOrderDetail.setOrderId(orderId);
            // guige_text
            tOrderDetail.setGuigeText(detail.get("guige_text"));
            // yanse_text
            tOrderDetail.setYanseText(detail.get("yanse_text"));
            // owner
            tOrderDetail.setOwner(tItem.getOwner());
            // huodong_flg
            tOrderDetail.setHuodongFlg(detail.get("end_price_type"));
            // price
            Object o = detail.get("sale_price");
            tOrderDetail.setPrice((BigDecimal)o);
            // status
            tOrderDetail.setStatus("1");
            // 公共
            tOrderDetail.setcDate(date);
            tOrderDetail.setcUser("ORDERSUBMIT");
            tOrderDetail.setuDate(date);
            tOrderDetail.setuUser("ORDERSUBMIT");
        }
        
        // 二.先做订单号签名
        String nonce_str = Sign.create_nonce_str();
        nonce_str = nonce_str.substring(0, 32);
        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        
        packageParams.put("appid", WeixinConst.APPID);
        packageParams.put("mch_id", WeixinConst.MCHID);
        packageParams.put("nonce_str", nonce_str);
        // TODO 商品描述，商户订单号,金额  暂定TEST
        packageParams.put("body", "西域果品优选");
        packageParams.put("out_trade_no", order.getOrderId());
        packageParams.put("total_fee", String.valueOf(order.getShijiPrice().multiply(
                                        new BigDecimal(100)).intValue()));
        //packageParams.put("spbill_create_ip", "192.168.1.1");
        packageParams.put("spbill_create_ip", sessionService.getUserIp());
        packageParams.put("notify_url", WeixinConst.NOTIFY_URL);
        packageParams.put("trade_type", "JSAPI");
        packageParams.put("openid", user.getOpenId());
        
        String sign = Sign.createPaySign(packageParams);
        
        // 做成XML
        PayParm payParm = new PayParm();
        payParm.setAppid(WeixinConst.APPID);
        payParm.setMch_id(WeixinConst.MCHID);
        payParm.setNonce_str(nonce_str);
        payParm.setSign(sign);
        
        // TODO 商品描述，商户订单号,金额  暂定TEST
        payParm.setBody("西域果品优选");
        payParm.setOut_trade_no(order.getOrderId());
        payParm.setTotal_fee(String.valueOf(order.getShijiPrice().multiply(
                new BigDecimal(100)).intValue()));

        //payParm.setSpbill_create_ip("192.168.1.1");
        payParm.setSpbill_create_ip(sessionService.getUserIp());
        payParm.setNotify_url(WeixinConst.NOTIFY_URL);
        payParm.setTrade_type("JSAPI");
        payParm.setOpenid(user.getOpenId());
        
        String xmlParm = MessageUtil.payParmToXml(payParm);
        xmlParm = xmlParm.replaceAll("__", "_");
        
        Map<String,String> rMap = WeiXinIFUtil.httpRequestXML(WeixinConst.UNIFIEDORDER, "GET", xmlParm);
       
        if(rMap==null || !("SUCCESS".equals(rMap.get("return_code")))){
            throw new BusinessException("ordersubmit.weixin.getpayid");
        }else{
            // DB 写入
            order.setOrderZhifuId(rMap.get("prepay_id"));
            tOrderMapper.insert(order);
            for (TOrderDetail tOrderDetail : orderDetailList) {
            	System.out.println("KEY:"+tOrderDetail.getItemId());
                tOrderDetailMapper.insert(tOrderDetail);
                //删除CART
                TCartKey key = new TCartKey();
                key.setOpenId(user.getOpenId());
                key.setItemId(tOrderDetail.getItemId());
                key.setItemGuige(tOrderDetail.getItemGuige());
                key.setItemYanse(tOrderDetail.getItemYanse());
                tCartMapper.deleteByPrimaryKey(key);
                
                //扣减库存 TODO
            }
        }
        
        // 生成支付签名
        String packageid = "prepay_id="+rMap.get("prepay_id");
        SortedMap<String, String> parm = new TreeMap<String, String>();
        parm.put("appId", WeixinConst.APPID);
        parm.put("timeStamp", Sign.create_timestamp());
        parm.put("nonceStr", nonce_str);
        parm.put("package", packageid);
        parm.put("signType", "MD5");
        // 支付信息生产
        String sign2 = Sign.createPaySign(parm);
        parm.put("sign", sign2);
        
        Map<String, Object> resultMap =  new HashMap<String, Object>();
        
        resultMap.put("appId", parm.get("appId"));
        resultMap.put("timeStamp", parm.get("timeStamp"));
        resultMap.put("nonceStr", parm.get("nonceStr"));
        resultMap.put("prepay_id", parm.get("package"));
        resultMap.put("signType", parm.get("signType"));
        resultMap.put("sign", parm.get("sign"));
        
        resultMap.put("orderId", order.getOrderId());
        resultMap.put("payId", rMap.get("prepay_id"));
        // JSAPI 签名信息
        //resultMap.put("signInfo", sessionService.getSignInfo("/mobile/order/orderSubmit"));
        
        return resultMap;
    }

    /**
     * 用户传来的数据 和 后台计算的数据核对
     * @param order
     * @param orderDetailList
     * @throws BusinessException 
     */
    private void checkOrder(TOrder order, 
            List<TOrderDetail> orderDetailList,TUser user) throws BusinessException {
        // 1.库存 check 
        List<Map<String, Object>> list = tCartMapper.getItemFromCartWhitYoufei(user.getOpenId(),"5");
        for(Map map:list){
            Integer kucun = (Integer)map.get("kucun");
            Integer shuliang = (Integer)map.get("shuliang");
            if(kucun<shuliang){
                throw new BusinessException("ordersubmit.kucun.error");
            }
        }
        // 1.1 cart check
        if(orderDetailList!=null){
            for(TOrderDetail itemDetail : orderDetailList){
                
                TCartKey key = new TCartKey();
                key.setOpenId(user.getOpenId());
                key.setItemId(itemDetail.getItemId());
                key.setItemGuige(itemDetail.getItemGuige());
                key.setItemYanse(itemDetail.getItemYanse());
                TCart  tCart = tCartMapper.selectByPrimaryKey(key );
                if(tCart==null){
                    throw new BusinessException("ordersubmit.cart.error");
                }
            }
        }
        // 2.商品价格计算 check
        Map priceMap = tCartMapper.getItemFromCartTotalPrice(user.getOpenId(),"5");
        BigDecimal p = (BigDecimal)priceMap.get("item_total_price");
        if(p.compareTo(order.getTotlePrice())!=0){
            throw new BusinessException("ordersubmit.itemprice.error");
        }
        // 3.邮费计算 check
        Map youfeiMap = tCartMapper.getItemFromCartTotalYoufei(user.getOpenId(),"5");
        BigDecimal y = (BigDecimal)youfeiMap.get("youfei_total");
        if(y.compareTo(order.getWuliuYunfei())!=0){
            throw new BusinessException("ordersubmit.yunfei.error");
        }
        // 4.积分 check
        if("1".equals(order.getJifenFlg())){
            if(order.getJifenDixiao().compareTo(new BigDecimal(user.getJifen()))>1){
                throw new BusinessException("ordersubmit.jifen.error");
            }
        }
        // 5.总价 check
        BigDecimal t= p.add(y);
        if(t.compareTo(order.getShijiPrice())!=0){
            throw new BusinessException("ordersubmit.zongjia.error");
        }
    }
    /**
     * 采番订单ID
     * @return
     */
    private String getNewOrderId(){
        
        return tOrderMapper.getNewOrderId();
        
    }


    /**
     * 更新支付状态
     */
    @Override
    @Transactional(rollbackFor=Exception.class) 
    public Map<String, Object> updOrderToPayed(String orderId) {
        
        Date date = new Date();
        
        TOrder record = tOrderMapper.selectByPrimaryKey(orderId );
        record.setStatus(AbsConst.ORDER_PAYED);
        record.setuDate(date);
        record.setuUser("UPD_ORDER_PAYED");
        tOrderMapper.updateByPrimaryKey(record);
        
        Map<String, Object> resultMap =  new HashMap<String, Object>();
        return resultMap;
        
    }
    /**
     * 按照Owner和fromarea进行分组
     * @param itemList
     * @return
     */
    private List<Map<String,Object>> groupItem(List<Map<String,Object>> itemList){
        // owner1
        //    1 名称a  金额
        //    2 名称b  金额
        //        发货地：aaa，运费：00.00
        //    1 名称c  金额
        //    2 名称d  金额
        //        发货地：bbb，运费：00.00
        // owner2
        //    1 名称e 金额
        //    2 名称f  金额
        //        发货地：xxx，运费：00.00
        //    1 名称g 金额
        //    2 名称h  金额
        //        发货地：yyy，运费：00.00
    	List<Map<String,Object>> resultmap = new ArrayList<Map<String,Object>>();
    	
    	String workOwner="";
    	String workFromArea="";
    	
    	Map<String,Object> ownerMap = null;
    	List<Map<String,Object>> ownerList = null;
    	Map<String,Object> ownerItemMap = null;
    	List<Map<String,Object>> ownerItemList = null;
    	
    	for(Map<String,Object> item : itemList){
    		if(workOwner.equals(item.get("owner"))){
    			
    			if(workFromArea.equals(item.get("from_area").toString())){
    				ownerItemList.add(item);
    			}else{
    				// 如果Fromarea改变
        			ownerItemMap = new HashMap<String,Object>();
        			ownerItemList = new ArrayList<Map<String,Object>>();
        			ownerItemMap.put("fromArea", item.get("from_name"));
           			ownerItemMap.put("toArea", item.get("to_name"));
           			ownerItemMap.put("fromToYoufei", item.get("group_youfei"));
        			ownerItemMap.put("ownerItemList", ownerItemList);

        			ownerItemList.add(item);
        			
        			ownerList.add(ownerItemMap);
        			
        			// 保存
        			workFromArea=item.get("from_area").toString();
    			}
    		}else{
    			// 如果Owner改变
    			ownerMap = new HashMap<String,Object>();
    			ownerList = new ArrayList<Map<String,Object>>();
    			ownerMap.put("owner", item.get("owner"));
    			ownerMap.put("ownerList", ownerList);
    			resultmap.add(ownerMap);
    			// 装入第一条
    			ownerItemMap = new HashMap<String,Object>();
    			ownerItemList = new ArrayList<Map<String,Object>>();
    			ownerItemMap.put("fromArea", item.get("from_name"));
       			ownerItemMap.put("toArea", item.get("to_name"));
       			ownerItemMap.put("fromToYoufei", item.get("group_youfei"));
    			ownerItemMap.put("ownerItemList", ownerItemList);

    			ownerItemList.add(item);
    			
    			ownerList.add(ownerItemMap);
    			
    			// 保存
    			workOwner=(String)item.get("owner");
    			workFromArea=item.get("from_area").toString();
    		}
    	}
    	
    	
		return resultmap;
    }
    /**
     * 计算商品总价，邮费总价，和所有总价
     * @param itemlist
     * @return
     */
    private Map<String, String> sumPrice(List<Map<String, Object>> itemList) {
    	
    	
    	String workOwner="";
    	String workFromArea="";
    	BigDecimal itemTotalPrice=new BigDecimal(0);
    	BigDecimal yunfeiTotalPrice=new BigDecimal(0);
    	BigDecimal totalPrice=new BigDecimal(0);
    	
    	for(Map<String,Object> item : itemList){
    		BigDecimal salePrice = (BigDecimal)item.get("sale_price");
    		Integer shuliang = (Integer)item.get("shuliang");
    		itemTotalPrice = itemTotalPrice.add(salePrice.multiply(new BigDecimal(shuliang)));
    		
    		if(workOwner.equals(item.get("owner"))){
    			
    			if(workFromArea.equals(item.get("from_area").toString())){
    				
    			}else{
    				// 如果Fromarea改变
    				yunfeiTotalPrice = yunfeiTotalPrice.add((BigDecimal)item.get("group_youfei"));
        			// 保存
        			workFromArea=item.get("from_area").toString();
    			}
    		}else{
    			// 如果Owner改变
    			yunfeiTotalPrice = yunfeiTotalPrice.add((BigDecimal)item.get("group_youfei"));
    			// 保存
    			workOwner=(String)item.get("owner");
    			workFromArea=item.get("from_area").toString();
    		}
    	}
    	
    	
    	totalPrice = itemTotalPrice.add(yunfeiTotalPrice);
    	

    	
    	Map<String,String> sumPriceMap =new HashMap<String,String>();
    	sumPriceMap.put("itemTotalPrice", itemTotalPrice.toString());
    	sumPriceMap.put("yunfeiTotalPrice", yunfeiTotalPrice.toString());
    	sumPriceMap.put("totalPrice", totalPrice.toString());
		return sumPriceMap;
	}



    /**
     * 由于收货人地址发生改变：刷新商品价格
     * @return
     * @throws BusinessException 
     */
	@Override
	public Map<String, Object> reItemPrice(String addId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String toArea = "";
		TUser user=sessionService.getLoginUser();
		if(StringUtils.isNotEmpty(addId)){
			TUserAddressKey key = new TUserAddressKey();
			key.setOpenId(user.getOpenId());
			key.setAddressId(Integer.valueOf(addId));
			TUserAddress ua =  tUserAddressMapper.selectByPrimaryKey(key);
			toArea=ua.getRegionName1();
		}

        //3返回商品清单
        List<Map<String, Object>> itemlist = tCartMapper.getItemFromCartWhitYoufei(user.getOpenId(),toArea);
        List<Map<String, Object>> itemlistGrouped = groupItem(itemlist);
        Map<String, String> priceTotal = sumPrice(itemlist);
        resultMap.put("itemlistGrouped", itemlistGrouped);
        resultMap.put("priceTotal", priceTotal);
        resultMap.put("itemlist", itemlist);
		
		return resultMap;
	}


    /**
     * 用户订单察看
     * @return
     */
    @Override
    public Map<String, Object> getUserOrder() {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        TUser user=sessionService.getLoginUser();
        List<Map<String, Object>> orderList = 
                tOrderMapper.getUserOrderList(user.getOpenId());
        for(Map<String, Object> order:orderList){
            List<Map<String, Object>> detailList = 
                    tOrderDetailMapper.getOrderDetailList((String)order.get("order_id"));
            order.put("detailList", detailList);
        }
        resultMap.put("orderList", orderList);
        return resultMap;
    }



    /**
     * 用户订单察看  然后支付
     * @return
     */
    @Override
    @Transactional(rollbackFor=Exception.class) 
    public Map<String, Object> doPayFromUserOrder(String orderId) {
        
        TOrder tOrder = tOrderMapper.selectByPrimaryKey(orderId);
        
        String nonce_str = Sign.create_nonce_str();
        nonce_str = nonce_str.substring(0, 32);
        // 生成支付签名
        String packageid = "prepay_id="+tOrder.getOrderZhifuId();
        SortedMap<String, String> parm = new TreeMap<String, String>();
        parm.put("appId", WeixinConst.APPID);
        parm.put("timeStamp", Sign.create_timestamp());
        parm.put("nonceStr", nonce_str);
        parm.put("package", packageid);
        parm.put("signType", "MD5");
        // 支付信息生产
        String sign2 = Sign.createPaySign(parm);
        parm.put("sign", sign2);
        
        Map<String, Object> resultMap =  new HashMap<String, Object>();
        
        resultMap.put("appId", parm.get("appId"));
        resultMap.put("timeStamp", parm.get("timeStamp"));
        resultMap.put("nonceStr", parm.get("nonceStr"));
        resultMap.put("prepay_id", parm.get("package"));
        resultMap.put("signType", parm.get("signType"));
        resultMap.put("sign", parm.get("sign"));
        
        resultMap.put("orderId", tOrder.getOrderId());
        resultMap.put("payId", tOrder.getOrderZhifuId());
        // JSAPI 签名信息
        //resultMap.put("signInfo", sessionService.getSignInfo("/mobile/order/orderSubmit"));
        
        return resultMap;
    }
}
