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
								<form method="post" class="card" action="<%=basePath%>setting/update2">
									<div class="card-header">
										<h3 class="card-title">站点信息/SETTINGS</h3>
									</div>
									<div class="card-body">
									
									
										<div class="form-group">
											<label class="form-label">系统名称</label>
											<input type="text" class="form-control"  name="title" placeholder="" value="${cfg.title }">
										</div>
										<div class="row">
										<div class="col-md-6">
									<div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">管理员 </label>
                                    <div class="col-sm-9">
                                        <input name="master" type="text" class="form-control  "  value="${cfg.master }">
                                    </div>
                                </div>
                                </div><div class="col-md-6">
                               <div class="form-group">
                                    <label class="col-sm-3 
                                    control-label no-padding-right" for="form-field-1">版权 </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="copyright" class="form-control  " value="${cfg.copyright }" placeholder="copy rights">
                                    </div>
                                </div> </div>
                                  </div>
                                  
                                  <div class="row">
										<div class="col-md-6">
                                  
                               <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">地址 </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="address" class="form-control  " value="${cfg.address }" placeholder="address">
                                    </div>
                                </div>
 </div><div class="col-md-6">
                               <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">传真 </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="facebook" class="form-control  " value="${cfg.facebook }" placeholder="facebook">
                                    </div>
                                </div>
                                 </div> </div>
                                
                                
<div class="row">
										<div class="col-md-6">
                               <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">电话 </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="tel" class="form-control  " value="${cfg.tel }" placeholder="tel">
                                    </div>
                                </div>
 </div><div class="col-md-6">
                               <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">邮箱 </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="email" class="form-control  " value="${cfg.email }" placeholder="email">
                                    </div>
                                </div> </div> </div>


<div class="row">
										<div class="col-md-6">
                               <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">网址 </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="url" class="form-control  " value="${cfg.url }" placeholder="url">
                                    </div>
                                </div>
 </div><div class="col-md-6">
                               <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">访问量 </label>
                                    <div class="col-sm-9">
                                        <input type="number" readonly class="form-control  " value="${cfg.count }" placeholder="visit">
                                    </div>
                                </div> </div> </div>


<div class="form-group">
											<label class="form-label">关键字 <span class="form-label-small ml-3">KEYWORDS</span></label>
											<textarea class="form-control" name="keywords" rows="2" placeholder="...">${cfg.keywords }</textarea>
										</div>
										
										<div class="form-group">
											<label class="form-label">描述 <span class="form-label-small ml-3">DESCRIPTION</span></label>
											<textarea class="form-control" name="description" rows="3" placeholder="...">${cfg.description }</textarea>
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
        		location.href = "<%=basePath%>setting/index";
    			},1000);
		</c:if>
	</script>
</body>

</html>
