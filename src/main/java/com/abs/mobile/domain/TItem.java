package com.abs.mobile.domain;

import java.util.Date;

public class TItem {
    private Integer itemId;

    private String name;

    private Integer type;

    private Integer morenGuige;

    private Integer morenYanse;

    private String guigeText;

    private String yanseText;

    private Integer prentItemId;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    private String fuText;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getMorenGuige() {
        return morenGuige;
    }

    public void setMorenGuige(Integer morenGuige) {
        this.morenGuige = morenGuige;
    }

    public Integer getMorenYanse() {
        return morenYanse;
    }

    public void setMorenYanse(Integer morenYanse) {
        this.morenYanse = morenYanse;
    }

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

    public Integer getPrentItemId() {
        return prentItemId;
    }

    public void setPrentItemId(Integer prentItemId) {
        this.prentItemId = prentItemId;
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

    public String getFuText() {
        return fuText;
    }

    public void setFuText(String fuText) {
        this.fuText = fuText == null ? null : fuText.trim();
    }
}