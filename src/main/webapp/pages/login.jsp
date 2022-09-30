<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>众筹平台</title>
  <!-- base:css -->
  <link rel="stylesheet" href="<%=basePath %>static/theme/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="<%=basePath %>static/theme/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<%=basePath %>static/theme/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="<%=basePath %>static/theme/images/favicon.png" />
</head>

<body>
  <div class="container-scroller d-flex">
    <div class="container-fluid page-body-wrapper full-page-wrapper d-flex">
      <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
        <div class="row flex-grow">
          <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="auth-form-transparent text-left p-3">
              <div style="cursor:pointer;" onclick="javascript:location.href='<%=basePath %>';" class="brand-logo">
                <img src="<%=basePath %>static/theme/images/logo.svg" alt="logo">
              </div>
              <h4>Welcome back!</h4>
              <h6 class="font-weight-light">Happy to see you again!</h6>
              <form class="pt-3" action="<%=basePath%>manage/login" method="POST">
                <div class="form-group">
                  <label for="exampleInputEmail">账号</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="mdi mdi-account-outline text-primary"></i>
                      </span>
                    </div>
                    <input type="text" name="username" required class="form-control form-control-lg border-left-0" id="exampleInputEmail" placeholder="输入账号...">
                  </div>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword">口令</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="mdi mdi-lock-outline text-primary"></i>
                      </span>
                    </div>
                    <input name="password" required type="password" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="输入密码...">                        
                  </div>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input" checked>
                      记住我
                    </label>
                  </div>
                  
                </div>
                <div class="my-3">
                  <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" >登 录</button>
                </div>
                <div class="mb-2 d-flex">
                  <button onclick="javascript:location.href='<%=basePath%>';" type="button" class="btn btn-facebook auth-form-btn flex-grow mr-1">
                    <i class="mdi mdi-home mr-2"></i>平台首页
                  </button>
                  <button onclick="javascript:location.href='<%=basePath%>app/sign';" type="button" class="btn btn-google auth-form-btn flex-grow ml-1">
                    <i class="mdi mdi-plus mr-2"></i>注册账号
                  </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-6 login-half-bg d-none d-lg-flex flex-row">
            <p class="text-white font-weight-medium text-center flex-grow align-self-end">Copyright &copy; 2020  All rights reserved.</p>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="<%=basePath %>static/theme/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="<%=basePath %>static/theme/js/off-canvas.js"></script>
  <script src="<%=basePath %>static/theme/js/hoverable-collapse.js"></script>
  <script src="<%=basePath %>static/theme/js/template.js"></script>
  <!-- endinject -->
  
  
<link href="<%=basePath %>static/toastr-master/toastr.min.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath %>static/toastr-master/toastr.min.js"></script>	
		
		<script>
		toastr.options = {
				  "closeButton": false,
				  "debug": false,
				  "positionClass": "toast-top-left",
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "5000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
		<c:if test="${state==0}">
		toastr.error("${message}", "登录提醒");
		</c:if>

		<c:if test="${state==1}">
		toastr.success("${message}", "登录提醒");
		
		setTimeout(function () {
        		location.href = "<%=basePath%>manage/index";
    			},1000);
		</c:if>
	</script>
		
    
</body>

</html>
