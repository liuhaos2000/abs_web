<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>收货地址</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body id="aa">
    <!-- Modal Start-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <p class="modal-title" id="myModalLabel">收货地址</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputPassword3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">姓名：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="mailName" type="text" class="form-control" id="inputPassword3" placeholder="请填写姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">电话：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="mailTel" type="text" class="form-control" id="inputPassword3" placeholder="收件人电话">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">省份：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <select id="ad1" class="form-control">
                                        <option value="">请选择</option>
                                        <c:forEach items="${result.regionList}" var="item" >
                                            <option value="${item.regionId}">${item.regionName}</option>
                                        </c:forEach>
                                  </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">城市：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                    <select id="ad2" class="form-control">
                                        <option  value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">区域：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                    <select id="ad3" class="form-control">
                                        <option  value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">详细：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="ad4" type="text" class="form-control" id="inputEmail3" placeholder="详细地址">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left"></label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="morenFlg" type="checkbox"> 默认收货地址
                                </div>
                            </div>
                         </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                      <button id="delete_ad_bt" type="button" class="btn btn-primary delete-ad-bt">删除</button>
                      <button id="save_bt" type="button" class="btn btn-primary">保存</button>
                    </div>
                </div>
            </div>
        </div>
    <!-- Modal End -->
        
        
        
    <header class="navbar top" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 top_logo">
                    <p class="navbar-text">收货地址</p>
                </div>
            </div>
        </div>
    </header>

	
	<div id="main_div">
	    <div class="container ">
	      <c:forEach items="${result.uadList}" var="item" varStatus="status">
            <div class="row cart-item-row">
                <div class="col-md-2 col-sm-2 col-xs-2  cart-col-box cart-col-checkbox">
                   <button class="btn btn-mini" type="button"  data-toggle="modal" data-target="#myModal">改</button>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10 cart-col-box cart-col-info">
                    <p class="adderss_name">收件人:${item.name}</p>
                    <p class="adderss_name">地址:${item.adname1}${item.adname2}${item.adname3}${item.address_detail}</p>
                    <p class="adderss_name">电话:${item.tel}</p>
                    <span class="label label-info">默认</span>
                    <span class="btn-clipboard">x</span>
                </div>
            </div>
          </c:forEach>
		</div>
	</div>

    <footer class="tool_foot">
        <div class="container footer itme_detail_top">
            <div class="row footer-row">
                <div class="col-md-6 col-sm-6 col-xs-6 footer-col">
                    <button id="goback" class="btn btn-default a-btn" type="button">返回</button>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 footer-col">
                    <button id="newaddress_bt" class="btn btn-success a-btn" type="button" data-toggle="modal" data-target="#myModal">新增地址</button>
                </div>
            </div>
        </div>
    </footer>

	
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script type="text/javascript">
            $(document).ready(function() {
				//选择框
				$('input').iCheck({
					checkboxClass: 'icheckbox_square-red',
					radioClass: 'iradio_square-red',
					increaseArea: '20%' // optional
				});	
				//设置高度			
			    $(function(){
			    	$("#main_div").height($(window).height()-$("header").height()-52);
			    	$("#main_div").css({"overflow":"auto"});
			    });

                $("#goback").click(function(){
                	window.location.href='<%=request.getContextPath() %>'+
                    '/app/mobile/page/index?'+
                    'loadId=huiyuan';
                });
            });
        </script>
</body>
</html>