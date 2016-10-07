<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>瑞和商城</title>
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
		<div class="icon-center">
			<img class="icon-spin"
				src="<%=request.getContextPath()%>/resources/images/loading.png">
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column no-padding">
				<div class="carousel slide" id="carousel-7342">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel-7342">
						</li>
						<li data-slide-to="1" data-target="#carousel-7342"></li>
						<li data-slide-to="2" data-target="#carousel-7342"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt=""
								src="<%=request.getContextPath()%>/resources/images/pic1.png" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio</p>
							</div>
						</div>
						<div class="item">
							<img alt=""
								src="<%=request.getContextPath()%>/resources/images/pic2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio</p>
							</div>
						</div>
						<div class="item">
							<img alt=""
								src="<%=request.getContextPath()%>/resources/images/pic1.png" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio</p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-7342"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-7342"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>

		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="row clearfix home_groupheade">
							<div class="col-md-12 column home_grouphead_col">
								<h4 class="myh4">热卖商品</h4>
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
	        '/app/mobile/page/item?itemId='+$(this).attr("itemId"); 
	    });
	    
		$(".popupshadow").hideLoading();
		$(".popupshadow").hide();
		
		$('img').lazyload({ 
			  effect:'fadeIn' 
		});
});
function getLunboList() {
    $.ajax({    
        url:UrlConfig.getLunboList,// 跳转到 action    
        data:{},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
                for (var i = 0; i < result.data.length; i++) {
                    var lunbo = result.data[i];
                    var link;
                    if(lunbo.action=='#'||lunbo.action==''||lunbo.action==null){
                        link='#';
                    }else{
                        link=UrlConfig.path+lunbo.action
                    }
                    $("#owl-demo1").append('<div class="item"><a href="'+link+'"><img src="'+lunbo.imgPath +'" class="img-responsive img-lunbo"></a></div>');
                }
                $("#owl-demo1").owlCarousel({
                    items: 1,
                    loop: true,
                    margin: 10,
                    smartSpeed: 450,
                    autoplay: true,
                    autoplayTimeout: 4000,
                });
            }else{
            }
         }
    }); 
}
	</script>
</body>
</html>