package com.abs.mobile.domain;

public class TOrderDetailKey {
    private String orderId;

    private Integer itemId;

    private Integer itemGuige;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getItemGuige() {
        return itemGuige;
    }

    public void setItemGuige(Integer itemGuige) {
        this.itemGuige = itemGuige;
    }
}