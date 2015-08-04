<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>瑞和商城</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/media.css">
</head>
<body>

	<header class="navbar top" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-3 top_logo">
					<p class="navbar-text">
						<a href="#">
							<img class="img-responsive" src="<%=request.getContextPath() %>/resources/images/logo.png" alt="瑞和商城"></a>
					</p>
				</div>
				<div class="col-md-10 col-sm-10 col-xs-9 top_search">
					<p class="navbar-text input-group">
						<input type="text" class="form-control">
						<span class="input-group-addon">
							<img src="<%=request.getContextPath() %>/resources/images/search.png"></span>
					</p>
				</div>

			</div>
		</div>
		<!-- 探出窗口 -->
        <div class="popupshadow"></div>
        <div class="popup">
            <img src="<%=request.getContextPath() %>/resources/images/popup_icon.png">
            <ul>
                <li>
                    <a href="item_list.html">主力店铺</a>
                </li>
                <li>
                    <a href="item_list.html">女装</a>
                </li>
                <li>
                    <a href="item_list.html">男装</a>
                </li>
                <li>
                    <a href="item_list.html">鞋/包</a>
                </li>
                <li>
                    <a href="item_list.html">餐饮</a>
                </li>
                <li>
                    <a href="item_list.html">钟表/珠宝/饰品</a>
                </li>
            </ul>
        </div>
	</header>

	<div id="main_div">


	</div>

	<footer>
		<div class="container footer">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" class="active" id="home-bt">
						<p class="footer_index">首页</p>
					</a>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" id="type-bt">
						<p class="footer_huodong">分类</p>
					</a>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" id="cart-bt">
						<p class="footer_pinpai">购物车</p>
					</a>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" id="huiyuan-bt">
						<p class="footer_huiyuan">会员</p>
					</a>
				</div>
			</div>
		</div>
	</footer>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>	
<script type="text/javascript">
            $(document).ready(function() {
                 
                 $("#home-bt").click(function(){
                	 $('#main_div').load('<%=request.getContextPath() %>' +
                			 '/app/mobile/page/home'); 
                 }); 
                 $("#type-bt").click(function(){
                     $('#main_div').load('<%=request.getContextPath() %>' +
                             '/app/mobile/page/type'); 
                 }); 
                 $("#huiyuan-bt").click(function(){
                     $('#main_div').load('<%=request.getContextPath() %>' +
                             '/app/mobile/page/huiyuan'); 
                 }); 
                 $("#cart-bt").click(function(){
                	 window.location.href='<%=request.getContextPath() %>'+
                	         '/app/mobile/page/cart'; 
                 }); 
			    $(function(){
			    	$("#main_div").height($(window).height()-$("header").height()-52);
			    	$("#main_div").css({"overflow":"auto"});

			    	$('#main_div').load('<%=request.getContextPath() %>' + '/app/mobile/page/home');
			    });
							
            });
        </script>
</body>
</html>