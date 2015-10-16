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
                    <button type="button" class="btn btn-danger btn-xs order-num-position order-num-bt to-pay-bt">去付款</button>
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
<script type="text/javascript">
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
        //addressid=$(this).attr("addressid");
        doPay();
    });
    
}
function doPay(){
    alert("pay");
}
        </script>
</body>
</html>