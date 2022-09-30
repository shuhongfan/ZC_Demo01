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
								<form method="post" class="card" action="<%=basePath%>members/update1">
									<div class="card-header">
										<h3 class="card-title">更改密码/UPDATE PASSWORD</h3>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label class="form-label">登录账号</label>
											<input type="text" class="form-control" readonly name="username" placeholder="" value="${edituser.username }">
										</div>
										
										
										<div class="form-group">
											<label class="form-label">新密码</label>
											<input required type="password" class="form-control" name="password" placeholder="" value="${edituser.password }">
											<input type="hidden" name="id" value="${edituser.id }"/>
										</div>
										
										<div class="form-group">
											<label class="form-label">再次输入新密码</label>
											<input required type="password" class="form-control" name="password2" placeholder="" value="${edituser.password }">
										</div>
										
										

										
										
									</div>
									<div class="card-footer text-right">
										<div class="d-flex">
											
											<button type="submit" class="btn btn-primary ml-auto">提交数据</button>
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
        		location.href = "<%=basePath%>members/password?id=${id}";
    			},1000);
		</c:if>
	</script>
</body>

</html>
