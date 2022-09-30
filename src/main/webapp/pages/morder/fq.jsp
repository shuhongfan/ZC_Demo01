<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">

	<title>--</title>

	<link rel="preconnect" href="//fonts.gstatic.com/" crossorigin="">

	<!-- PICK ONE OF THE STYLES BELOW -->
	<link href="<%=basePath%>appstack/css/classic.css" rel="stylesheet">
	<!-- <link href="css/corporate.css" rel="stylesheet"> -->
	<!-- <link href="css/modern.css" rel="stylesheet"> -->

	<!-- BEGIN SETTINGS -->
	<!-- You can remove this after picking a style -->
	<style>
		body {
			opacity: 1;
		}
		.pay{border:1px solid #fff;padding:16px;}
		.pay:hover,.pay.active{border:1px solid #c00;}
	</style>
	
	</head>

<body>
	<div class="wrapper">
	

		<div class="main">
			

			<main class="contvent ">
				<div class="container-fluid p-0">

					

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									
								</div>
								<div class="card-body">
								<div class="col-lg-6">
								
<form action="<%=basePath %>morder/state2" class="form" method="get" style="width:50%;">
   <input name="id" type="hidden" value="${model.id }"/>
   <input name="ordersn" id="ordersn" type="hidden" value="支付宝支付"/>
   <input name="step" type="hidden" value="2"/>
   <input name="ret" type="hidden" value="my"/>
            <fieldset>
                <div class="widget">
                    <div class="alert alert-info alert-dismissible">
                    
                  在线支付</div>
                    <div class="formRow">
                        <label>支付方式:</label>
                        <div class="formRight">
                        	<a href="javascript:;" class="pay" data="支付宝">
                        	<img src="<%=basePath %>ui/1.jpg" style="width:80px;height:45px;">
                        	</a>  
                        	<a href="javascript:;" class="pay" data="微信支付">
                        	<img src="<%=basePath %>ui/2.jpg" style="width:80px;height:45px;">
                        	</a>
                        	<a href="javascript:;" class="pay" data="银联支付">
                        	<img src="<%=basePath %>ui/3.jpg" style="width:80px;height:45px;">
                        	</a>                      	
                        </div>
                        <div class="clear"></div>
                    </div>
                     
                  
                    <div class="formRow">
                 
                    <br/>
                    <input type="submit" value="提交数据" class="btn btn-primary ">
                    </div>
                </div>
            </fieldset>
            
         
        </form>
								</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			
		</div>
	</div>

	<script src="<%=basePath%>appstack/js\app.js"></script>
	
	<script src="<%=basePath%>scripts/window.js"></script>
   <script>
$().ready(function(){
	$(".uploadImg").click(function(){
		openWindow("<%=basePath%>upload.jsp");
	});
	$("#thumb").on("input",function(){
		$(".oldImg").attr("src","<%=basePath%>"+$("#thumb").val());
	});
});
</script>
	
<script>
		<c:if test="${not empty message}">
		toastr["success"]("${message}", "操作提醒", {
			positionClass : "toast-top-center",
			closeButton : true,
			progressBar : true,
			newestOnTop : true,
			rtl : $("body").attr("dir") === "rtl"
					|| $("html").attr("dir") === "rtl",
			timeOut : 5000
		});
		
		setTimeout(function () {
        		location.href = "<%=basePath%>ads/list";
    			},1000);
		</c:if>
	</script>
	<script>
	
	$(".pay").click(function(){
		$(".pay").removeClass("active");
		$(this).addClass("active")
		$("#ordersn").val($(this).attr("data"));
	})
	
	</script>
	
</body>

</html>
