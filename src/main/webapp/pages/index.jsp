<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.app.utils.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>JAVA 众筹平台</title>
  <!-- base:css -->
  <link rel="stylesheet" href="<%=basePath %>static/theme/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="<%=basePath %>static/theme/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<%=basePath %>static/theme/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
  <div class="container-scroller d-flex">
    <!-- partial:./partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
      <ul class="nav">
        <li class="nav-item sidebar-category">
          <p>Navigation</p>
          <span></span>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.html">
            <i class="mdi mdi-view-quilt menu-icon"></i>
            <span class="menu-title">个人中心</span>
            <div class="badge badge-info badge-pill">Hi</div>
          </a>
        </li>
        <li class="nav-item sidebar-category">
          <p>用户菜单</p>
          <span></span>
        </li>
        
           <c:if test="${usertype==1}">
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi  mdi-chart-pie menu-icon"></i>
            <span class="menu-title">众筹项目</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic2">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>products/my">众筹项目管理</a></li>
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>products/add">新增众筹项目</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a  target="mainframe" href="<%=basePath%>morder/my"
          class="nav-link" >
            <i class="mdi mdi-file-document-box-outline menu-icon"></i>
            <span class="menu-title">投资管理</span>
          </a>
        </li>
          <li class="nav-item">
          <a  target="mainframe" href="<%=basePath%>fav/list"
          class="nav-link" >
            <i class="mdi mdi-file-document-box-outline menu-icon"></i>
            <span class="menu-title">我的关注</span>
          </a>
        </li>
        </c:if>
        
        
         <c:if test="${usertype==3}">
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi mdi-palette menu-icon"></i>
            <span class="menu-title">用户管理</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>members/customer">用户管理</a></li>
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>members/add">新增用户</a></li>
            </ul>
          </div>
        </li>
        
        
         <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi mdi-view-headline menu-icon"></i>
            <span class="menu-title">项目分类</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic1">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>category/list">分类管理</a></li>
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>category/add">新增分类</a></li>
            </ul>
          </div>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi  mdi-chart-pie menu-icon"></i>
            <span class="menu-title">众筹项目</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic2">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>products/list">项目管理</a></li>
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>products/add">发布项目</a></li>
            </ul>
          </div>
        </li>
        
        <li class="nav-item">
          <a  target="mainframe" href="<%=basePath%>morder/list"
          class="nav-link" >
            <i class="mdi mdi-file-document-box-outline menu-icon"></i>
            <span class="menu-title">投资管理</span>
          </a>
        </li>
         <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic2X1" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi  mdi-chart-pie menu-icon"></i>
            <span class="menu-title">财务管理</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic2X1">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>morder/list1">放款管理</a></li>
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>morder/list2">退款管理</a></li>
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>morder/list3">回报管理</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a  target="mainframe" href="<%=basePath%>morder/report"
          class="nav-link" >
            <i class="mdi mdi-file-document-box-outline menu-icon"></i>
            <span class="menu-title">统计管理</span>
          </a>
        </li>
        
          <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic21" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi  mdi-grid-large menu-icon"></i>
            <span class="menu-title">众筹海报</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic21">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>ads/list">海报管理</a></li>
              <li class="nav-item"> <a class="nav-link"  target="mainframe" href="<%=basePath%>ads/add">上传AD</a></li>
            </ul>
          </div>
        </li>
        
        <li class="nav-item">
          <a  target="mainframe" href="<%=basePath%>setting/index"
          class="nav-link" >
            <i class="mdi mdi-file-document-box-outline menu-icon"></i>
            <span class="menu-title">系统设置</span>
          </a>
        </li>
        </c:if>
        
      </ul>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:./partials/_navbar.html -->
      <nav style="height:auto" class="navbar col-lg-12 col-12 px-0 py-0 py-lg-4 d-flex flex-row">
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="navbar-brand-wrapper">
            <a class="navbar-brand brand-logo" href="index.html"><img src="<%=basePath %>static/theme/images/logo.svg" alt="logo"/></a>
            
          </div>
          <h4 class="font-weight-bold mb-0 d-none d-md-block mt-1">
          Welcome back, ${username } -_-   Today is  <%=MainUtils.getTime() %> </h4>
          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item">
              <h4 class="mb-0 font-weight-bold d-none d-xl-block">
          
              </h4>
            </li>
            
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
        <div style="background:none;position:absolute;top:0px;right:0px" class="navbar-menu-wrapper navbar-search-wrapper d-none d-lg-flex align-items-center">
          <ul class="navbar-nav mr-lg-2">
            <li class="nav-item nav-search d-none d-lg-block">
            
            </li>
          </ul>
          <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item ">
           <a style="background:rgba(0,0,0,.3);padding:10px;" 
           class="nav-link " href="<%=basePath %>">                
                <span  style="color:#fff" class="nav-profile-name">平台首页</span>
              </a>
          </li>
            <li class="nav-item nav-profile dropdown">
              <a style="background:rgba(0,0,0,.3);padding:10px;" class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                <img src="<%=basePath%>${avatar }" alt="profile"/>
                <span  style="color:#fff" class="nav-profile-name">登录用户：${username } !</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              
              <a target="mainframe" href="<%=basePath%>members/charge" class="dropdown-item">
                  <i class="mdi mdi-file text-primary"></i>
                 钱包充值
                </a>
              
                <a target="mainframe" href="<%=basePath%>members/profile" class="dropdown-item">
                  <i class="mdi mdi-settings text-primary"></i>
                 资料更新
                </a>
                <a target="mainframe" href="<%=basePath%>members/password" class="dropdown-item">
                  <i class="mdi mdi-plus text-primary"></i>
                密码设置
                </a>
                <a target="mainframe" href="<%=basePath%>members/avatar" class="dropdown-item">
                  <i class="mdi mdi-emoticon text-primary"></i>
                 头像上传
                </a>
                <a href="<%=basePath%>manage/quit" class="dropdown-item">
                  <i class="mdi mdi-logout text-primary"></i>
                  安全退出
                </a>
              </div>
            </li>
            
          </ul>
        </div>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 col-xl-12 grid-margin stretch-card">
              <iframe name="mainframe" src="" style="border:none;min-height:1800px;width:100%;height:100;"></iframe>
              </div>
              </div>
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- base:js -->
  <script src="<%=basePath %>static/theme/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="<%=basePath %>static/theme/vendors/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="<%=basePath %>static/theme/js/off-canvas.js"></script>
  <script src="<%=basePath %>static/theme/js/hoverable-collapse.js"></script>
  <script src="<%=basePath %>static/theme/js/template.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <script src="<%=basePath %>static/theme/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>

</html>