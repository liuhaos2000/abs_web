package com.abs.weixin.message.req;

import com.abs.weixin.message.base.BaseReqMessage;

/**
 * ������Ϣ
 * 
 * @author zhangzhi
 * @date 2013-04-05
 */
public class LinkMessage extends BaseReqMessage {
	// ��Ϣ����
	private String Title;
	// ��Ϣ����
	private String Description;
	// ��Ϣ����
	private String Url;

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}
}
