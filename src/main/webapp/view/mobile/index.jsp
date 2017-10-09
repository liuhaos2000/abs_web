<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>西域果品优选</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/showloading/showLoading.css">
</head>
<body>
	<header>
		<div class="container">
			<div class="row index-row-head">
				<div class="col-md-2 col-sm-2 col-xs-2 no-padding">
						<img class="img-responsive" src="<%=request.getContextPath() %>/resources/images/tang_logo.jpg">
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 no-padding-left">
					<div class="input-group index-col-head">
						<input type="text" id="searchparm" name="searchparm" class="form-control">
						<span class="input-group-btn">
							<button id="search-bt" class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 探出窗口 -->
        <div class="popupshadow">
        </div>
	</header>

	<div id="main_div">


	</div>

	<footer>
		<div class="container footer">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 footer-block">
					<a href="#" class="active" id="home-bt">
                        <p class="footer_index">首页</p>
					</a>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4 footer-block">
					<a href="#" id="cart-bt">
                        <p class="footer_pinpai">购物车</p>
					</a>
					<span class="cartcount">90</span>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4 footer-block">
					<a href="#" id="huiyuan-bt">
                        <p class="footer_huiyuan">会员</p>
					</a>
				</div>
			</div>
		</div>
	</footer>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/showloading/jquery.showLoading.js"></script>		
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getCartCount: '<%=request.getContextPath() %>/app/mobile/cart/getCount',
};
    
            $(document).ready(function() {
            	
                 $("#home-bt").click(function(){
                	 showLoding();
                	 $('#main_div').load('<%=request.getContextPath() %>' +
                			'/app/mobile/page/home', {},loadback());
                	 $('.footer-block a').removeClass("active");
                	 $(this).addClass("active");
                 }); 
                 $("#type-bt").click(function(){
                	 showLoding();
                     $('#main_div').load('<%=request.getContextPath() %>' +
                             '/app/mobile/page/type',{},loadback()); 
                     $('.footer-block a').removeClass("active");
                     $(this).addClass("active");
                 }); 
                 $("#huiyuan-bt").click(function(){
                	 showLoding();
                	 window.location.href='<%=request.getContextPath() %>'+
        	         '/app/mobile/page/myorder'; 
                 }); 
                 $("#cart-bt").click(function(){
                	 showLoding();
                	 window.location.href='<%=request.getContextPath() %>'+
                	         '/app/mobile/page/cart'; 
                 });

                 $("#search-bt").click(function(){
                	 if($("#searchparm").val()==''){
                		 //$('#searchparm').popover('show');
                		 return;
                	 }
                     window.location.href='<%=request.getContextPath() %>'+
                             '/app/mobile/page/itemlist?searchparm='+$("#searchparm").val(); 
                 }); 
                 
			    $(function(){
			    	$("#main_div").height($(window).height()-$("header").height()-52);
			    	$("#main_div").css({"overflow":"auto"});
		    		
			    	showLoding();
			    	if('${loadId}'=='huiyuan'){
			    		$('#main_div').load('<%=request.getContextPath() %>' + 
			    				'/app/mobile/page/huiyuan'+
			    				'?orderId="${orderId}"',{},loadback());
			    		 //样式修改
	                	 $('.footer-block a').removeClass("active");
	                	 $('#huiyuan-bt').addClass("active");
			    	}else{
			    		//alert(1);
			    		$('#main_div').load('<%=request.getContextPath() %>' + '/app/mobile/page/home',loadback());
			    	}
			    	
			    });
            });
            
            getCartCount();

            function getCartCount() {
            	   $.ajax({    
            	        url:UrlConfig.getCartCount,// 跳转到 action    
            	        data:{},    
            	        type:'post',    
            	        //cache:false,    
            	        dataType:'json',    
            	        success:function(result) {
            	            if(result.successful == true ){
            	            	if (result.data > 0) {
            	            		$('.cartcount').css("display","block");
            	            		$('.cartcount').html(result.data);
            	            	} else {
            	            		$('.cartcount').css("display","none");
            	            	}
            	                
            	            }else{
            	                
            	            }
            	         }

            	    }); 
            }
            
            function showLoding(){
            	$(".popupshadow").show();
            	$(".popupshadow").showLoading();
            }
            function loadback(){
            	//$(".popupshadow").hideLoading();
            	//$(".popupshadow").hide();
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
                    title: "西域果品优选", // 分享标题
                    desc: '来自新疆的特色水果，新鲜快捷送到家。赶快收藏吧。', // 分享描述
                    link: '${result.signInfo.url}', // 分享链接
                    imgUrl: 'http://ruihegouwu.cn/abs_web/resources/images/tang_logo.jpg', // 分享图标
                    success: function () { 
                    	 //alert('success');
                    },
                    cancel: function () { 
                       //alert('<%=request.getContextPath() %>'+'/resources/images/tang_logo.jpg');
                    }
                  });
                
                wx.onMenuShareTimeline({
              	    title: "西域果品优选", // 分享标题
              	    link: '${result.signInfo.url}', // 分享链接
              	    imgUrl: 'http://ruihegouwu.cn/abs_web/resources/images/tang_logo.jpg', // 分享图标
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