<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="zxx">

<head>
	<meta charset="utf-8">

	<title>${site.title }</title>
	<meta name="description" content="">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta content="telephone=no" name="format-detection">
	
	<!-- Template Basic Images Start -->
	<meta property="og:image" content="path/to/image.jpg">
	<link rel="icon" href="img/favicon/favicon.ico">
	<!-- Template Basic Images End -->
	
	<!-- Custom Browsers Color Start -->
	<meta name="theme-color" content="#000">
	<!-- Custom Browsers Color End -->

	<!--[if lt IE 9 ]>
		<script src="/assets/js/separate-js/html5shiv-3.7.2.min.js" type="text/javascript"></script><meta content="no" http-equiv="imagetoolbar">
	<![endif]-->
	

	<link rel="stylesheet" href="<%=basePath %>static/ui/css/main.min.css">
	
	
	<style>
	.header .page-header h1.page-header__heading{
	color:rgb(255, 102, 0)
	}
	</style>
	
</head>

<body>

	<!-- Header start -->
	<header class="header header-default">
		<div class=" p-0 ">
			<!-- Header Top Part-->
			<div class="header-top d-none d-lg-flex has-border-bottom"> 
				<div class="container p-0 d-flex flex-row justify-content-between">

					<!-- Left Side -->
					<div class="d-flex align-items-stretch side__left">

						<div class="header-contact-info__container">
							<div class="header-contact-info">
								<i class="icon-call-in"></i><span>服务热线</span><a href="#" class="phone">${site.tel }</a>
							</div>
							<div class="header-contact-info">
								<i class="icon-envelope-open"></i><span>邮箱</span><a href="#" class="email">${site.email }</a>
							</div>
						</div>

					</div>

					<!-- Righr Side -->
					<div class="d-flex side__right">
						<div class="header-item">

							<ul class="lang-wrapper">
							 <c:if test="${empty username }">
								<li class="lang__item">
									<a class="lang__link active" href="<%=basePath%>manage/index">登录</a>
								</li>
								<li class="lang__item">
									<a class="lang__link" href="<%=basePath%>app/sign">注册</a>
								</li>
								</c:if>
							</ul>
							
						</div>
                        	<a href="<%=basePath %>manage/index" class="btn accent d-none d-lg-flex">
                        	个人中心</a>
                        
					</div>
				</div>
			</div>
		</div>

		<!-- Header Bottom Part -->
		<div class="header-bottom">
			<nav class="navbar navbar-light navbar-expand-lg">
				<div class="container p-0">

					<a class="d-flex flex-row align-items-center navbar-brand " href="index.html">
						<img class="header-logo__img" src="<%=basePath %>static/ui/img/_src/logo-b.png" alt="logo" />	
					</a>

					<button data-toggle="collapse" data-target="#main-navigation" class="navbar-toggler">
						<span class="sr-only">Toggle navigation</span>
						<span class="navbar-toggler-icon"></span>
					</button>
					
					<div class="collapse navbar-collapse" id="main-navigation">

						<ul class="nav navbar-nav on-light ml-auto">
							<li class="nav-item ">
								<a class="nav-link  active"  href="<%=basePath%>">首页</a>
								
							</li>
							<c:forEach items="${cates}" var="item" varStatus="s">
                            	
                                        	<li class="nav-item">
                                            	<a class="nav-link " href="<%=basePath%>app/categoies?id=${item.id}">${item.title }</a>                                                
                                            </li>
                                          
                                            </c:forEach>
							
							<li class="nav-item"><a class="nav-link" href="<%=basePath%>app/feedback">反馈</a></li>
						</ul>

						<a class="header-search__trigger d-none d-lg-flex" href="#">
							<i class="icon-magnifier header-search-icon"></i>
						</a>

					

						<div class="header-search open-search open">

							<div class="container">
								<div class="row">
								  <div class="col-sm-8 offset-sm-2 col-10 offset-1">
									<div class="navbar-search">
									  <form class="search-global">
										<input class="search-global__input" type="text" placeholder="Type to search" autocomplete="off" name="s" value=""/>
										<button class="search-global__btn"><i class="icon stroke icon-Search"></i></button>
										<div class="search-global__note">Begin typing your search above and press return to search.</div>
									  </form>
									</div>
								  </div>
								</div>
							  </div>
							  <button class="search-close close" type="button"><i class="fa fa-times"></i></button>
						</div>
						
					</div>
				</div>
			</nav>
		</div>

		<!-- Page Header -->
		
	
                    