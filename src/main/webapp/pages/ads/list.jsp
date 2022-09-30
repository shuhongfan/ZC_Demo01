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
								
								
								<a href="<%=basePath%>ads/add" class="btn btn-primary">上传海报图</a>
								<br>
								<h1></h1>
								
								<table class="table card-table table-vcenter text-nowrap ">
											<thead class=" ">
												
    <tr>
    <td>编号</td>    
    <td>名称</td>
    <td>URL</td>
    <td>图片</td>
    <td>添加时间</td>
    <td>操作</td>
    </tr>
    </thead>
    
    <tbody>
    
    <c:forEach items="${list}" var="item">
     <tr>
     <td>${item.id }</td>     
     <td>${item.title }</td>
     <td>${item.url }</td>
     <td>
     <a href="<%=basePath%>${item.thumb }" target="_blank">
     	查看
     </a>
     </td>
     <td>${item.created }</td>     
     <td>   
     <a class="btn btn-success" href="<%=basePath%>ads/edit?id=${item.id }">
     	更新     	
     </a>    
     <a class="btn btn-danger" href="<%=basePath%>ads/delete?id=${item.id }">
     	删除     	
     </a>
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
        		location.href = "<%=basePath%>ads/list";
    			},1000);
		</c:if>
	</script>
</body>

</html>
