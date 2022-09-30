<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
  
                    
        
        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>


<link href="<%=basePath %>static/toastr-master/toastr.min.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath %>static/toastr-master/toastr.min.js"></script>	
	<script>
<c:if test="${not empty message}">
toastr.success("${message}", "操作提醒");
setTimeout(function(){
	location.href="<%=basePath %>app/index"
}, 1500)
</c:if>
</script>
		
		