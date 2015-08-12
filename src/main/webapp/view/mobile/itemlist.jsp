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
            <c:forEach items="${itemList}" var="item">
                <tr class=" tr_item" itemId="${item.item_id}">
                    <td class="td_item_img" valign="middle">
                        <img class="itemlist_img" src="${item.path}">
                    </td>
                    <td class="td_item_info" valign="top">
                        <div>
                                <a href="item_detail.html">
                                    <p class="item_list_name p-no-bottom">${item.item_name}</p>
                                    <p class="item_list_price p-no-bottom">￥${item.price}</p>
                                    <p class="item_list_hpd p-no-bottom">销量：${item.haopingdu}</p>
                                    <p class="item_list_hpd p-no-bottom">好评度：${item.haopingdu} (${item.pingjia_zongshu}人)</p>
                                </a></div>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="container page-bt">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 col-no-pad">
                    <button id="fanye_bt" class="btn btn-block btn-mini btn-info" type="button">点击加载更多</button>
                </div>
            </div>
        </div>
    </div>
    
    
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script type="text/javascript">
var pageParm = {
	    page:'${page}',
	    rows:'${rows}',
	    orderby:'${orderby}',
	    searchparm:'${searchparm}',
	    typeId:'${typeId}',
	    pagetotal:'${pagetotal}'
};
var page;
var rows;
var orderby;
$(document).ready(function() {
	
    //设置高度          
    $(function(){
        $("#main_div").height($(window).height()-$("header").height()-2);
        $("#main_div").css({"overflow":"auto"});
        changeBt();
    });
    // 翻页
    $("#fanye_bt").click(function(){
    	pageParm.page=pageParm.page++;
    	var url="${path}/app/mobile/itemlist/getItemList";
        $.ajax({    
            url:url,// 跳转到 action    
            data:pageParm,    
            type:'post',    
            dataType:'json',    
            success:function(result) {
                if(result.successful == true ){
                	
                }else{
                	
                }
             }
        });
    }); 
});
function changeBt(){
	//是否有下一页
	    alert(pageParm.page);
        alert(pageParm.pagetotal);
	if(pageParm.page>=pageParm.pagetotal){

		//disabled="disabled"
		//$('#button').attr('disabled',"true");添加disabled属性 
		//$('#button').removeAttr("disabled"); 移除disabled属性 
		$('#fanye_bt').attr('disabled',"true");
	} else {
		
		$('#fanye_bt').removeAttr("disabled");
	}
}
</script>
</body>
</html>