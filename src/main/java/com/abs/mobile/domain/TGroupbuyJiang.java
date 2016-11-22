package com.abs.mobile.domain;

import java.util.Date;

public class TGroupbuyJiang extends TGroupbuyJiangKey {
    private String tiaojianText;

    private String param1;

    private String param2;

    private String param3;

    private String param4;

    private String param5;

    private String param6;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public String getTiaojianText() {
        return tiaojianText;
    }

    public void setTiaojianText(String tiaojianText) {
        this.tiaojianText = tiaojianText == null ? null : tiaojianText.trim();
    }

    public String getParam1() {
        return param1;
    }

    public void setParam1(String param1) {
        this.param1 = param1 == null ? null : param1.trim();
    }

    public String getParam2() {
        return param2;
    }

    public void setParam2(String param2) {
        this.param2 = param2 == null ? null : param2.trim();
    }

    public String getParam3() {
        return param3;
    }

    public void setParam3(String param3) {
        this.param3 = param3 == null ? null : param3.trim();
    }

    public String getParam4() {
        return param4;
    }

    public void setParam4(String param4) {
        this.param4 = param4 == null ? null : param4.trim();
    }

    public String getParam5() {
        return param5;
    }

    public void setParam5(String param5) {
        this.param5 = param5 == null ? null : param5.trim();
    }

    public String getParam6() {
        return param6;
    }

    public void setParam6(String param6) {
        this.param6 = param6 == null ? null : param6.trim();
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