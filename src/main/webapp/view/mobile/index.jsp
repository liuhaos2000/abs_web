<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>悦购</title>
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
						<a href="<%=request.getContextPath() %>">
						<img class="img-responsive" src="<%=request.getContextPath() %>/resources/images/novo_logo.png"></a>
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
                     $('#main_div').load('<%=request.getContextPath() %>' +
                             '/app/mobile/page/huiyuan',{},loadback()); 
                     $('.footer-block a').removeClass("active");
                     $(this).addClass("active");
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
        </script>
</body>
</html>