package com.abs.mobile.service.impl;

import java.util.Date;
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
        
        TUser user=sessionService.getLoginUser();
        Date date = new Date();
        //更新Cart到数据库
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
        }
        //取得用户地址
        //tUserAddressMapper
        //取得购物信息？已经有了？
        //邮件模板
        //积分 TODO
        
        return null;
    }



}
