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
								<table class="table card-table table-vcenter text-nowrap ">
											<thead class=" ">
												<tr>
													<th class="">#</th>
													<th class="">登录账号</th>
													<th class="">性别</th>													
													<th class="">地址</th>
													<th class="">电话</th>
													<th class="">邮箱</th>	
													<th class="">审核</th>
													<th class="">操作</th>
												</tr>
											</thead>
											<tbody>
											 <c:forEach items="${list}" var="item">
												<tr>
													<th scope="row">
													<img class="img-crcle" style="width:35px;height:35px;border-radius:10px" src="<%=basePath %>${item.thumb}">
													</th><td>${item.username }</td>
													<td>
													<c:if test="${item.sex==0}">
													<i class="fe fe-female"></i> 女
													</c:if>
													<c:if test="${item.sex==1}">
													<i class="fe fe-male"></i> 男
													</c:if>																			
													</td>
													
													<td>${item.address }
													</td>
													<td>${item.tel }</td>
													<td>${item.email }</td>													
													
													<td>
													<c:if test="${item.status!=1}">
													<span class="badge badge-danger">未审核</span>
													</c:if>
													<c:if test="${item.status==1}">
													<span class="badge badge-primary">已审核</span>
													</c:if>
													</td>
													<td>
													<c:if test="${item.status!=1}">
													<a class="btn btn-success" href="<%=basePath%>members/pass?status=1&id=${item.id}">通过</a>
													
													</c:if>
													<c:if test="${item.status==1}">
													<a class="btn btn-danger" href="<%=basePath%>members/pass?status=0&id=${item.id}">不通过</a>
													</c:if>
													<a class="btn btn-success" href="<%=basePath%>members/rz?id=${item.id}">认证</a>
													<a class="btn btn-success" href="<%=basePath%>members/profile?id=${item.id}">资料</a>
													<a class="btn btn-success" href="<%=basePath%>members/password?id=${item.id}">密码</a>
													<a class="btn btn-danger confirm" href="<%=basePath%>members/delete?id=${item.id}">删除</a>
													</td>
												</tr>
												</c:forEach>
												
											</tbody>
										</table>
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
        		location.href = "<%=basePath%>members/customer";
    			},1000);
		</c:if>
	</script>
</body>

</html>
