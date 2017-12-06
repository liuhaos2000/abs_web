package com.abs.mobile.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.service.SendMessageService;
import com.abs.mobile.service.SessionService;

@Service
public class SendMessageServiceImpl implements SendMessageService {

	@Resource
	private SessionService sessionService;
	
	@Override
	public void sendPaySuccessMsg(TOrder record, List<TOrderDetail> orderDetailList) {
		
	}
	@Override
	public void sendFahuoMsg() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void sendOrderClossMsg() {
		// TODO Auto-generated method stub
		
	}



}
