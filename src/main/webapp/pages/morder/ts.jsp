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
    <td>提交人</td>
     <td>被投诉人</td>  
    <td>投诉众筹项目</td>    
    <td>投诉内容</td>
        
    <td>投诉时间</td>
    <td>状态</td>
    <td>操作</td>
    </tr>
    </thead>
    
    <tbody>
    
    <c:forEach items="${list}" var="item">
     <tr>
     <td>${item.m.username }</td>
     <td>${item.m1.username }</td>     
     <td>${item.p.product_name }</td>
     <td>${item.content }</td>
     
     <td>${item.created }</td>  
        
        <td>
        <c:if test="${item.status==1 }">
        	待处理
        </c:if>
        <c:if test="${item.status==2 }">
        <span class="label label-danger">已处理</span>
        </c:if>
         <c:if test="${item.status==3 }">
        <span class="label label-warning">已撤销</span>
        </c:if>
         
        </td>
     <td>   
      <c:if test="${item.status!=3 }">
    <a href="<%=basePath %>morder/morder/st?ret=ts&id=${item.id}&status=3">
    撤回投诉
    </a>
    </c:if>
        
     </td>
     </tr>
     
    </c:forEach>
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
        		location.href = "<%=basePath%>morder/morder/ts";
    			},1000);
		</c:if>
	</script>
</body>

</html>
