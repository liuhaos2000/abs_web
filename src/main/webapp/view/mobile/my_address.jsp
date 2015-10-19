<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>收货地址管理</title>
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
        
    <header class="" role="navigation">
        <div class="container">
            <div class="row row-head">
                <div class="col-md-3 col-sm-3 col-xs-3 col-head">
                    <a class="head-back" href="javascript:history.back();"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 col-head">
                    <p class="row-head-text">地址管理</p>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3 col-head">
                    <a class="head-back" href="/abs_web"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                </div>
            </div>
        </div>
    </header>
	
	<div id="main_div">
	    <div id="adressdiv" class="container">
	      <c:forEach items="${result.uadList}" var="item" varStatus="status">
            <div class="row cart-item-row">
                <div class="col-md-2 col-sm-2 col-xs-2  cart-col-box cart-col-checkbox">
                    <button class="btn btn-mini btn-default" 
                        type="button"
                        name="upd_adress"
                        addressid="${item.address_id}"
                        adname="${item.name}"
                        ad1="${item.adname1}"
                        ad2="${item.adname2}"
                        ad3="${item.adname3}"
                        ad4="${item.address_detail}"
                        tel="${item.tel}">改</button>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10 cart-col-box cart-col-info">
                    <p class="adderss_name">收件人:${item.name}</p>
                    <p class="adderss_name">地址:${item.adname1}${item.adname2}${item.adname3}${item.address_detail}</p>
                    <p class="adderss_name">电话:${item.tel}</p>
                     <c:if test="${item.del_flg=='1'}">
                     	<span class="label label-info">默认</span>
                     </c:if>
                    <span class="btn-clipboard" addressid="${item.address_id}">x</span>
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
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getRegion:'<%=request.getContextPath() %>/app/mobile/useradress/getAddressLevel1',
        getRegion2:'<%=request.getContextPath() %>/app/mobile/useradress/getAddressLevel2',
        saveAd:'<%=request.getContextPath() %>/app/mobile/useradress/saveAddress',
        loadUpdAdress:'<%=request.getContextPath() %>/app/mobile/useradress/loadUpdAdress',
        deleteAddress:'<%=request.getContextPath() %>/app/mobile/useradress/deleteAddress'
};
//更新用
var modal;
var addressid;
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
    	//$("#main_div").height($(window).height()-52);
    	$("#main_div").css({"overflow":"auto"});
    	
    	bindEvent();
    });

    $("#goback").click(function(){
    	window.location.href='<%=request.getContextPath() %>'+
        '/app/mobile/page/index?'+
        'loadId=huiyuan';
    });
    
    $('#newaddress_bt').click(function(){
    	modal="ADD";
    	$('#delete_ad_bt').hide();
    	clearModal();
    });
    // 取二级地址
    $('#ad1').change(function(){
    	$('#ad2').html('<option  value="">请选择</option>');
    	$('#ad3').html('<option  value="">请选择</option>');
    	getRegion2($(this).val(),'ad2');
    });
    // 取三级地址
    $('#ad2').change(function(){
    	$('#ad3').html('<option  value="">请选择</option>');
    	getRegion2($(this).val(),'ad3');
    });
    //保存地址
    $('#save_bt').click(function(){
    	saveAddress();
    });
});

function clearModal(){
	$('#mailName').val("");
	$('#mailTel').val("");
	$('#ad4').val("");
	$('#ad2').html('<option  value="">请选择</option>');
	$('#ad3').html('<option  value="">请选择</option>');
	$('#morenFlg').iCheck('uncheck');
	$('#ad1 option:first').attr('selected','selected');
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
function saveAddress(){
	var checkflg;
	if($('#morenFlg').prop("checked")==true){
		checkflg='1';
	}else{
		checkflg='0';
	}
    $.ajax({
        url:UrlConfig.saveAd, 
        data:{regionName1:$('#ad1').val(),
        	  regionName2:$('#ad2').val(),
        	  regionName3:$('#ad3').val(),
        	  addressDetail:$('#ad4').val(),
        	  name:$('#mailName').val(),
        	  tel:$('#mailTel').val(),
        	  delFlg:checkflg,
        	  mode:modal,
        	  addressId:addressid},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	//刷新
            	refreshList(result.data.uadList);
                // 绑定单击事件
				bindEvent();
                // 关闭模态窗口
                $('#myModal').modal('hide');
            }else{
            	myalert(result.msg,'myModal');
            }
         }
    }); 
}
function deleteAddress(){
    $.ajax({    
        url:UrlConfig.deleteAddress, 
        data:{addressid:addressid},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	refreshList(result.data.uadList);
                // 绑定单击事件
				bindEvent();
                // 关闭模态窗口
                $('#myModal').modal('hide');
            }else{
            	myalert(result.msg,'myModal');
            }
         }
    });
}
function loadUpdAddress(addressid){
    $.ajax({    
        url:UrlConfig.loadUpdAdress, 
        data:{addressid:addressid},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	var userAddress = result.data.userAddress;
            	
            	$('#ad1').val(userAddress.regionName1);
            	//$('#ad2').val(userAddress.regionName2);
            	//$('#ad3').val(userAddress.regionName3);
            	$('#ad4').val(userAddress.addressDetail);
            	$('#mailName').val(userAddress.name);
            	$('#mailTel').val(userAddress.tel);
            	
            	var region2 = result.data.region2;
            	var region3 = result.data.region3;
            	//二级地址
            	for (var i = 0; i < region2.length; i++) {
            		$("#ad2").append('<option value="'+region2[i].regionId+'">'+region2[i].regionName+'</option>');
            	}
            	$('#ad2').val(userAddress.regionName2);
            	// 三级地址
            	for (var i = 0; i < region3.length; i++) {
            		$("#ad3").append('<option value="'+region3[i].regionId+'">'+region3[i].regionName+'</option>');
            	}
            	$('#ad3').val(userAddress.regionName3);
            	// 默认
            	if(userAddress.delFlg=='1'){
            		$('#morenFlg').iCheck('check');
            	}else{
            		$('#morenFlg').iCheck('uncheck');
            	}
            }else{
            	myalert(result.msg,'myModal');
            }
         }
    }); 
}

function bindEvent(){
    $('button[name="upd_adress"]').bind("click",function(){
    	modal="UPD";
    	$('#delete_ad_bt').hide();
    	addressid=$(this).attr("addressid");
    	loadUpdAddress($(this).attr("addressid"));
    	$('#myModal').modal('show');
    	
    });
    $('.btn-clipboard').bind("click",function(){
    	addressid=$(this).attr("addressid");
    	deleteAddress();
    });
    
}
function refreshList(list){
	$('#adressdiv').html('');
	for(var i=0;i<list.length;i++){
		if(list[i].del_flg=="1"){
			$('#adressdiv').append(
		            '<div class="row cart-item-row">                                                                              '+
		            '    <div class="col-md-2 col-sm-2 col-xs-2  cart-col-box cart-col-checkbox">                                 '+
		            '        <button class="btn btn-mini btn-default"                                                             '+
		            '            type="button"                                                                                    '+
		            '            name="upd_adress"                                                                                '+
		            '            addressid="'+list[i].address_id+'"                                                                   '+
		            '            adname="'+list[i].name+'"                                                                            '+
		            '            ad1="'+list[i].adname1+'"                                                                            '+
		            '            ad2="'+list[i].adname2+'"                                                                            '+
		            '            ad3="'+list[i].adname3+'"                                                                            '+
		            '            ad4="'+list[i].address_detail+'"                                                                     '+
		            '            tel="'+list[i].tel+'">改</button>                                                                    '+
		            '    </div>                                                                                                   '+
		            '    <div class="col-md-10 col-sm-10 col-xs-10 cart-col-box cart-col-info">                                   '+
		            '        <p class="adderss_name">收件人:'+list[i].name+'</p>                                                      '+
		            '        <p class="adderss_name">地址:'+list[i].adname1+''+list[i].adname2+''+list[i].adname3+''+list[i].address_detail+'</p> '+
		            '        <p class="adderss_name">电话:'+list[i].tel+'</p>                                                         '+
		            '         <span class="label label-info">默认</span>                                                        '+
		            '        <span class="btn-clipboard" addressid="'+list[i].address_id+'">x</span>                                  '+
		            '    </div>                                                                                                   '+
		            '</div>                                                                                                       '
			

			);
		}else{
			$('#adressdiv').append(
		            '<div class="row cart-item-row">                                                                              '+
		            '    <div class="col-md-2 col-sm-2 col-xs-2  cart-col-box cart-col-checkbox">                                 '+
		            '        <button class="btn btn-mini btn-default"                                                             '+
		            '            type="button"                                                                                    '+
		            '            name="upd_adress"                                                                                '+
		            '            addressid="'+list[i].address_id+'"                                                                   '+
		            '            adname="'+list[i].name+'"                                                                            '+
		            '            ad1="'+list[i].adname1+'"                                                                            '+
		            '            ad2="'+list[i].adname2+'"                                                                            '+
		            '            ad3="'+list[i].adname3+'"                                                                            '+
		            '            ad4="'+list[i].address_detail+'"                                                                     '+
		            '            tel="'+list[i].tel+'">改</button>                                                                    '+
		            '    </div>                                                                                                   '+
		            '    <div class="col-md-10 col-sm-10 col-xs-10 cart-col-box cart-col-info">                                   '+
		            '        <p class="adderss_name">收件人:'+list[i].name+'</p>                                                      '+
		            '        <p class="adderss_name">地址:'+list[i].adname1+''+list[i].adname2+''+list[i].adname3+''+list[i].address_detail+'</p> '+
		            '        <p class="adderss_name">电话:'+list[i].tel+'</p>                                                         '+
		            '        <span class="btn-clipboard" addressid="'+list[i].address_id+'">x</span>                                  '+
		            '    </div>                                                                                                   '+
		            '</div>                                                                                                       '
			

			);
		}
	}
}
</script>
</body>
</html>