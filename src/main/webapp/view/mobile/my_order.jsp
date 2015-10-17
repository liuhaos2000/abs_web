<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>我的订单</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body id="aa">

    <header class="navbar top" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 top_logo">
                    <p class="navbar-text">我的订单</p>
                </div>
            </div>
        </div>
    </header>

	<div id="main_div">
	    <c:forEach items="${result.orderList}" var="item" varStatus="status">
          <div class="container order-group">
            <div class="row order-num">
                <div class="col-md-9 col-sm-9 col-xs-9">
                    <p class="order-num-position ">订单号：${item.order_id}</p>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <p class="order-num-position ">${item.status_text}</p>
                </div>
            </div>
            <div class="row order-title ">
                <c:forEach items="${item.detailList}" var="detailitem" varStatus="status">
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <img class="order-num-position order-img1"
                             src="${detailitem.path}">
                    </div>
                </c:forEach>
            </div>
            <div class="row order-total">
                <div class="col-md-8 col-sm-8 col-xs-8">
                    <p class="order-num-position ">实支付：${item.shiji_price}</p>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <c:choose>
   					  <c:when test="${item.status=='1'}">
   					  	  <button type="button" 
                            class="btn btn-danger btn-xs order-num-position order-num-bt to-pay-bt"
                            orderId="${item.order_id}">去付款</button>
   					  </c:when>
   					  <c:otherwise> 
   					  </c:otherwise>
   					</c:choose>

                     
                </div>
            </div>
          </div>
        </c:forEach>
    </div>


    <footer class="tool_foot">
        <div class="container footer itme_detail_top">
            <div class="row footer-row">
                <div class="col-md-12 col-sm-12 col-xs-12 footer-col">
                    <button id="goback" class="btn btn-default a-btn" type="button">返回</button>
                </div>
            </div>
        </div>
    </footer>
	
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript">
var UrlConfig = {
	userOrderToPay:'<%=request.getContextPath() %>/app/mobile/order/userOrderToPay',
    updOrderToPayed:'<%=request.getContextPath() %>/app/mobile/order/updOrderToPayed'
};
$(document).ready(function() {
    //选择框
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-red',
        radioClass: 'iradio_square-red',
        increaseArea: '20%' // optional
    }); 
    //设置高度          
    $(function(){
        $("#main_div").height($(window).height()-$("header").height()-52);
        $("#main_div").css({"overflow":"auto"});
        
        bindEvent();
    });
    // 返回
    $("#goback").click(function(){
        window.location.href='<%=request.getContextPath() %>'+
        '/app/mobile/page/index?'+
        'loadId=huiyuan';
    });
    
    
    
});
// to-pay-bt
function bindEvent(){
    $('.to-pay-bt').bind("click",function(){
        var orderId=$(this).attr("orderId");
        doPay(orderId);
    });
    
}
function doPay(orderId){
	//
	$('.to-pay-bt').attr('disabled',"true");
    $.ajax({    
        url:UrlConfig.userOrderToPay,
        data:{
               orderId:orderId,
            },
        type:'post',    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
                //alert(result.data.appId);
                //发起支付
                WeixinJSBridge.invoke('getBrandWCPayRequest',{
                                                    "appId" : result.data.appId,
                                                    "timeStamp" : result.data.timeStamp, 
                                                    "nonceStr" : result.data.nonceStr, 
                                                    "signType" : "MD5",
                                                    "package" : result.data.prepay_id,
                                                    "paySign" : result.data.sign 
                                    },function(res){
                                        WeixinJSBridge.log(res.err_msg);
                                        if(res.err_msg == "get_brand_wcpay_request:ok"){  
                                            //alert("微信支付成功!");  
                                            updOrderToPayed(orderId);
                                            myalert("支付成功！",'main_div');
                                        }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
                                            //alert("用户取消支付!");  
                                        }else{  
                                            alert("支付失败!");  
                                        }
                                        // 刷新
                                        window.location.href='<%=request.getContextPath() %>/app/mobile/page/myorder'; 
                                    });
            }else{
                myalert(result.msg,'main_div');
                $('.to-pay-bt').removeAttr('disabled');
            }
         }
    });
}
function updOrderToPayed(orderId){
    $.ajax({
        url:UrlConfig.updOrderToPayed, 
        data:{orderId:orderId},
        type:'post',
        //cache:false,
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
                // 跳转
                //window.location.href='<%=request.getContextPath() %>'+
                //                   '/app/mobile/page/huiyuan'; 
            }else{
                myalert(result.msg,'main_div');
            }
         }
    });
}
        </script>
</body>
</html>