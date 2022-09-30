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
    <TD>发布人</TD>
     <td>投资人</td>  
    <td>众筹项目名称</td>    
        
    <td>投资金额</td>    
    <td>投资时间</td>
    <td>状态</td>
    <td>操作</td>
    </tr>
    </thead>
    
    <tbody>
    
    <c:forEach items="${list}" var="item">
     <tr>
      <td>${item.saler }</td>
     <td>${item.buyer }</td>     
     <td>${item.pname }</td>
    
     <td>${item.total }</td>    
     <td>${item.created }</td>  
        
        <td>
        
        <c:if test="${item.type!=2 }">
        
        <c:if test="${item.step==1 }">
        <span class="label label-danger">待入账</span>
        </c:if>
         <c:if test="${item.step==2 }">
        <span class="label label-warning">已投资</span>
        </c:if>
       
        
        <c:if test="${item.step!=1&&item.step!=5 }">
        [${item.ordersn }]
        </c:if>
        </c:if>
        </td>
     <td>   
     <c:if test="${not empty item.p.skuid}">
      <c:if test="${item.status eq 1}">
     已放款
     </c:if>
        <c:if test="${item.status eq 2}">
     已退款
     </c:if>
       <c:if test="${empty item.status}">
     	<a href="<%=basePath%>morder/fk?id=${item.id}">项目结束，放款</a>
     	</c:if>
     </c:if>
    
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
        		location.href = "<%=basePath%>morder/list1";
    			},1000);
		</c:if>
	</script>
</body>

</html>
