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

    <header class="" role="navigation">
        <div class="container">
            <div class="row row-head">
                <div class="col-md-3 col-sm-3 col-xs-3 col-head">
                    <a class="head-back" href="javascript:history.back();"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 col-head">
                    <p class="row-head-text">我的订单</p>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3 col-head">
                    <a class="head-back" href="/abs_web"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                </div>
            </div>
        </div>
    </header>

	<div id="main_div">
	   <div class="container">
            <div class="row">
                <div id="uploadp" align="center">
                    <img alt="" src="/yyyy/userImg/4cd57658-2a37-4dc5-b54b-911fb80185c3.jpg" class="img-thumbnail myp">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;padding: 10px 0 10px 0;" id="umessage">
                    
                </div>
            </div>
        </div>
	  
	   

    </div>


    <footer class="tool_foot">
        <div class="container footer itme_detail_top">
            <div class="row footer-row">
                <div class="col-md-12 col-sm-12 col-xs-12 footer-col">
                    <button class="btn btn-default a-btn" type="submit">上传照片<input style="position: absolute;top:0;left:0;right:0;bottom:0;opacity:0;" id="uploadInput1" type="file"  accept="image/*"></input></button>
                </div>
            </div>
        </div>
    </footer>
	
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/LocalResizeIMG.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/mobileBUGFix.mini.js"></script>
<script type="text/javascript">
var UrlConfig = {
		upLoadImage:'<%=request.getContextPath() %>/app/mobile/image/upLoadImage'
};

$(document).ready(function() {
    //设置高度
    $(function(){
        $("#main_div").height($(window).height()-$("header").height()-52);
        $("#main_div").css({"overflow":"auto"});
    });
    
    // LOAD
    $("#uploadInput1").localResizeIMG({
        width: 600,
        quality: 1,
        success: function (result) {
            var img = new Image();
            img.src = result.base64;
            console.log(result.clearBase64);
            $("#result").empty();
            $("#result").append(img); //呈现图像(拍照結果)
            $("#umessage").empty();
            $.ajax({
                url: UrlConfig.upLoadImage,
                type: "POST",
                data:{formFile:result.clearBase64},
                dataType: "json",
                timeout: 1000,
                error: function(){
                    alert("Error loading PHP document");
                },
                success: function(result){
                	var attstr= '<img src="'+result.data.imgPath+'" class="img-thumbnail myp">'; 
                    $("#uploadp").html(attstr);
                    $("#umessage").html("上传成功");
                }
            }); 
        }
    });
    
});
// to-pay-bt
        </script>
</body>
</html>