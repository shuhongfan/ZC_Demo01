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
								<form method="post" class="card" action="<%=basePath%>members/rz1">
									<div class="card-header">
										<h3 class="card-title">认证资料</h3>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label class="form-label">登录账号</label>
											<input type="text" class="form-control" readonly name="username" placeholder="" value="${edituser.username }">
										</div>
										
										
										<div class="form-group">
											<label class="form-label">资料</label>
												<c:if test="${empty edituser.xx }">
										未上传
										</c:if>
										<c:if test="${not empty edituser.xx }">
										<a target="_blank" href="${edituser.xx }">查看</a>
										</c:if>
															 <c:if test="${usertype!=3}">							
											<input type="text"  class="form-control" id="thumb" value="${edituser.thumb }" name="xx" >											
												<a href="javascript:;" class="uploadImg ">点击上传</a>
											<input type="hidden" name="id" value="${edituser.id }"/>
											</c:if>
										</div>
										
										
										

										
										
									</div><div class="card-footer text-right">
										<div class="d-flex">
											 <c:if test="${usertype!=3}">
											<button type="submit" class="btn btn-primary ml-auto">提交数据</button>
											</c:if>
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
        		location.href = "<%=basePath%>members/rz?id=${id}";
    			},1000);
		</c:if>
	</script>
</body>

</html>
