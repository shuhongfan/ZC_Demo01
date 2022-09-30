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
								<form method="post" class="card" action="<%=basePath%>members/update">
									<div class="card-header">
										<h3 class="card-title">资料更新/UPDATE PROFILE</h3>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label class="form-label">登录账号</label>
											<input type="text" class="form-control" readonly name="username" placeholder="" value="${edituser.username }">
										</div>
										<div class="form-group">
											<label class="form-label">性别</label>
											<input type="radio" <c:if test="${edituser.sex==1}">checked</c:if> class="" name="sex" value="1"> 男
											<input type="radio" <c:if test="${edituser.sex==0}">checked</c:if> class="" name="sex" value="0"> 女
											<input type="hidden" name="id" value="${edituser.id }"/>  
										</div>
										
										<div class="form-group">
											<label class="form-label">地址</label>
											<input type="text" class="form-control" name="address" placeholder="" value="${edituser.address }">
										</div>
										
										<div class="form-group">
											<label class="form-label">家庭住址</label>
											<input type="text" class="form-control" name="maincontent" placeholder="" value="${edituser.maincontent }">
										</div>
										
										<div class="form-group">
											<label class="form-label">电话</label>
											<input type="text" class="form-control" name="tel" placeholder="" value="${edituser.tel }">
										</div>
										<div class="form-group">
											<label class="form-label">QQ</label>
											<input type="text" class="form-control" name="qq" placeholder="" value="${edituser.qq }">
										</div>
										<div class="form-group">
											<label class="form-label">邮箱</label>
											<input type="text" class="form-control" name="email" placeholder="" value="${edituser.email }">
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
        		location.href = "<%=basePath%>members/profile?id=${id}";
    			},1000);
		</c:if>
	</script>
</body>

</html>
