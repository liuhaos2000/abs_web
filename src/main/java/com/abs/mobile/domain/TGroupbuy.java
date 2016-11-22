package com.abs.mobile.domain;

import java.util.Date;

public class TGroupbuy extends TGroupbuyKey {
    private Integer groupZongshu;

    private String status;

    private String openId;

    private Integer zhongjiangQue;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public Integer getGroupZongshu() {
        return groupZongshu;
    }

    public void setGroupZongshu(Integer groupZongshu) {
        this.groupZongshu = groupZongshu;
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

    public Integer getZhongjiangQue() {
        return zhongjiangQue;
    }

    public void setZhongjiangQue(Integer zhongjiangQue) {
        this.zhongjiangQue = zhongjiangQue;
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