<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>邀请函</title>
	<meta name="x5-orientation" content="portrait">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body>

	<div id="main_div">
		<img style="width: 100%; height: 100%;" src="<%=request.getContextPath() %>/resources/images/yaoqing.jpg" width="100%">
    	<div style="
    		position:absolute;
    		left:50%;
    		top:10%;
    		width:260px;
    		margin-left: -130px;
    		z-index:10;
    		border-radius:5px;
    		font-size:12px;
    		text-align:center;
    		height:80px;
    		
    		"><p id="parent_name">${SHOP_USER.nickname}</p><p>邀请你成为悦东优选会员</p>
		</div>
		
    	<div id="bt_shenqing"
    	    style="
    		background-color:#5F97D7;
    		position:absolute;
    		top:18%;
    		left:50%;
    		width:120px;
    		margin-left: -60px;
    		z-index:10;
    		border-radius:15px;
    		font-size:12px;
    		text-align:center;
    		line-height:30px; 
    		height:30px;
    	">申请会员
    	</div>
</div>



	
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
var UrlConfig = {
	shenqingVip:'<%=request.getContextPath() %>/app/mobile/shengqing/shengqingvip'
}
$(document).ready(function() {
	$("#main_div").height($(window).height());
	
    $("#bt_shenqing").bind("click",function(){
        doShengqingVip();
    });
});

function doShengqingVip(){
    $.ajax({    
        url:UrlConfig.shenqingVip,  
        data:{parent:"${SHOP_USER.openId}"},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	myalert("申请成功,请等待审批！","main_div");
            }else{
            	myalert(result.msg,"main_div");
            }
         }
    });
}

//微信分享JDK--------------------<
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '${result.signInfo.appId}', // 必填，公众号的唯一标识
    timestamp:'${result.signInfo.timestamp}', // 必填，生成签名的时间戳
    nonceStr: '${result.signInfo.nonceStr}', // 必填，生成签名的随机串
    signature: '${result.signInfo.signature}',// 必填，签名，见附录1
    jsApiList: ['onMenuShareAppMessage','onMenuShareTimeline'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.ready(function(){
    wx.onMenuShareAppMessage({
        title: "${SHOP_USER.nickname}邀请您成为悦东优选会员", // 分享标题
        desc: '优选特色水果，成为会员，吃水果更便宜。', // 分享描述
        link: '${result.signInfo.url}', // 分享链接
        //imgUrl: 'http://ruihegouwu.cn/abs_web/resources/images/tang_logo.jpg', // 分享图标
        imgUrl:'${SHOP_USER.weixinImageUrl}',
        success: function () { 
        },
        cancel: function () { 
        }
      });
    
    wx.onMenuShareTimeline({
  	    title: "${SHOP_USER.nickname}邀请您成为悦东优选会员", // 分享标题
  	    link: '${result.signInfo.url}', // 分享链接
  	    //imgUrl: 'http://ruihegouwu.cn/abs_web/resources/images/tang_logo.jpg', // 分享图标
  	    imgUrl:'${SHOP_USER.weixinImageUrl}',
  	    success: function () { 
  	        // 用户确认分享后执行的回调函数
  	    },
  	    cancel: function () { 
  	        // 用户取消分享后执行的回调函数
  	    	//alert('${request.getContextPath()}'+'/resources/images/tang_logo.jpg');
  	    }
  	});
});
wx.error(function(){
});

//微信分享JDK-------------------->
</script>
</body>
</html>