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
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/style.css">
	<link rel="stylesheet" href="${path}/resources/css/media.css">
	<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${path}/resources/css/owl.theme.default.min.css">
</head>
<body>
    <div class="share">
    	<img class="img-responsive" src="<%=request.getContextPath() %>/resources/images/shouzhi.png">
    	    <p>帮助好友<Strong>${SHOP_USER.nickname}</Strong>分享他的商品</p>
    </div>
	<header>
		<div class="container">
			<div class="row index-row-head">
				<div class="col-md-2 col-sm-2 col-xs-2 no-padding">
				    <a href="/abs_web/app/mobile/page/index?parent=${SHOP_USER.openId}">
						<img class="img-responsive" src="<%=request.getContextPath() %>/resources/images/tang_logo.jpg">
					</a>
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 no-padding-left">
					<div class="input-group index-col-head">
						<h4 class="myh4-2"><Strong>${SHOP_USER.nickname}</Strong>的商品&nbsp;&nbsp;&nbsp;
							<c:if test="${(LOGIN_USER.lever eq '00' ||LOGIN_USER.lever eq '01'||LOGIN_USER.lever eq '02') && LOGIN_USER.openId ne SHOP_USER.openId}">
								<a style="margin-bottom: 2px;" class="btn btn-warning btn-xs" href="/abs_web/app/mobile/page/index?parent=${LOGIN_USER.openId}&change=1" role="button">我的店铺</a>
							</c:if>
						</h4>
					</div>
					<div></div>
				</div>
			</div>
		</div>
		<!-- 探出窗口 -->
        <div class="popupshadow">
        </div>
	</header>
    
    <div id="main_div" class="main_div">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column no-padding">
					<div class="carousel slide pic_show" id="carousel-7342">
						<ol class="carousel-indicators">
							<c:forEach items="${result.tupianList}" var="item" varStatus="status">
								<li data-slide-to="${status.index}" data-target="#carousel-7342"></li>
							</c:forEach>
						</ol>
						<div class="carousel-inner">
							<c:forEach items="${result.tupianList}" var="item" varStatus="status">
								<c:choose>
									<c:when test="${status.index eq 0}"> 
										<div class="item  active">
												<img class="" src="${item.path}" />
										</div>
									</c:when>
									<c:otherwise> 
										<div class="item ">
												<img class="" src="${item.path}" />
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
        </div>
        
        <div class="container">
            <div class="row detail-name">
                <p class="detail-name-p">${result.item.item_name}</p>
            </div>
            <div class="row detail-price">
            	<div class="col-md-8 col-sm-8 col-xs-8 detail-price-col">
            	    <p class="detail-price-p">价格：￥<span id="itemPrice">${result.mmPrice.price_from_to}</span></p>
            	</div>
            	<div class="col-md-4 col-sm-4 col-xs-4 detail-kucun">
            	</div>
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
                <div class="col-md-6 col-sm-6 col-xs-6 ">
                		<div class="btn-group detail-xinghao-bt" role="group">
                            <button id="jian_bt" type="button" class="btn btn-default btn-xs">-</button>
                            <button id="shuliang" type="button" class="btn btn-default btn-xs" >1</button>
                            <button id="add_bt" type="button" class="btn btn-default btn-xs">+</button>
                        </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4 detail-xinghao">
                	<p class="pl-date">销量:${result.xiaoliang.xiaoliang}</p>
                </div>                

            </div>
<div class="row">
            <div class="tabbable tab-all" id="tabs-792036">
                <ul class="nav nav-tabs " role="tablist">
                    <li class="vt active">
                        <a href="#panel-2" data-toggle="tab">商品详情</a>
                    </li>
                    <li class="vt1">
                        <a href="#panel-3" data-toggle="tab">参数</a>
                    </li>
                    <!--
                    <li class="vt">
                        <a href="#panel-1" data-toggle="tab">评价</a>
                    </li>
                    -->
                </ul>
                <div class="tab-content">
                <!--
                    <div class="tab-pane " id="panel-1">
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
                    -->
                         <div class="tab-pane active" id="panel-2">
                       		 <div class="text-edit">
                       		 		${result.item.fu_text}
                             </div>
                    	</div>
                    	<div class="tab-pane" id="panel-3">
                       		 <div class="container">
                       		 	<div class="row">
                       		 		<table>
                       		 		  <thead>
                       		 		  	<tr>
                       		 		  	  <td width="200"></td>
                       		 		  	  <td width="400"></td>
                       		 		  	</tr>
                       		 		  </thead>
                       		 		  <c:forEach items="${result.itemParm}" var="pm">
                       		 			<tr>
                       		 				<td class="tb-left">${pm.key}:</td>
                       		 				<td class="tb-right">${pm.value}</td>
                       		 			</tr>
                       		 		  </c:forEach>
                       		 		</table>
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
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jweixin-1.0.0.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.lazyload.js"></script>
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
        $("#main_div").height($(window).height()-$("header").height()-52);
        $("#main_div").css({"overflow":"auto"});
        
  	    $('.carousel').carousel({
		  interval: 2000
		});

        $('img').lazyload({ 
            effect:'fadeIn' 
        });
        
        getCartCount();
    });
    // 加入购物车
    $("#addCart_bt").click(function(){
    	var itemId = '${result.item.item_id}';
		var xinghao=0;
		var yanse=0;
    	var shuliang= $("#shuliang").text();
    	if("${result.itemDetail.size()}" > 1){
    		if("${result.xinghao.size()}" > 1){
    	    	var val=$('input:radio[name="xinghao"]:checked').attr('xianghaoId');
    	    	if(val==null){
    	    		myalert("请选择型号","main_div");
    	    		return false;
    			}else{
    				xinghao=val;
    	    	}
    		}
    		if("${result.yanse.size()}" > 1){
    	    	var val=$('input:radio[name="yanse"]:checked').attr('yanseId');
    	    	if(val==null){
    	    		myalert("请选择颜色","main_div");
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
        var itemId = '${result.item.item_id}';
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
            }else{
            	myalert("产品数量不足","main_div");
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
            	 $('#kucun').html(result.data.shuliang);
             }else{
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
          title: '${result.item.frend_title}', // 分享标题
          desc: '${result.item.frend_text}', // 分享描述
          link: '${result.signInfo.url}', // 分享链接
          imgUrl: '${result.item.path}', // 分享图标
          success: function () { 
          	 //alert('success');
          },
          cancel: function () { 
             //alert('cancel');
          }
        });
      
      wx.onMenuShareTimeline({
    	    title: '${result.item.frend_title}', // 分享标题
    	    link: '${result.signInfo.url}', // 分享链接
    	    imgUrl: '${result.item.path}', // 分享图标
    	    success: function () { 
    	        // 用户确认分享后执行的回调函数
    	    },
    	    cancel: function () { 
    	        // 用户取消分享后执行的回调函数
    	    }
    	});
  });
  wx.error(function(){
  });

  //微信分享JDK-------------------->
</script>
</body>
</html>