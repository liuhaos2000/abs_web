<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>会员</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/media.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/showloading/showLoading.css">
</head>
<body>
    <div class="container huiyuan">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 huiyuan_xinxi">
                <c:choose>
                    <c:when test="${result.loginUser.nickname!=null}">
                        <div class="user_head">
                            <a href="#">
                                <img src="${result.loginUser.weixinImageUrl }"></a>
                        </div>
                        <div>
                                    <a href="#" class="user_name">
                                        <p>${result.loginUser.nickname }</p>
                                    </a>
                                    <a href="#" class="user_count">
                                        <p>现有积分： ${result.loginUser.jifen }</p>
                                    </a>
                        </div>
                        <img src="<%=request.getContextPath() %>/resources/images/rate.png" class="user_rate">
                    </c:when>
                    <c:otherwise>
                        <div class="user_head">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/unloginuser.png"></a>
                        </div>
                        <div>
                            <a href="#" class="user_name">
                                <p>未关注用户</p>
                            </a>
                            <a href="#" class="user_count">
                                <p>长按二维码进行关注</p>
                            </a>
                        </div>
                        <img src="<%=request.getContextPath() %>/resources/images/erweima.jpg" class="guanzhuerweima" width="100" height="100"> 
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-5 col-md-offset-9 col-sm-offset-9 col-xs-offset-7 get_wifi">
                
            </div>
        </div>
    </div>
    <div class="container huiyuan_main">
        <div class="panel p1">
            <div class="panel-heading">
                <p>会员活动</p>
            </div>
            <div class="panel-body">
                <ul class="list-unstyled">
                    <li>
                        <p>
                            <a href="#">新生报到 IN越惠</a>
                            <span>8月25日</span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <a href="#">超级团购，折扣到底</a>
                            <span>8月18日</span>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="panel p2">
            <div class="panel-heading">
                <a href='<%=request.getContextPath() %>/app/mobile/page/myorder'>
                    <p>我的订单</p>
                </a>
                <c:if test="${result.orderCount>0}">
                    <span class="ordercount">${result.orderCount}</span>
                </c:if>
            </div>
        </div>
        <div class="panel p3">
            <div class="panel-heading">
                <a href='<%=request.getContextPath() %>/app/mobile/page/myaddress'>
                
                    <p>地址管理</p>
                </a>
            </div>
        </div>
        <div class="panel p2">
            <div class="panel-heading">
                <a href="#">
                    <p>关于我们</p>
                </a>
            </div>
        </div>
    </div>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/showloading/jquery.showLoading.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".popupshadow").hideLoading();
	$(".popupshadow").hide();
});

</script>
</body>
</html>