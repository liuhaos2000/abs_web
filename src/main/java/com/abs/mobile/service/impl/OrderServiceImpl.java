package com.abs.mobile.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TCartMapper;
import com.abs.mobile.dao.TUserAddressMapper;
import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TCartKey;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.domain.TUserAddress;
import com.abs.mobile.service.OrderService;
import com.abs.mobile.service.SessionService;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private TCartMapper tCartMapper;
    @Resource
    private SessionService sessionService;
    @Resource
    private TUserAddressMapper tUserAddressMapper;
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
        //1.1返回商品清单
        List<Map<String, String>> itemlist = tCartMapper.getItemFromCart(user.getOpenId());
        if(itemlist.size()>0){
        	for(int i=0;i<itemlist.size();i++){
        		// list中删除未选中的商品
        		if(!("1".equals(itemlist.get(i).get("del_flg")))){  
        			itemlist.remove(i);  
        			i=i-1;
                }  
        	}
        }
        resultMap.put("itemlist", itemlist);
        //2取得用户地址
        List<TUserAddress> uadList = tUserAddressMapper.getUserAddress(user.getOpenId());
        resultMap.put("uadList", uadList);
        //tUserAddressMapper
        //3邮件模板
        //4积分 TODO
        
        return resultMap;
    }



}
