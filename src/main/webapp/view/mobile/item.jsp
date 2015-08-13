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

    <div id="main_div">
        <div class="container pic_show">
            <div id="owl-demo1" class="owl-carousel owl-theme">
                    <c:forEach items="${result.tupianList}" var="item">
                        <div class="item">
                        <img src="${item.path}" class="img-responsive img-lunbo"></div>
                    </c:forEach>
                    <div class="item">
                        <img src="${path}/resources/images/fenlei_pic1.png" class="img-responsive  img-lunbo"></div>
                    <div class="item">
                        <img src="${path}/resources/images/fenlei_pic1.png" class="img-responsive  img-lunbo"></div>
                    <div class="item">
                        <img src="${path}/resources/images/fenlei_pic1.png" class="img-responsive  img-lunbo"></div>
                    <div class="item">
                        <img src="${path}/resources/images/fenlei_pic1.png" class="img-responsive  img-lunbo"></div>
            </div>
        </div>
        <div class="container">
            <div class="row detail-name">
                <p class="detail-name-p">金典系列外套金典系列外套金典</p>
            </div>
            <div class="row detail-price">
                <p class="detail-price-p">价额：456.00</p>
            </div>

            <div class="tabbable" id="tabs-792036">
                <ul class="nav nav-tabs">
                    <li>
                        <a href="#panel-2" data-toggle="tab">评价</a>
                    </li>
                    <li>
                        <a href="#panel-2" data-toggle="tab">型号</a>
                    </li>
                    <li class="active">
                        <a href="#panel-1" data-toggle="tab">详情</a>
                    </li>

                    <li>
                        <a href="#panel-2" data-toggle="tab">参数</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-1">
                        <div class="text-edit">
                            图片文字说明
                            <img  src="${path}/resources/images/awj1.jpg" alt="">
                                        
                        </div>
                    </div>
                    <div class="tab-pane" id="panel-2">
                            <div class="media">
                                <div class="media-left media-middle my-media-left">
                                   <a href="#">
                                        <img class="media-object img-circle img-pinglun" src="${path}/resources/images/16258_100.png" alt="">
                                   </a>
                                </div>
                                <div class="media-body">
                                    <p>王三</p>
                                    <h4 class="media-heading">很好的东西，下次还买。</h4>
                                    <p>2012年12月26</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-left media-middle my-media-left">
                                    <a href="#">
                                     <img class="media-object img-circle img-pinglun" src="${path}/resources/images/15901_60.png" alt="">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <p>王三</p>
                                    <h4 class="media-heading">很好的东西，下次还买。很好的东西，下次还买。很好的东西很好的东西，下次还买很好的东西，
                                    下次还买。很好的东西，下次还买。很好的东西很好的东西，下次还买很好的东西，下次还买。
                                    很好的东西，下次还买。很好的东西很好的东西，下次还买很好的东西，下次还买。很好的东西，下次还买。
                                    很好的东西很好的东西，下次还买很好的东西，下次还买。很好的东西，下次还买。很好的东西很好的东西，
                                    下次还买很好的东西，下次还买。很好的东西，下次还买。很好的东西很好的东西，下次还买很好的东西，下次还买。
                                    很好的东西，下次还买。很好的东西很好的东西，下次还买很好的东西，下次还买。很好的东西，下次还买。
                                    很好的东西很好的东西，下次还买很好的东西，下次还买。很好的东西，下次还买。很好的东西很好的东西，
                                    下次还买。很好的东西，下次还买。很好的东西，下次还买。，下次还买。很好的东西，下次还买。</h4>
                                    <p>2012年12月26</p>
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
                    <button class="btn btn-success a-btn" type="button">加入购物车</button>
                </div>

                <div class="col-md-4 col-sm-4 col-xs-4">
                    <button class="btn btn-info b-btn" type="button"><span class="glyphicon glyphicon-shopping-cart my-cart" aria-hidden="true"></span></button>
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
        $("#main_div").height($(window).height()-$("footer").height());
        $("#main_div").css({"overflow":"auto"});
        
        $("#owl-demo1").owlCarousel({
            items: 1,
            loop: true,
            margin: 10,
            smartSpeed: 450,
            autoplay: true,
            autoplayTimeout: 4000,
        });
    });
    // 翻页
    // $(".icon-center").show();
    // $(".icon-center").hide();
    $("#fanye_bt").click(function(){

    }); 
    // 搜索按钮
    $("#search_bt").click(function(){
        if($.trim($("#searchParm").val())==''){
            //$('#searchparm').popover('show');
            return;
        }
        window.location.href='<%=request.getContextPath() %>'+
                '/app/mobile/page/itemlist?searchparm='+$("#searchParm").val(); 
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
</script>
</body>
</html>