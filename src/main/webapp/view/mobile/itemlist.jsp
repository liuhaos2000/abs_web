<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商品列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/style.css">
	<link rel="stylesheet" href="${path}/resources/css/media.css">
</head>
<body>

    <header class="navbar top" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-md-2 col-sm-2 col-xs-3 top_logo">
                    <p class="navbar-text">
                        <a href="#">
                            <img class="img-responsive" src="${path}/resources/images/logo.png" alt="瑞和商城"></a>
                    </p>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-9 top_search">
                    <p class="navbar-text input-group">
                        <input type="text" class="form-control">
                        <span class="input-group-addon">
                            <img src="${path}/resources/images/search.png"></span>
                    </p>
                </div>
            </div>
        </div>
    </header>
	
	   <div id="main_div"> 
        <table class=" tb_item">
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img class="itemlist_img" src="${path}/resources/images/ms1.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name p-no-bottom">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price p-no-bottom">￥100.00 - 400.00</p>
                                <p class="item_list_hpd p-no-bottom">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms2.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms1.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms2.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms1.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms2.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms1.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
            <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms2.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
                        <tr class=" tr_item">
                <td class="td_item_img">
                    <img  src="images/ms2.png">
                </td>
                <td class="td_item_info">
                            <a href="item_detail.html">
                                <p class="item_list_name">三星AS9000 双卡双待/2G内存/16G</p>
                                <p class="item_list_price">￥4561110.00</p>
                                <p class="item_list_hpd">好评度：96% (1960人)</p>
                            </a>
                </td>
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 col-no-pad">
                    <button id="fanye" class="btn btn-block btn-mini btn-info" type="button">点击加载更多</button>
                </div>
            </div>
        </div>
    </div>
    
    
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    //设置高度          
    $(function(){
        $("#main_div").height($(window).height()-$("header").height()-2);
        $("#main_div").css({"overflow":"auto"});
    });
    //滚动条
    /*
    $("#main_div").scroll(function() {
        
        if ($("#main_div").scrollTop()<=0){
            alert("上翻页");
        }
        if ($("#main_div").scrollTop() >= $("#main_div")[0].scrollHeight-$("#main_div").height()) {
            alert("下翻页");
        }
        
    });
    */
});
</script>
</body>
</html>