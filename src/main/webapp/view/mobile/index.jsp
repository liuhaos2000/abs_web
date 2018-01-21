<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>悦东优选</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/showloading/showLoading.css">
</head>
<body>
    <div class="popupshadow">
    </div>
		

	<!-- 探出窗口 -->
	<div id="main_div" class="main_div">
		<div class="container">
			<div class="row index-row-head">
				<div class="col-md-2 col-sm-2 col-xs-2 no-padding">
				    <a href="/abs_web/app/mobile/page/index?parent=${SHOP_USER.openId}">
						<img  src="${SHOP_USER.weixinImageUrl}">
					</a>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4 no-padding">
					<div class="input-group">
						<p class="myh4-2"><Strong>${SHOP_USER.nickname}</Strong>的小店&nbsp;&nbsp;&nbsp;
						</p>
					</div>
					<div></div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 no-padding"  style="padding:2px 6px;text-align: right;">
							<c:if test="${(LOGIN_USER.lever eq '00' ||LOGIN_USER.lever eq '01'||LOGIN_USER.lever eq '02') && LOGIN_USER.openId ne SHOP_USER.openId}">
								<a style="" class="btn btn-my btn-xs" href="/abs_web/app/mobile/page/index?parent=${LOGIN_USER.openId}&change=1" role="button">我的店</a>
							</c:if>
							<div style="" class="btn btn-my btn-xs" role="button">帮好友分享☝</div>
				</div>
			</div>
		</div>
	
	
	  <div class="container">
		<div class="icon-center">
			<img class="icon-spin"
				src="<%=request.getContextPath()%>/resources/images/loading.png">
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column no-padding">
				<div class="carousel slide pic_show2" id="carousel-7342">
					<ol class="carousel-indicators">
					    <c:forEach items="${lblist}" var="tlunbo" varStatus="status">
					    	<li data-slide-to="${status.index}" data-target="#carousel-7342"></li>
					    </c:forEach>
					</ol>
					<div class="carousel-inner">
					    <c:forEach items="${lblist}" var="tlunbo" varStatus="status">
					    	<c:choose>
					    		<c:when test="${status.index eq 0}"> 
					    			<div class="item active">
					    				<a href="<%=request.getContextPath()%>${tlunbo.action}">
											<img src="${tlunbo.imgPath}" />
										</a>
									</div>
					    		</c:when>
					    		<c:otherwise> 
					    			<div class="item">
					    				<a href="<%=request.getContextPath()%>${tlunbo.action}">
											<img src="${tlunbo.imgPath}" />
										</a>
									</div>
					    		</c:otherwise>
					    	</c:choose>

					    </c:forEach>
					</div>
					<a class="left carousel-control" href="#carousel-7342"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> 
						<a
						class="right carousel-control" href="#carousel-7342"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>

		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<!--一元购S
					<div class="col-md-12 column">
						<div class="row clearfix home_groupheade">
							<div class="col-md-12 column home_grouphead_col">
								<h4 class="myh4">一元购</h4>
							</div>
						</div>
						
						<c:forEach items="${data['HDFLG_8']}" var="item" varStatus="status">
                    		<c:if test="${status.index % 2 eq 0}">
                    			<div class="row clearfix home_item_div">
                    				<c:forEach items="${data['HDFLG_8']}" var="item_2" varStatus="status_2"
                    							begin="${status.index}" end="${status.index + 1}">
                         				<div class="col-md-6 col-sm-6 col-xs-6 home_item_body"  
                         				     itemid="${item_2.item_id}"
                         				     phaseNum="${item_2.phase_num}">
                           					<a href="#">
                                				<img src="${item_2.path}">
												<p class="home_item_name">${item_2.item_name}</p>
												<p class="home_item_wcdo">第${item_2.phase_num}期 完成度 ${item_2.jindu}%</p>
												<div class="progress home_progress">
  													<div class="progress-bar progress-bar-warning progress-bar-striped active" 
  													     role="progressbar" aria-valuenow="${item_2.jindu}" 
  													     aria-valuemin="0" aria-valuemax="100" style="width: ${item_2.jindu}%;">
  													</div>
												</div>
                            				</a>
                         				</div>
                    				</c:forEach>
                    			</div>
							</c:if>
						</c:forEach>
				</div>
					一元购E-->
					<!--热卖S-->
					<div class="col-md-12 column">
						<div class="row clearfix home_groupheade">
							<div class="col-md-12 column home_grouphead_col">
								<h4 class="myh4">我的商品</h4>
							</div>
						</div>
						
                		<c:forEach items="${data['HDFLG_5']}" var="item" varStatus="status">
                    		<c:if test="${status.index % 2 eq 0}">
                    			<div class="row clearfix home_item_div">
                    				<c:forEach items="${data['HDFLG_5']}" var="item_2" varStatus="status_2"
                    							begin="${status.index}" end="${status.index + 1}">
                         			 <div class="col-md-6 col-sm-6 col-xs-6 home_item_body" itemid="${item_2.item_id}">
                           				 <a href="#">
                                		 <img src="${item_2.path}">
                               			  <p class="home_item_name">${item_2.item_name}</p>
                               			  <p class="home_item_price">售价: ￥${item_2.price_huiyuan}</p>
                            			</a>
                         			 </div>
                         			</c:forEach>	
								</div>
							</c:if>
                    	</c:forEach>	
						
					</div>
					<!--热卖E-->
				</div>
			</div>
		</div>

	  </div>
	</div>

	<footer>
		<div class="container footer">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 ">
					<a href="#" class="active" id="home-bt">
                        <p class="footer_index">首页</p>
					</a>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4 ">
					<a href="#" id="cart-bt">
                        <p class="footer_pinpai">购物车</p>
					</a>
					<span class="cartcount">90</span>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4 ">
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
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.lazyload.js"></script>
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
                	 window.location.href='<%=request.getContextPath() %>'+
        	         '/app/mobile/page/myorder'; 
                 }); 
                 $("#cart-bt").click(function(){
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
			    	$("#main_div").height($(window).height()-$("header").height()-43);
			    	$("#main_div").css({"overflow":"auto"});
			    	
			  	  $('.carousel').carousel({
					  interval: 2000
					});
				
				    $("div[itemId]").bind("click",function(){
				        window.location.href='<%=request.getContextPath() %>'+
				        '/app/mobile/page/item?itemId='+$(this).attr("itemId")+
				        '&phaseNum='+$(this).attr("phaseNum")+
				        '&parent=${SHOP_USER.openId}'; 
				    });
					
					$('img').lazyload({ 
						  effect:'fadeIn' 
					});
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
                    title: "悦东优选", // 分享标题
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
              	    title: "悦东优选", // 分享标题
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