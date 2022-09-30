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
									<h1 class="page-header__heading">注册平台账号</h1>
									<ul class="breadcrumbs">
										<li class="breadcrumbs__item" >
											<a href="<%=basePath %>" class="breadcrumbs__link">Home</a>
											<i class="fas fa-angle-double-right"></i>
										</li>
										<li class="breadcrumbs__item">
											<a href="#" class="breadcrumbs__link">Sign up page</a>
										</li>
									</ul>
							</div>
						</div>
					</div>
				</div>
                
                
			</div>
    
		</header>

<style>
.btn {
    font-size: 16px;
    padding: 14px 30px;
    background: #42c68d;
    outline: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
    margin-left: 0;
    margin-top: 20px;
}
html .btn {
    padding: 20px 30px;
    line-height: 1.1;
    color: #fff;
    font-size: 16px;
    font-weight: 600;
    text-transform: uppercase;
    border-top-left-radius: 8px;
    border-top-right-radius: 0;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 8px;
    border: 0;
    margin-top: 10px;
    margin-bottom: 10px;
    max-height: 57px;
    cursor: pointer;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.btn {
    background-color: #1cb6e2;
    text-align: center;
    display: inline-block;
    color: #fff;
    padding-top: 18px;
    padding-bottom: 18px;
    text-decoration: none;
    -webkit-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}
.btn {
    display: inline-block;
    font-weight: 400;
    color: #fff;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
 
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.3.5;
    border-radius: .25rem;
    -webkit-transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    -o-transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
}
a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
}
a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
}
</style>
<div class="bh-position bh-position-default">
    <div class="container uk-container-center">
        <div class="row" data-uk-grid-margin data-uk-grid-match>

            <div class="col-md-8">

              
                <article class="uk-article">
                    <div class="uk-grid" data-uk-grid-margin style="margin-top:0px">

                     
<div class="contact-form" style="width:100%">
                    	
                        <p class="text-muted">All fields are required</p>
                        <form class="form -inline" action="<%=basePath%>app/signup" method="POST">
                        <div class="row">
                            <div class="w-50 ">
                                <div class="form-group">
                                	<label>账号*</label>
                                	<input type="text" class="uk-width-1-1 uk-form-large form-control" name="username" required>
                                </div>
                            </div>
                            <div class="w-50 ">
                                <div class="form-group">
                                	<label>密码*</label>
                                	<input type="text" class="uk-width-1-1 uk-form-large form-control" name="password" required>
                                </div>
                            </div>
                            <div class="w-50 ">
                                <div class="form-group">
                                	<label>出生日期*</label>
                                	<input type="text" class="uk-width-1-1 uk-form-large form-control" name="birthday" required>
                                </div>
                            </div>
                            <div class="w-50 ">
                                <div class="form-group">
                                	<label>性别*</label>
                                	<input type="radio" checked class="" name="sex" value="1"> 男
                                	<input type="radio" class="" name="sex" value="2"> 女
                                </div>
                            </div>
                            <div class="w-50 ">
                                <div class="form-group">
                                	<label>手机号码*</label>
                                	<input type="tel" class="uk-width-1-1 uk-form-large form-control" name="tel" required>
                                </div>
                            </div>
                            <div class="w-50 ">
                                <div class="form-group">
                                	<label>地址*</label>
                                	<input type="text" class="uk-width-1-1 uk-form-large form-control" name="address" required>
                                </div>
                            </div>
                            <div class="w-50 ">
                                <div class="form-group">
                                	<label>家庭地址*</label>
                                	<input type="text" class="uk-width-1-1 uk-form-large form-control" name="maincontent" required>
                                </div>
                            </div>
                            
                            
                            
                             
                            
                        </div>
                        
                        <button type="submit" class="btn  bh-button btn btn-default btn-lg">提交注册信息 SUBMIT FORM</button>
                        </form>
                        <br>
                    </div>  

                    </div>

                  
                </article>

            </div> 

            <div class="col-md-4">
                <div class="uk-panel">
                   <div class="sidebar__widget mt-40">
						<h6 class="capitalised decorated-outer">PR Categories</h6>

<c:forEach items="${cates}" var="item" varStatus="s">
						<div class="form-check" style="cursor:pointer;" 
						onclick="javascript:location.href='<%=basePath %>';"
						>
							
							<label class="form-check-label" for="blankCheckbox1">
${item.title }</label>
						</div>
						</c:forEach>

						
					</div>

                </div>
                
                
            </div>

        </div>
    </div>
</div>




        

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
		