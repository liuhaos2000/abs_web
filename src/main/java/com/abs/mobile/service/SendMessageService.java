package com.abs.mobile.service;

import java.util.List;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.util.exception.BusinessException;

public interface SendMessageService {
	/**
	 * 支付成功后发送MSG to 供货商，SHOP USER，总部
	 * 
	 * @return
	 * @throws BusinessException 
	 */
	public void sendPaySuccessMsg(TOrder record,List<TOrderDetail> orderDetailList);
	/**
	 * 订单发货后MSG to 供货商，SHOP USER，总部
	 * 
	 * @return
	 */
	public void sendFahuoMsg();
	/**
	 * 订单完了后MSG  to USER，SHOP USER，总部
	 * 
	 * @return
	 */
	public void sendOrderClossMsg();
    
}
