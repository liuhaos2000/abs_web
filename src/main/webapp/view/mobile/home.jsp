<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
            <i class="icon-spinner icon-spin icon-4x "></i> 
        </div>
    <div class="container pic_show">
        <div id="owl-demo1" class="owl-carousel owl-theme">
        </div>
    </div>
<div class="container today_miaosha">
        <div class="panel panel-default">
            <div class="panel-heading">特价商品</div>
            <div class="panel-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                <p class="daojishi_price">￥198.00</p>
                                <p id="djs1" class="daojishi" data-date="june 18,2016 20:30:30">
                                    <span class="hour">00</span>
                                    :
                                    <span class="min">00</span>
                                    :
                                    <span class="sec">00</span>
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                <p class="daojishi_price">￥456.00</p>
                                <p id="djs2" class="daojishi" data-date="june 18,2016 23:20:41">
                                    <span class="hour">00</span>
                                    :
                                    <span class="min">00</span>
                                    :
                                    <span class="sec">00</span>
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms3.png">
                                <p class="daojishi_price">￥173.00</p>
                                <p id="djs3" class="daojishi" data-date="june 18,2016 00:00:03">
                                    <span class="hour">00</span>
                                    :
                                    <span class="min">00</span>
                                    :
                                    <span class="sec">00</span>
                                </p>
                            </a>
                        </div>
                    </div>
                                        <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                <p class="daojishi_price">￥198.00</p>
                                <p id="djs4" class="daojishi" data-date="june 18,2016 20:30:30">
                                    <span class="hour">00</span>
                                    :
                                    <span class="min">00</span>
                                    :
                                    <span class="sec">00</span>
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                <p class="daojishi_price">￥456.00</p>
                                <p id="djs5" class="daojishi" data-date="june 18,2016 23:20:41">
                                    <span class="hour">00</span>
                                    :
                                    <span class="min">00</span>
                                    :
                                    <span class="sec">00</span>
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms3.png">
                                <p class="daojishi_price">￥173.00</p>
                                <p id="djs6" class="daojishi" data-date="june 18,2016 00:00:03">
                                    <span class="hour">00</span>
                                    :
                                    <span class="min">00</span>
                                    :
                                    <span class="sec">00</span>
                                </p>
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
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                <p class="daojishi_price">￥198.00</p>
                                <p>
                                    销量：10234
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                <p class="daojishi_price">￥456.00</p>
                                <p>
                                    销量：10234
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms3.png">
                                <p class="daojishi_price">￥173.00</p>
                                <p>
                                    销量：10234
                                </p>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms1.png">
                                <p class="daojishi_price">￥198.00</p>
                                <p>
                                    销量：10234
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms2.png">
                                <p class="daojishi_price">￥456.00</p>
                                <p>
                                    销量：10234
                                </p>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 daojishi_body">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/resources/images/ms3.png">
                                <p class="daojishi_price">￥173.00</p>
                                <p>
                                    销量：10234
                                </p>
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
            }else{
                
            }
         }
    }); 
}
</script>
</body>
</html>