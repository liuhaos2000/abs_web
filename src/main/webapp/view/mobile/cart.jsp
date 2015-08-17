<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
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

	<div id="main_div">
	    <div class="container ">
            <c:forEach items="${result.itemList}" var="item">
                <div class="row cart-item-row">
                    <div class="col-md-2 col-sm-2 col-xs-2 cart-col-box cart-col-checkbox">
                       <div class="cart-col-checkbox2">
                            <input type="checkbox" 
                                   itemid="${item.item_id}" 
                                   guige="${item.item_guige}" 
                                   yanse="${item.item_yanse}"
                                   price="${item.sale_price}"
                                   shuliang="${item.shuliang}">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4 cart-col-box">
                        <img class="cart-img" src="${item.path}" alt="">
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6 cart-col-box cart-col-info">
                        <p class="cart_item_name p-no-bottom">${item.item_name}${item.guige_text}${item.yanse_text}</p>
                        <p class="cart_item_price p-no-bottom">￥${item.sale_price}</p>
                            <div class="btn-group" role="group" >
                                <button type="button" name="jian_bt" class="btn btn-default btn-xs">-</button>
                                <button type="button" class="btn btn-default btn-xs">${item.shuliang}</button>
                                <button type="button" name="add_bt" class="btn btn-default btn-xs">+</button>
                            </div>
                            <span class="btn-clipboard" 
                                   itemid="${item.item_id}" 
                                   guige="${item.item_guige}" 
                                   yanse="${item.item_yanse}">x</span>
                    </div>
                </div>
            </c:forEach>

		</div>
	</div>

	<footer class="tool_foot">
		<div class="container footer itme_detail_top">
			<div class="row footer-row">
				<div class="col-md-6 col-sm-6 col-xs-6 footer-col">
					<p class="foot-text">总价：<span id="total">210</span>元</p>
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
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        delItemToCart:'<%=request.getContextPath() %>/app/mobile/cart/delItemFromCart',
    };
$(document).ready(function() {
    //
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-red',
        radioClass: 'iradio_square-red',
        increaseArea: '20%' // optional
    });         
    //      
    $(function(){
        $("#main_div").height($(window).height()-52);
        $("#main_div").css({"overflow":"auto"});
        // 自动全选
        autoCheck();
    });
    //
    $("#jiesuan").click(function(){
        location.href ="order_submit.html";
    });
    // check change
    $(':checkbox').on('ifChanged', function(event){
    	countTotal();
    });
    
    // 数量加
    //        var s = $("#shuliang").text();
    //  s = s*1+1;
    //  $("#shuliang").html(s);
    $('button[name="add_bt"]').click(function(){
    	var s = $(this).next().text();
    	alert(s);
    	s = s*1+1;
    	$(this).next().html(s);
    }); 
    // 数量减
    $("#jian_bt").click(function(){
        var s = $("#shuliang").text();
        s = s*1-1;
        if(s<=0){
            $("#shuliang").html(1);
            return;
        }
        $("#shuliang").html(s);
    }); 
});

function autoCheck() {
	$(":checkbox").each(function(){
		   $(this).iCheck('check');
	});  
}
function countTotal() {
	var total=0;
    $(":checkbox").each(function(){
        if($(this).prop("checked")==true){
        	total = total+$(this).attr("price") * $(this).attr("shuliang")
        }else{
        }
     }); 
    $("#total").html(total);
}
        </script>
</body>
</html>