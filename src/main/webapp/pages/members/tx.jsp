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
								<div id="pay" style="display:none">
								<img style="display:block;width:200px;margin:0 auto" src="<%=basePath%>static/zfb.png">
								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin:auto;background:#fff;display:block;" width="200px" height="200px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
<path fill="none" stroke="#e90c59" stroke-width="8" stroke-dasharray="42.76482137044271 42.76482137044271" d="M24.3 30C11.4 30 5 43.3 5 50s6.4 20 19.3 20c19.3 0 32.1-40 51.4-40 C88.6 30 95 43.3 95 50s-6.4 20-19.3 20C56.4 70 43.6 30 24.3 30z" stroke-linecap="round" style="transform:scale(0.8);transform-origin:50px 50px">
  <animate attributeName="stroke-dashoffset" repeatCount="indefinite" dur="1s" keyTimes="0;1" values="0;256.58892822265625"></animate>
</path>
</svg>
<p style="text-align:center;">支付宝支付中</p>
</div>
								
								<form id="form" method="post" class="card" action="<%=basePath%>members/tx1">
									<div class="card-header">
										<h3 class="card-title">我的钱包</h3>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label class="form-label">登录账号</label>
											<input type="text" class="form-control" readonly name="username" placeholder="" value="${edituser.username }">
										</div>
										
										
										<div class="form-group">
											<label class="form-label">钱包余额</label>
											<span style="color:#c00;font-size:25px;">
											<b>￥
											${edituser.money }
											</b>
											</span>
											<input type="hidden" name="id" value="${edituser.id }"/>
										</div>
										
										<div class="form-group">
											<label class="form-label">提现金额</label>
										<input type="number" required class="form-control"  name="amount" placeholder="" value="100">											
										</div>
										
										
										

										
										
									</div><div class="card-footer text-right">
										<div class="d-flex">
											
											<button type="submit"  class="btn btn-primary ml-auto">马上提现</button>
											<a class="  btn" href="<%=basePath%>members/charge">充值</a>
										</div>
									</div>
									
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
        		location.href = "<%=basePath%>members/charge?id=${id}";
    			},1000);
		</c:if>
		
		function pay()
		{
			$("#form").fadeOut();
			$("#pay").fadeIn();
			setTimeout(function(){
				
				$("#form").submit()
				
			},1500);
		}
	</script>
</body>

</html>
