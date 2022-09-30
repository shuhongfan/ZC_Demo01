<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
                    <link href="<%=basePath %>static/slider/style.css">
	<div class="page-header bg-img" data-img="<%=basePath %>static/ui/img/_src/aucapina-0552519490.jpg">

			<div class="page-header__cotent inner_content">
				
				
<div style="height:550px;overflow:hidden" class="bh-position bh-position-padding-remove" data-uk-slideshow="{animation: 'fade', duration: 700}">



<div class='swipe' style="margin-top:-20px">
  <ul id='slider3' style="margin-top:0px"> <c:forEach items="${ads}" var="item" varStatus="s">
   
    <li style='padding-left:0px;width:100%;'><div>   <a href="${item.url }" target="_blank">
    <img src="<%=basePath %>${item.thumb}"/>
    </a></div></li>
    </c:forEach>
  </ul>
</div>


    
</div>     
				
				
				
			</div>
		</div>

		<!-- Trip Search Bar -->
		<div class="container justify-content-center mt--200 search_bar_wrap">
		
            
               <div class="search-bar__container">
					
					 <c:forEach items="${ls}" var="item" >
					<div style="width:33%" class="card-container">
							<div class="card-preview">
								<img src="<%=basePath %>${item.thumb }" alt="car image" class="card-preview__image">
								<div class="card-preview__label">￥${item.category_name }</div>
							</div>
							<div class="card-info">
								<div class="card-info__price">众筹资金：￥${item.price }</div>
								<h4 class="card-info__title">${item.product_name }</h4>
								<ul class="card-info__description">
									<li class="card-info__item"><div class="card-icon bg-img" data-img="<%=basePath %>static/ui/img/_src/card-icon-gas.png"></div>
									紧急度：${item.brandid }</li>
									<li class="card-info__item"><div class="card-icon bg-img" data-img="<%=basePath %>static/ui/img/_src/card-icon-bed.png"></div>
									截至日期：${item.store }</li>
									<li class="card-info__item"><div class="card-icon bg-img" data-img="<%=basePath %>static/ui/img/_src/card-icon-layer.png"></div>
									回报：${item.brandname }</li>
								</ul>
								<a href="<%=basePath %>app/detail?id=${item.id}" class="btn btn-border dark">众筹详情</a>
							</div>
					</div>
					</c:forEach>
					
					
					
					
				</div>
                
            
		</div>

	</header>

	<main>
		<!-- About Section -->
		<section class="section about  mb-100">
			<div class="container">
				<div class="row">
					<!-- Left block with images -->
					<div class="col-12 col-lg-6 col-md-12 mt-40 ">
						<div class="images-container">
							<img src="<%=basePath %>static/ui/img/_src/aucapina-0502476607.jpg" alt="image" class="image-small">
						</div>
					</div>

					<!-- Left block with text info -->
					<div class="col-12 col-lg-6 col-md-12 mt-100">
						<div class="heading heading-left-align heading-on-light heading-about">
							<div class="icon-with-text align-left">
								<img src="<%=basePath %>static/ui/img/_src/icon.png" alt="" class="icon  " data--duration="1s" data--delay="0.6s">
								<span class=" " data--duration="1s" data--delay="0.7s">欢迎使用</span>
							</div>
							<h2 class="heading-title  " data--duration="1s" data--delay="0.8s">${site.title }</h2>
							<div class="separator-container left  " data--duration="1s" data--delay="0.8s">
								<div class="separator"></div>
							</div>
							<div class="subtitle extra-small  " data--duration="1s" data--delay="1s">${site.description }</div>
							<p class="heading-text  " data--duration="1s" data--delay="1.1s">
									${site.keywords }
							</p>
							<div class="heading-btn-container  " data--duration="1s" data--delay="1.2s">
								<a href="<%=basePath %>manage/index" class="btn border--double">Join now</a>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
        
        
        
        	<!-- Section Vehicles -->
		        
        
        
        	<!-- Section RV Types -->
		

	
		<!-- Section Logos -->
		

	</main>


<jsp:include page="footer.jsp"></jsp:include>
<script src="<%=basePath%>static/slider/touchslider.js"></script>
<script>

(function(){
	
	var t3=new TouchSlider('slider3',{duration:1000, direction:0, interval:3000, fullsize:true});
	
})()

</script>


