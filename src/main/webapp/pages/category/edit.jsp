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
								
<form action="<%=basePath %>category/update" class="form" method="post" style="width:50%;">
   <input name="id" type="hidden" value="${model.id }"/>
            <fieldset>
                <div class="widget">
                    <div class="alert alert-info alert-dismissible">
                    
                    众筹项目分类</div>
                    <div class="formRow">
                        <label>分类名称:</label>
                        <div class="formRight">
                        	<input class="form-control" name="title" type="text" required value="${model.title }">
                        	
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <label>上级分类:</label>
                        <div class="formRight">
                        	 <select name="pid">
        <option <c:if test="${model.pid==0 }">selected</c:if> value="0">顶级分类</option>
         <c:forEach items="${requestScope.list }" var="u">
         <c:if test="${model.id!=u.id }">
         <option <c:if test="${model.pid==u.id }">selected</c:if> value="${u.id }">${u.title }</option>
         </c:if>
         </c:forEach>        	
        </select>                               	
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <label>封面:</label>
                        <div class="formRight">
                        		
										<c:if test="${not empty model.thumb }">
										<img  class="uploadImg " style="max-height:350px" src="<%=basePath%>${model.thumb}"/>
										</c:if>
                        		<input type="text"  class="form-control" id="thumb" value="${model.thumb }" name="thumb" >											
												<a href="javascript:;" class="uploadImg ">点击上传</a>
                        </div>
                        <div class="clear"></div>
                    </div>
                     
                    
                    <div class="formRow">
                        <label>分类描述:</label>
                        <div class="formRight">
                        	<textarea class="form-control" name="description" required>${model.description }</textarea>                        	                        	
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
        		location.href = "<%=basePath%>category/list";
    			},1000);
		</c:if>
	</script>
</body>

</html>
