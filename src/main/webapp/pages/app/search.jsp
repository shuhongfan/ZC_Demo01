<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
 
 
 
<div class="bh-position-title" style="background:url(<%=basePath %>static/bg.png) no-repeat;background-size:cover">
    <div class="uk-container uk-container-center">
        <div class="uk-panel">
            <h1 class="uk-margin-remove">   搜索</h1>
            <p class="uk-text-muted bh-text-uppercase uk-margin-remove">
         SEARCH RESULT
            </p>
        </div>
    </div>
</div>

<div class="bh-position bh-position-default">
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin data-uk-grid-match>

            <div class="uk-width-medium-3-4">

                <ul class="uk-breadcrumb">
                    <li><a href="<%=basePath%>">Home</a></li>
                    <li class="uk-active"><span>Search</span></li>
                </ul>

                <article class="uk-article">
                    <div class="uk-grid" data-uk-grid-margin>

                        <div class="uk-width-1-1">
                            <div class="uk-form uk-clearfix">
                                <div class="uk-form-controls">
                                    
                                </div>
                            </div>
                        </div>


	<c:forEach items="${list}" var="item">

                        <div class="uk-width-small-1-2">
                            <div class="uk-panel">
                                <figure class="uk-overlay uk-overlay-hover bh-overlay-image">
                                    <a class="uk-position-cover" href="<%=basePath %>app/detail?id=${item.id}"></a>
                                    <img src="<%=basePath%>${item.thumb}">
                                    <img class="bh-overlay-image-hover" src="<%=basePath%>${item.thumb}">
                                    <figcaption class="uk-overlay-panel uk-overlay-bottom uk-overlay-slide-bottom bh-padding-remove">
                                        <div>
                                            <div class="uk-button-group uk-width-1-1">
                                            
                                            <a href="<%=basePath %>app/detail?id=${item.id}" class="uk-button uk-button-large uk-width-8-10">点击查看 VIEW DETAIL</a>
                                                        <a href="<%=basePath%>app/fav?id=${item.id }" class="uk-button uk-button-large uk-width-2-10"><i class="uk-icon-star"></i></a>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>

                               <div class="uk-float-left uk-margin-top">
                                            <h3 class="uk-margin-small-bottom uk-link-reset"><a href="<%=basePath %>app/detail?id=${item.id}">${item.product_name }</a></h3>
                                            <p class="uk-margin-remove"><a href="<%=basePath %>app/detail?id=${item.id}">${item.category_name },</a> <a href="<%=basePath %>app/detail?id=${item.id}">Satchel</a></p>
                                        </div>
                                        <span class="uk-float-right uk-margin-top uk-text-large">￥${item.price }</span>
                            </div>
                        </div>

</c:forEach>
                        

                    </div>

                  
                </article>

            </div>

            <div class="uk-width-medium-1-4">
                <div class="uk-panel">
                    <ul class="uk-nav uk-nav-side">
                        <li class="uk-nav-header">类目</li>
                        <c:forEach items="${cates}" var="item">
                                                <li><a href="<%=basePath%>app/categoies?id=${item.id}">${item.title }</a></li>
                                                </c:forEach>
                     
                    </ul>
                </div>
                
                
            </div>

        </div>
    </div>
</div>



                    
        
        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>