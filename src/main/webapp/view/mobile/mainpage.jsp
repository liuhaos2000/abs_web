<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/mobile.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery.easyui.mobile.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/slides/slides.jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/slides/slides.min.jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/main.css">
<title>主页</title>
</head>
<body>
    <div class="easyui-navpanel">
        <header>
            <div class="m-toolbar">
                <div class="m-title">Devices</div>
            </div>
        </header>
        <div class="easyui-tabs" data-options="tabHeight:60,fit:true,tabPosition:'bottom',border:false,pill:true,narrow:true,justified:true">
            <div style="padding:10px">
                <div class="panel-header tt-inner">
                    <img src='<%=request.getContextPath() %>/resources/images/modem.png'/><br>Modem
                </div>
                <div id="slides">  
                    <img src="http://placehold.it/940x528">  
                    <img src="http://placehold.it/940x528">  
                </div>    
            </div>
            <div style="padding:10px">
                <div class="panel-header tt-inner">
                    <img src='<%=request.getContextPath() %>/resources/images/scanner.png'/><br>Scanner
                </div>
                <p>In computing, an image scanner—often abbreviated to just scanner—is a device that optically scans images, printed text, handwriting, or an object, and converts it to a digital image.</p>
            </div>
            <div style="padding:10px">
                <div class="panel-header tt-inner">
                    <img src='<%=request.getContextPath() %>/resources/images/pda.png'/><br>Pda
                </div>
                <p>A personal digital assistant (PDA), also known as a palmtop computer, or personal data assistant, is a mobile device that functions as a personal information manager. PDAs are largely considered obsolete with the widespread adoption of smartphones.</p>
            </div>
            <div style="padding:10px">
                <div class="panel-header tt-inner">
                    <img src='<%=request.getContextPath() %>/resources/images/tablet.png'/><br>Pda
                </div>
                <p>A tablet computer, or simply tablet, is a one-piece mobile computer. Devices typically have a touchscreen, with finger or stylus gestures replacing the conventional computer mouse.</p>
            </div>
        </div>
    </div>
    <style scoped>
       .tt-inner{
            display:inline-block;
            line-height:12px;
            padding-top:5px;
        }
        p{
            line-height:150%;
        }
    </style>
    <script>
        $(function(){
        	$("#slides").slides({ width: 400, height: 300 });  
        });
    </script>
</body> 
</html>