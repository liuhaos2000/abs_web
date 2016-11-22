package com.abs.mobile.domain;

import java.util.Date;

public class TGroupbuyDetail extends TGroupbuyDetailKey {
    private String orderId;

    private Integer itemGuige;

    private Integer itemYanse;

    private String openId;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Integer getItemGuige() {
        return itemGuige;
    }

    public void setItemGuige(Integer itemGuige) {
        this.itemGuige = itemGuige;
    }

    public Integer getItemYanse() {
        return itemYanse;
    }

    public void setItemYanse(Integer itemYanse) {
        this.itemYanse = itemYanse;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    public String getDelFlg() {
        return delFlg;
    }

    public void setDelFlg(String delFlg) {
        this.delFlg = delFlg == null ? null : delFlg.trim();
    }

    public Date getcDate() {
        return cDate;
    }

    public void setcDate(Date cDate) {
        this.cDate = cDate;
    }

    public String getcUser() {
        return cUser;
    }

    public void setcUser(String cUser) {
        this.cUser = cUser == null ? null : cUser.trim();
    }

    public Date getuDate() {
        return uDate;
    }

    public void setuDate(Date uDate) {
        this.uDate = uDate;
    }

    public String getuUser() {
        return uUser;
    }

    public void setuUser(String uUser) {
        this.uUser = uUser == null ? null : uUser.trim();
    }
}