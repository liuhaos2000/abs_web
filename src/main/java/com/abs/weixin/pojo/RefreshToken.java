package com.abs.weixin.pojo;

/**
 * 刷新用户授权accessToken
 * @author zhangzhi
 * @date 2014-04-05
 */
public class RefreshToken {
	private String accessToken;
	private int expiresIn;
	private String refreshToken;
	private String openid;
	private String scope;
    /**
     * @return the accessToken
     */
    public String getAccessToken() {
        return accessToken;
    }
    /**
     * @param accessToken the accessToken to set
     */
    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }
    /**
     * @return the expiresIn
     */
    public int getExpiresIn() {
        return expiresIn;
    }
    /**
     * @param expiresIn the expiresIn to set
     */
    public void setExpiresIn(int expiresIn) {
        this.expiresIn = expiresIn;
    }
    /**
     * @return the refreshToken
     */
    public String getRefreshToken() {
        return refreshToken;
    }
    /**
     * @param refreshToken the refreshToken to set
     */
    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }
    /**
     * @return the openid
     */
    public String getOpenid() {
        return openid;
    }
    /**
     * @param openid the openid to set
     */
    public void setOpenid(String openid) {
        this.openid = openid;
    }
    /**
     * @return the scope
     */
    public String getScope() {
        return scope;
    }
    /**
     * @param scope the scope to set
     */
    public void setScope(String scope) {
        this.scope = scope;
    }
	
	
}