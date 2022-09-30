<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>

			<!-- Page Header -->
			<div class="page-header pages bg-img" data-img="<%=basePath %>static/ui/img/_src/bg_head.jpg" style="background-image: url(&quot;img/_src/contacts.jpg&quot;);">
				<!-- <div class="bg-cover"></div> -->
	
				<div class="page-header__cotent">
					
					<div class="container">
						<div class="row">
							<div class="col-12 mt-90 mb-60">
									<h1 class="page-header__heading">项目 PROJECTS</h1>
									<ul class="breadcrumbs">
										<li class="breadcrumbs__item" >
											<a href="<%=basePath %>" class="breadcrumbs__link">Home</a>
											<i class="fas fa-angle-double-right"></i>
										</li>
										<li class="breadcrumbs__item">
											<a href="#" class="breadcrumbs__link">List page</a>
										</li>
									</ul>
							</div>
						</div>
					</div>
				</div>
                
                
			</div>
    
		</header>
    <main>


		

	<div class="container">
		<div class="row">
			<!-- Aside / Sidebar -->
			<div class="col-12 col-lg-4">
				<div class="sidebar">
					

					

					<div class="sidebar__widget mt-40">
						<h6 class="capitalised decorated-outer">PR Categories</h6>

<c:forEach items="${cates}" var="item" varStatus="s">
						<div class="form-check" style="cursor:pointer;" 
						onclick="javascript:location.href='<%=basePath %>';">
							
							<label class="form-check-label" for="blankCheckbox1">
${item.title }</label>
						</div>
						</c:forEach>

						
					</div>

					

					<div class="sidebar__widget transparent">
						<a href="<%=basePath %>" class="btn border--double">Back Home Page</a>
					</div>
				</div>
			</div>
			<!-- Main Content -->
			<div class="col-12 col-lg-8 mt-60">
					<div class="container">
						<div class="row">
							
							
	<c:forEach items="${list}" var="item">
							
							<div class="col-12">
								<div class="card-container horizontal">
									<div class="card-preview">
										<img src="<%=basePath %>${item.thumb }" alt="car image" class="card-preview__image">
										
                                    </div>
									<div class="card-info">
                                        <div class="card-info__heading-wrapper">
                                            <div class="card-info__heading">
                                                <h4 class="card-info__title">${item.product_name }</h4>
                                                <span class="card-info__subtitle">类别：${item.category_name }</span>
                                            </div>
                                        
                                            <div class="card-info__price">￥${item.price }</div>
										</div>
										<div class="card-info__excerpt">
										${item.description }
										</div>
										<ul class="card-info__description">
                                            <li class="card-info__item">
                                                <i class="fas fa-map-marker-alt"></i>
                                                <div class="card-text">紧急度 ${item.brandid }</div>
                                            </li>
                                            <li class="card-info__item">
                                                <i class="fas fa-gas-pump"></i>
                                                <div class="card-text">截至时间 ${item.store }</div>
											</li>
											<li class="card-info__item">
                                                <i class="fas fa-bed"></i>
                                                <div class="card-text">回报：${item.brandname }</div>
                                            </li>
                                            <li class="card-info__item">
                                                <i class="fas fa-layer-group"></i>
                                                <div class="card-text">发布人：${item.shopname }</div>
                                            </li>
										</ul>
                                        <a href="<%=basePath %>app/detail?id=${item.id}" class="btn btn-border dark">查看项目</a>
									</div>
								</div>

								<hr class="dots">
							</div>
							</c:forEach>
							
							
							
							
							
							

						</div>
						
					</div>
						
				</div>

		</div>
	</div>

	</main>

        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>