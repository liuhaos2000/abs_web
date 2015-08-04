<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>分类</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/media.css">
</head>
<body>

        <div class="container typelist_main">
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>服装</p>
                    </a>
                </div>
            </div>
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>家用电器</p>
                    </a>
                </div>
            </div>
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>母婴用品</p>
                    </a>
                </div>
            </div>
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>电子产品</p>
                    </a>
                </div>
            </div>
        </div>
        


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
            $(document).ready(function() {
            	//
                $(".p2 a").click(function(e) {
                    e.preventDefault();
                    $('.popupshadow').show();
                    $('.popup').animate({
                        right: '0'
                    });
                });

                $(window).click(function() {
                    if ($('.popup').css('right') == '0px') {
                            $('.popupshadow').hide();
                        $('.popup').animate({
                            right: '-70%'
                        });
                    }
                });
            });
        </script>
</body>
</html>