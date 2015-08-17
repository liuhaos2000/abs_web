<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商品详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/style.css">
	<link rel="stylesheet" href="${path}/resources/css/media.css">
	<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${path}/resources/css/owl.theme.default.min.css">
</head>
<body>

    <div id="main_div" class="maindiv">
        <div class="container pic_show">
            <div id="owl-demo1" class="owl-carousel owl-theme">
                    <c:forEach items="${result.tupianList}" var="item">
                        <div class="item">
                        <img src="${item.path}" class="img-responsive img-lunbo"></div>
                    </c:forEach>
            </div>
        </div>
        <div class="container">
            <div class="row detail-name">
                <p class="detail-name-p">${result.item.itemName}</p>
            </div>
            <div class="row detail-price">
            			<p class="detail-price-p">价额：<span id="itemPrice">${result.mmPrice.price_from_to}</span></p>
            </div>
            <c:choose>
            	<c:when test="${result.itemDetail.size()> 1}">
            	    <c:choose>
            			<c:when test="${result.xinghao.size()> 0}">
                                <div class="row">
            	                    <div class="col-md-2 col-sm-2 col-xs-2 detail-xinghao">
                                    	<p class="">型号：</p>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-10 ">
                                      <div class="btn-group" data-toggle="buttons">
                                      	<c:forEach items="${result.xinghao}" var="xh">
                                      		<label class="btn btn-info btn-xs detail-xinghao-bt">
    			                    			<input type="radio" 
    			                    					name="xinghao" 
    			                    					xianghaoId="${xh.item_guige}" 
    			                    					autocomplete="off"> ${xh.guige_text}
 				                    		</label>
                                      	</c:forEach>
                                      </div>
                                    </div>
                                </div>    
            			</c:when>
            		</c:choose>
            		<c:choose>
            			<c:when test="${result.yanse.size()> 0}">
                                <div class="row">
            	                    <div class="col-md-2 col-sm-2 col-xs-2 detail-xinghao">
                                    	<p class="">颜色：</p>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-10 ">
                                      <div class="btn-group" data-toggle="buttons">
                                      	<c:forEach items="${result.yanse}" var="xh">
                                      		<label class="btn btn-info btn-xs detail-xinghao-bt">
    			                    			<input type="radio" 
    			                    					name="yanse" 
    			                    					yanseId="${xh.item_yanse}" 
    			                    					autocomplete="off"> ${xh.yanse_text}
 				                    		</label>
                                      	</c:forEach>
                                      </div>
                                    </div>
                                </div>  
            			</c:when>
            		</c:choose>
                </c:when>
            </c:choose>
            <div class="row">
            	<div class="col-md-2 col-sm-2 col-xs-2 detail-xinghao">
            		<p class="">数量：</p>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10 ">
                		<div class="btn-group detail-xinghao-bt" role="group">
                            <button id="jian_bt" type="button" class="btn btn-default btn-xs">-</button>
                            <button id="shuliang" type="button" class="btn btn-default btn-xs" >1</button>
                            <button id="add_bt" type="button" class="btn btn-default btn-xs">+</button>
                        </div>
                </div>

            </div>
<div class="row">
            <div class="tabbable tab-all" id="tabs-792036">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-1" data-toggle="tab">评价</a>
                    </li>
                    <li>
                        <a href="#panel-2" data-toggle="tab">商品详情</a>
                    </li>
                    <li>
                        <a href="#panel-3" data-toggle="tab">参数</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-1">
                    		<c:forEach items="${result.TItemPingjia}" var="pj">
                    		     <div class="media pinlun-one">
                                    <div class="media-left">
                                       <a href="#">
                                            <img class="media-object img-circle img-pinglun" 
                                            	src="${pj.weixin_image_url}" alt="">
                                       </a>
                                    </div>
                                    <div class="media-body">
                                        <p class="pl-name">${pj.nickname}</p>
                                        <div class=pl-star>
                                            <c:forEach begin="1" end="${pj.pingjia_level}" step="1">
                                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                            </c:forEach>
                                        </div>
                                        <p class="pl-neirong">${pj.pingjia_text}</p>
                                        <p class="pl-date">${pj.pingjia_date}</p>
                                    </div>
                                 </div>
                    		</c:forEach>
                         </div>
                         <div class="tab-pane" id="panel-2">
                       		 <div class="text-edit">
                                                                                      图片文字说明
                                 <img  src="${path}/resources/images/awj1.jpg" alt="">
                                 <img  src="${path}/resources/images/er.png" alt="">
                                 <img  src="${path}/resources/images/er1.webp" alt="">
                             </div>
                    	</div>
                    	<div class="tab-pane" id="panel-3">
                       		 <div class="container">
                       		 	<div class="row">
                       		 		<c:forEach items="${result.itemParm}" var="pm">
                       		 			<div class="col-md-4 col-sm-4 col-xs-4 ">
                       		 				<p class="pl-name">${pm.key}:</p>
                       		 			</div>
                       		 			<div class="col-md-8 col-sm-8 col-xs-8 ">
                       		 				<p class="pl-name">${pm.value}</p>
                       		 			</div>
                       		 		</c:forEach>
                       		 	</div>
                       		 </div>
                    	</div>
                      </div>
                  </div>
          </div>
             </div>
    </div>
    <footer class="tool_foot">
        <div class="container footer itme_detail_top">
            <div class="row">
                <div class="col-md-8 col-sm-8 col-xs-8">
                    <button id="addCart_bt" class="btn btn-success a-btn" type="button">加入购物车</button>
                </div>

                <div class="col-md-4 col-sm-4 col-xs-4">
                    <button id="cart_bt" class="btn btn-info b-btn" type="button"><span class="glyphicon glyphicon-shopping-cart my-cart" aria-hidden="true"></span></button>
                    <span class="item-cartcount">3</span>
                </div>
            </div>
        </div>
    </footer>
    
    
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getCartCount: '<%=request.getContextPath() %>/app/mobile/cart/getCount',
    	addItemToCart:'<%=request.getContextPath() %>/app/mobile/cart/addItem',
    	getItemSalePrice:'<%=request.getContextPath() %>/app/mobile/item/getItemSalePrice',
    };
var pageParm = {
	    page:'${page}',
	    rows:'${rows}',
	    orderby:'${orderby}',
	    searchparm:'${searchparm}',
	    typeId:'${typeId}',
	    pagetotal:'${pagetotal}'
};
$(document).ready(function() {
	
    //设置高度
    $(function(){
        $("#main_div").height($(window).height()-52);
        $("#main_div").css({"overflow":"auto"});
        
        $("#owl-demo1").owlCarousel({
            items: 1,
            loop: true,
            margin: 10,
            smartSpeed: 450,
            autoplay: true,
            autoplayTimeout: 4000,
        });
        getCartCount();
    });
    // 加入购物车
    $("#addCart_bt").click(function(){
    	var itemId = '${result.item.itemId}';
		var xinghao=0;
		var yanse=0;
    	var shuliang= $("#shuliang").text();
    	if("${result.itemDetail.size()}" > 1){

    		if("${result.xinghao.size()}" > 1){
    	    	var val=$('input:radio[name="xinghao"]:checked').attr('xianghaoId');
    	    	if(val==null){
    	    		alert("请选择型号");
    	    		return false;
    			}else{
    				xinghao=val;
    	    	}
    		}
    		if("${result.yanse.size()}" > 1){
    	    	var val=$('input:radio[name="yanse"]:checked').attr('yanseId');
    	    	if(val==null){
    	    		alert("请选择颜色");
    	    		return false;
    			}else{
    				yanse=val;
    	    	}
    		}
    		addItemToCart(itemId,xinghao,yanse,shuliang);
    	}else{
    		addItemToCart(itemId,0,0,shuliang);
    	}
    }); 
    // 购物车
    $("#cart_bt").click(function(){
        window.location.href='<%=request.getContextPath() %>'+
        '/app/mobile/page/cart'; 
    }); 
    // 数量加
    $("#add_bt").click(function(){
    	var s = $("#shuliang").text();
    	s = s*1+1;
    	$("#shuliang").html(s);
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
    
    $(":radio").change(function(){
        var itemId = '${result.item.itemId}';
        var xinghao=0;
        var yanse=0;
        if("${result.itemDetail.size()}" > 1){
            if("${result.xinghao.size()}" > 1&&"${result.yanse.size()}" > 1){
            	var xinghao=$('input:radio[name="xinghao"]:checked').attr('xianghaoId');
                var yanse=$('input:radio[name="yanse"]:checked').attr('yanseId');
                if(xinghao!=null&&yanse!=null){
                	getItemSalePrice(itemId,xinghao,yanse);
                }
            }else if("${result.xinghao.size()}" > 1){
            	xinghao=$('input:radio[name="xinghao"]:checked').attr('xianghaoId');
            	getItemSalePrice(itemId,xinghao,yanse);
            }else if("${result.yanse.size()}" > 1){
            	yanse=$('input:radio[name="yanse"]:checked').attr('yanseId');
            	getItemSalePrice(itemId,xinghao,yanse);
            }
        }
    }); 
});

function addItemToCart(itemId,xinghao,yanse,shuliang) {
    $.ajax({    
        url:UrlConfig.addItemToCart,  
        data:{itemId:itemId,
              xinghao:xinghao,
              yanse:yanse,
              shuliang:shuliang},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
                if (result.data > 0) {
                }
            }
            getCartCount();
         }
    }); 
}
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
                     $('.item-cartcount').css("display","block");
                     $('.item-cartcount').html(result.data);
                 } else {
                     $('.item-cartcount').css("display","none");
                 }
             }else{
             }
          }
     }); 
}
function getItemSalePrice(itemId,guige,yanse) {
    $.ajax({    
         url:UrlConfig.getItemSalePrice,// 跳转到 action    
         data:{itemId:itemId,guige:guige,yanse:yanse},    
         type:'post',    
         //cache:false,    
         dataType:'json',    
         success:function(result) {
             if(result.successful == true ){
            	 $('#itemPrice').html(result.data.sale_price);
             }else{
             }
          }
     }); 
}
</script>
</body>
</html>