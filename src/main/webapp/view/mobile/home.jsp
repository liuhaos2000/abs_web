<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>悦东优选</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/showloading/showLoading.css">
</head>
<body>
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


	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/showloading/jquery.showLoading.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.lazyload.js"></script>
	<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath()%>',
        getLunboList: '<%=request.getContextPath()%>/app/mobile/home/getLunBolist',
        getTejiaItem: '<%=request.getContextPath()%>/app/mobile/home/getTejiaItem',
    };

$(document).ready(function() {
	  $('.carousel').carousel({
		  interval: 2000
		});
	
	    $("div[itemId]").bind("click",function(){
	        window.location.href='<%=request.getContextPath() %>'+
	        '/app/mobile/page/item?itemId='+$(this).attr("itemId")+
	        '&phaseNum='+$(this).attr("phaseNum")+
	        '&parent=${SHOP_USER.openId}'; 
	    });
	    
		$(".popupshadow").hideLoading();
		$(".popupshadow").hide();
		
		$('img').lazyload({ 
			  effect:'fadeIn' 
		});
});
	</script>
</body>
</html>