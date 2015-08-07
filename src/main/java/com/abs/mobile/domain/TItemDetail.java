package com.abs.mobile.domain;

import java.math.BigDecimal;
import java.util.Date;

public class TItemDetail extends TItemDetailKey {
    private String guigeText;

    private String yanseText;

    private Integer shuliang;

    private BigDecimal price;

    private BigDecimal priceHuiyuan;

    private BigDecimal priceHuodong;

    private Date huodongDate;

    private String huodongFlg;

    private String hotFlg;

    private Date itemScDate;

    private Date itemYxDate;

    private BigDecimal itemZhongliang1;

    private BigDecimal itemZhongliang2;

    private String itemChandi;

    private String baoyouFlg;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public String getGuigeText() {
        return guigeText;
    }

    public void setGuigeText(String guigeText) {
        this.guigeText = guigeText == null ? null : guigeText.trim();
    }

    public String getYanseText() {
        return yanseText;
    }

    public void setYanseText(String yanseText) {
        this.yanseText = yanseText == null ? null : yanseText.trim();
    }

    public Integer getShuliang() {
        return shuliang;
    }

    public void setShuliang(Integer shuliang) {
        this.shuliang = shuliang;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPriceHuiyuan() {
        return priceHuiyuan;
    }

    public void setPriceHuiyuan(BigDecimal priceHuiyuan) {
        this.priceHuiyuan = priceHuiyuan;
    }

    public BigDecimal getPriceHuodong() {
        return priceHuodong;
    }

    public void setPriceHuodong(BigDecimal priceHuodong) {
        this.priceHuodong = priceHuodong;
    }

    public Date getHuodongDate() {
        return huodongDate;
    }

    public void setHuodongDate(Date huodongDate) {
        this.huodongDate = huodongDate;
    }

    public String getHuodongFlg() {
        return huodongFlg;
    }

    public void setHuodongFlg(String huodongFlg) {
        this.huodongFlg = huodongFlg == null ? null : huodongFlg.trim();
    }

    public String getHotFlg() {
        return hotFlg;
    }

    public void setHotFlg(String hotFlg) {
        this.hotFlg = hotFlg == null ? null : hotFlg.trim();
    }

    public Date getItemScDate() {
        return itemScDate;
    }

    public void setItemScDate(Date itemScDate) {
        this.itemScDate = itemScDate;
    }

    public Date getItemYxDate() {
        return itemYxDate;
    }

    public void setItemYxDate(Date itemYxDate) {
        this.itemYxDate = itemYxDate;
    }

    public BigDecimal getItemZhongliang1() {
        return itemZhongliang1;
    }

    public void setItemZhongliang1(BigDecimal itemZhongliang1) {
        this.itemZhongliang1 = itemZhongliang1;
    }

    public BigDecimal getItemZhongliang2() {
        return itemZhongliang2;
    }

    public void setItemZhongliang2(BigDecimal itemZhongliang2) {
        this.itemZhongliang2 = itemZhongliang2;
    }

    public String getItemChandi() {
        return itemChandi;
    }

    public void setItemChandi(String itemChandi) {
        this.itemChandi = itemChandi == null ? null : itemChandi.trim();
    }

    public String getBaoyouFlg() {
        return baoyouFlg;
    }

    public void setBaoyouFlg(String baoyouFlg) {
        this.baoyouFlg = baoyouFlg == null ? null : baoyouFlg.trim();
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