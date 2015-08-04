<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>购物车</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body>

	<header class="tool_top">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<p class="head-text">
						<strong>购物车</strong>
					</p>
				</div>
			</div>
		</div>
	</header>

	
	<div id="main_div">
	    <div class="container-fluid ">
			<div class="row cart-item-row">
				<div class="col-md-2 col-sm-2 col-xs-2  cart-item-checkbox">
                   <div class="cart-item-checkbox-sub">
						<input type="checkbox">
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 cart-item-col">
					<img class="cart-img" src="<%=request.getContextPath() %>/resources/images/15901_60.png" alt="">
				</div>
				<div class="col-md-7 col-sm-7 col-xs-7 cart-item-col">
					<p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
						<div class="btn-group" role="group" aria-label="...">
                            <button type="button" class="btn btn-default">-</button>
                            <button type="button" class="btn btn-default">10</button>
                            <button type="button" class="btn btn-default">+</button>
                        </div>
						<span class="btn-clipboard">x</span>
				</div>
			</div>

			<div class="row cart-item-row">
				<div class="col-md-2 col-sm-2 col-xs-2 cart-item-col cart-item-checkbox">
                   <div class="cart-item-checkbox-sub"><input type="checkbox"></div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 cart-item-col">
					<img class="cart-img" src="<%=request.getContextPath() %>/resources/images/15901_60.png" alt="">
				</div>
				<div class="col-md-7 col-sm-7 col-xs-7 cart-item-col">
					<p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
						<div class="btn-group" role="group" aria-label="...">
                            <button type="button" class="btn btn-default">-</button>
                            <button type="button" class="btn btn-default">10</button>
                            <button type="button" class="btn btn-default">+</button>
                        </div>
						<span class="btn-clipboard">x</span>
				</div>
			</div>

			<div class="row cart-item-row">
				<div class="col-md-2 col-sm-2 col-xs-2 cart-item-col cart-item-checkbox">
                   <div class="cart-item-checkbox-sub"><input type="checkbox"></div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 cart-item-col">
					<img class="cart-img" src="<%=request.getContextPath() %>/resources/images/15901_60.png" alt="">
				</div>
				<div class="col-md-7 col-sm-7 col-xs-7 cart-item-col">
					<p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
						<div class="btn-group" role="group" aria-label="...">
                            <button type="button" class="btn btn-default">-</button>
                            <button type="button" class="btn btn-default">10</button>
                            <button type="button" class="btn btn-default">+</button>
                        </div>
						<span class="btn-clipboard">x</span>
				</div>
			</div>
		</div>
					
				
					
	</div>

	<footer class="tool_foot">
		<div class="container">
			<div class="row footer-row">
				<div class="col-md-6 col-sm-6 col-xs-6 footer-col">
					<p class="foot-text">总价：210元</p>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 footer-col">
					<button id="jiesuan" class="btn btn-success a-btn" type="button">结算</button>
				</div>
			</div>
		</div>
	</footer>
	
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script type="text/javascript">
            $(document).ready(function() {
				//
				$('input').iCheck({
					checkboxClass: 'icheckbox_square-red',
					radioClass: 'iradio_square-red',
					increaseArea: '20%' // optional
				});			
				//		
			    $(function(){
			    	$("#main_div").height($(window).height()-$("header").height()-$("footer").height()-2);
			    	$("#main_div").css({"overflow":"auto"});
					
			    });
				//
				$("#jiesuan").click(function(){
					location.href ="order_submit.html";
				});						
            });
        </script>
</body>
</html>