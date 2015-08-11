<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
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
    <div class="icon-center">
        <img class="icon-spin"
            src="<%=request.getContextPath()%>/resources/images/loading.png">
    </div>
	<div class="container pic_show">
		<div id="owl-demo1" class="owl-carousel owl-theme"></div>
	</div>
	<div class="container today_miaosha">
        <div class="panel panel-default my-panel">
            <div class="panel-heading">特价商品</div>
            <div class="panel-body">
                <div class="container">
                <!--  -->
                	<c:forEach items="${data['HDFLG_5']}" var="item" varStatus="status">
                    		<c:if test="${status.index % 2 eq 0}">
                    			<div class="row">
                    				<c:forEach items="${data['HDFLG_5']}" var="item_2" varStatus="status_2"
                    							begin="${status.index}" end="${status.index + 1}">
                         			 <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                           				 <a href="#">
                                		 <img src="${item_2.path}">
                               			  <p class="daojishi_name">${item_2.item_name}</p>
                               			  <p class="daojishi_price">特价: ￥${item_2.price_huiyuan}</p>
                            			</a>
                         			 </div>
                         			</c:forEach>	
								</div>
							</c:if>

                    </c:forEach>	
 
                    	


                    	
                	
                
                
                
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container today_miaosha">
        <div class="panel panel-default">
            <div class="panel-heading">热卖商品</div>
            <div class="panel-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body">
                            <a href="#">
                                 <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                 <p class="daojishi_name">比欧全护肤界面景华路景华路景华路</p>
                                 <p class="daojishi_price">特价: ￥198.00</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>  
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getLunboList: '<%=request.getContextPath() %>/app/mobile/home/getLunBolist',
        getTejiaItem: '<%=request.getContextPath() %>/app/mobile/home/getTejiaItem',
    };

$(document).ready(function() {
                //
                                function timer(id){
                                    var jqueryID = '#' + id;

                                    var endTime = new Date($(jqueryID).data('date'));
                                  
                                    var currentTime = new Date();
                                    
                                    var intDiff = parseInt((endTime-currentTime)/1000);
                                    
                                    window.setInterval(function(){
                                        var day=0,
                                            hour=0,
                                            minute=0,
                                            second=0;
                                        if(intDiff > 0){
                                            hour = Math.floor(intDiff / (60 * 60));
                                            minute = Math.floor(intDiff / 60)  - (hour * 60);
                                            second = Math.floor(intDiff) - (hour * 60 * 60) - (minute * 60);
                                        }
                                        if (hour <= 9) hour = '0' + hour;
                                        if (minute <= 9) minute = '0' + minute;
                                        if (second <= 9) second = '0' + second;
                                        $(jqueryID +' .hour').html(hour);
                                        $(jqueryID +' .min').html(minute);
                                        $(jqueryID +' .sec').html(second);
                                        intDiff--;
                                    }, 1000);
                                }
                                $(function(){
                                    var djsList = $('.daojishi');
                                    for(var i = 0;i < djsList.length; i++){
                                        timer(djsList[i].id);
                                    }
                                });
            });
            
getLunboList();

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
                    if(lunbo.action=='#'||lunbo.action==''){
                        link='#';
                    }else{
                        link=UrlConfig.path+lunbo.action
                    }
                    
                    $("#owl-demo1").append('<div class="item"><a href="'+link+'"><img src="'+lunbo.imgPath +'" class="img-responsive"></a></div>');
                }
                $("#owl-demo1").owlCarousel({
                    items: 1,
                    loop: true,
                    margin: 10,
                    smartSpeed: 450,
                    autoplay: true,
                    autoplayTimeout: 4000,
                });
                $(".icon-center").hide();
            }else{
                
            }
         }
    }); 
}
</script>
</body>
</html>