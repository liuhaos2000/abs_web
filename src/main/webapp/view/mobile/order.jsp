<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>订单确认</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body>
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
                                  <input type="text" class="form-control" id="inputPassword3" placeholder="请填写姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">电话：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input type="text" class="form-control" id="inputPassword3" placeholder="收件人电话">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">省份：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <select id="ad1" class="form-control">
                                        <option value="">请选择</option>
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
                                  <input type="text" class="form-control" id="inputEmail3" placeholder="详细地址">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left"></label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input type="checkbox"> 默认收货地址
                                </div>
                            </div>
                         </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                      <button id="save_bt" type="button" class="btn btn-primary">保存</button>
                    </div>
                </div>
            </div>
        </div>
   
   
   
    <!-- Modal End -->
    <div id="main_div" class="maindiv">
        <div class="container-fluid order-container">
            <div class="row-fluid">
                <div class="span12">
                    <div class="accordion" id="accordion-483788">
                        <div class="accordion-group ">
                            <div class="accordion-inner o-ad">
                                    <div class="row">
                                     <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-483788" href="#accordion-element-588573">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col">
                                            <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                        	<!-- 如果有地址 开始 -->
                                        	<c:choose>
   												<c:when test="${result.uadList.size()> 0}">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                                <p class="p-no-bottom order-ad-left">收件人:</p> 
                                                            </div>
                                                            <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                                <p class="p-no-bottom order-ad-right">${result.uadList[0].name}</p> 
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                                <p class="p-no-bottom order-ad-left ">地址:</p> 
                                                            </div>
                                                            <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                                <p class="p-no-bottom order-ad-right">
                                                                  ${result.uadList[0].regionName1}
                                                                  ${result.uadList[0].regionName2}
                                                                  ${result.uadList[0].regionName3}
                                                                  ${result.uadList[0].addressDetail}
                                                                </p> 
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                                <p class="p-no-bottom order-ad-left">电话:</p> 
                                                            </div>
                                                            <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                                <p class="p-no-bottom order-ad-left">
                                                                	${result.uadList[0].tel}
                                                                </p> 
                                                            </div>
                                                        </div>
                                                    </div>
   												</c:when>
   												<c:otherwise> 
   													<div class="container">
                                                		<div class="row">
                                                			<div class="col-md-12 col-sm-12 col-xs-12 new-ad">
                                                       			 <button class="btn btn-default btn-block btn-lg address-new" type="button" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增地址</button>
                                                    		</div>
                                                		</div>
                                                	</div>
   												</c:otherwise>
   											</c:choose>

                                            <!-- 如果有地址 结束 -->
                                        </div>
                                      </a>
                                    </div>
                            </div>
                            <div id="accordion-element-588573" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <div class="row od-ad-row">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col">
                                            <button class="btn btn-mini btn-default" type="button">改</button>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left">收件人:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">刘浩</p> 
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left ">地址:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">重庆市渝中区大坪石油路2号7栋1-3石油路2号7栋1-3</p> 
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left">电话:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">13800001111</p> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row od-ad-row">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col">
                                            <button class="btn btn-mini btn-default" type="button">改</button>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left">收件人:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">刘浩</p> 
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left ">地址:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">重庆市渝中区大坪石油路2号7栋1-3石油路2号7栋1-3</p> 
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left">电话:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">13800001111</p> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row od-ad-row">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col">
                                            <button class="btn btn-mini btn-default" type="button">改</button>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left">收件人:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">刘浩</p> 
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left ">地址:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">重庆市渝中区大坪石油路2号7栋1-3石油路2号7栋1-3</p> 
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                        <p class="p-no-bottom order-ad-left">电话:</p> 
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                        <p class="p-no-bottom order-ad-right">13800001111</p> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12 address-new-bt">
                                            <button class="btn btn-default btn-block address-new" type="button" data-toggle="modal" data-target="#myModal">新增地址</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-inner">
                                    <div class="row">
                                        <a class="accordion-toggle collapsed" 
                                                data-toggle="collapse" 
                                                data-parent="#accordion-483788" 
                                                href="#accordion-element-906172"
                                                aria-expanded="true">
                                            <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col-2">
                                                <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                            </div> 
                                            <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                                    <p class="p-no-bottom order-ad-left">购物清单</p>
                                                 </div>
                                        </a>
                                    </div>
                            </div>
                            <div id="accordion-element-906172" class="accordion-body collapse in">
                                <div class="accordion-inner">
                                	<c:forEach items="${result.itemlist}" var="item"  varStatus="status">
										<div class="row order-item-row">
                                        	<div class="col-md-3 col-sm-3 col-xs-3 cart-item-col">
                                          	  <img class="order-item-img" src="${item.path}" alt="">
                                       		</div>
                                        	<div class="col-md-9 col-sm-9 col-xs-9 cart-item-col">
                                         	  <p class="order-ad-right p-no-bottom">${item.item_name}_${item.guige_text}_${item.yanse_text}</p>
                                          	  <p class="cart_item_price p-no-bottom f-left">￥${item.sale_price}</p>
                                          	  <p class="order-ad-right p-no-bottom f-left">&nbsp;x&nbsp;${item.shuliang}个</p>
                                          	  <c:set var="heji" value="${heji+(item.sale_price*item.shuliang)}"></c:set>
                                       		 </div>
                                   	    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-inner">
                                    <div class="row">
                                      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-483788" href="#accordion-element-906173">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col-2">
                                            <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                            <div class="order-p">
                                                    <p class="p-no-bottom order-ad-left">送货方式：圆通快递(10.00元)</p>
                                            </div>
                                        </div>
                                      </a>  
                                    </div>
                            </div>
                            <div id="accordion-element-906173" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    功能块...
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-inner">
                                    <div class="row">
                                      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-483788" href="#accordion-element-906174">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col-2">
                                            <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                            <div class="order-p">
                                                    <p class="p-no-bottom order-ad-left">可用积分：20</p>
                                            </div>
                                        </div>
                                      </a>
                                    </div>
                            </div>
                            <div id="accordion-element-906174" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    功能块...
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <div class="row order-totle-row">
                                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <p class="p-no-bottom order-ad-left">商品总价：</p>
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2">100.00</div>
                                </div>
                                <div class="row  order-totle-row">
                                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                       <p class="p-no-bottom order-ad-left">运费：</p>
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2">100.00</div>
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
            <div class="row footer-row">
                <div class="col-md-6 col-sm-6 col-xs-6 footer-col">
                    <p class="foot-text">总价：<span id="total">0</span>元</p>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 footer-col">
                    <button id="zhifu_bt" class="btn btn-success a-btn" type="button">支付</button>
                </div>
            </div>
        </div>
    </footer>
   
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getRegion:'<%=request.getContextPath() %>/app/mobile/useradress/getAddressLevel1',
        getRegion2:'<%=request.getContextPath() %>/app/mobile/useradress/getAddressLevel2',
    };
$(document).ready(function() {
    //
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-red',
        radioClass: 'iradio_square-red',
        increaseArea: '20%' // optional
    });         
    //      
    $(function(){
        $("#main_div").height($(window).height()-52);
        $("#main_div").css({"overflow":"auto"});
        // 合计
        $("#total").html("${heji}");
    });
    //
    $("#queding").click(function(){
        location.href ="order_submit.html";
    });
	// 取一级地址
    $('#myModal').on('show.bs.modal', function (e) {
    	getRegion();
    })
    // 取二级地址
    $('#ad1').change(function(){
    	getRegion2($(this).val(),'ad2');
    })
        // 取二级地址
    $('#ad2').change(function(){
    	getRegion2($(this).val(),'ad3');
    })
});
function getRegion(){
    $.ajax({    
        url:UrlConfig.getRegion, 
        data:{},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	for (var i = 0; i < result.data.length; i++) {
            		$("#ad1").append('<option value="'+result.data[i].regionId+'">'+result.data[i].regionName+'</option>');
            	}
            }else{
            }
         }
    }); 
}
function getRegion2(parent,o){
    $.ajax({    
        url:UrlConfig.getRegion2, 
        data:{parent:parent},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	for (var i = 0; i < result.data.length; i++) {
            		$('#'+o).append('<option value="'+result.data[i].regionId+'">'+result.data[i].regionName+'</option>');
            	}
            }else{
            }
         }
    }); 
}
        </script>
</body>
</html>