package com.abs.mobile.domain;

import java.math.BigDecimal;
import java.util.Date;

public class TOrder {
    private String orderId;

    private Date orderDate;

    private String status;

    private String openId;

    private Integer addressId;

    private BigDecimal totlePrice;

    private BigDecimal wuliuYunfei;

    private String zhekouType;

    private Integer yhqCode;

    private BigDecimal jifenDixiao;

    private BigDecimal shijiPrice;

    private Integer wuliuId;

    private String wuliuCode;

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

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public BigDecimal getTotlePrice() {
        return totlePrice;
    }

    public void setTotlePrice(BigDecimal totlePrice) {
        this.totlePrice = totlePrice;
    }

    public BigDecimal getWuliuYunfei() {
        return wuliuYunfei;
    }

    public void setWuliuYunfei(BigDecimal wuliuYunfei) {
        this.wuliuYunfei = wuliuYunfei;
    }

    public String getZhekouType() {
        return zhekouType;
    }

    public void setZhekouType(String zhekouType) {
        this.zhekouType = zhekouType == null ? null : zhekouType.trim();
    }

    public Integer getYhqCode() {
        return yhqCode;
    }

    public void setYhqCode(Integer yhqCode) {
        this.yhqCode = yhqCode;
    }

    public BigDecimal getJifenDixiao() {
        return jifenDixiao;
    }

    public void setJifenDixiao(BigDecimal jifenDixiao) {
        this.jifenDixiao = jifenDixiao;
    }

    public BigDecimal getShijiPrice() {
        return shijiPrice;
    }

    public void setShijiPrice(BigDecimal shijiPrice) {
        this.shijiPrice = shijiPrice;
    }

    public Integer getWuliuId() {
        return wuliuId;
    }

    public void setWuliuId(Integer wuliuId) {
        this.wuliuId = wuliuId;
    }

    public String getWuliuCode() {
        return wuliuCode;
    }

    public void setWuliuCode(String wuliuCode) {
        this.wuliuCode = wuliuCode == null ? null : wuliuCode.trim();
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