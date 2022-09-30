<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
<div class="page-header pages bg-img" data-img="<%=basePath %>static/ui/img/_src/bg_head.jpg" style="background-image: url(&quot;img/_src/contacts.jpg&quot;);">
				<!-- <div class="bg-cover"></div> -->
	
				<div class="page-header__cotent">
					
					<div class="container">
						<div class="row">
							<div class="col-12 mt-90 mb-60">
									<h1 class="page-header__heading">消息 MESSAGES</h1>
									<ul class="breadcrumbs">
										<li class="breadcrumbs__item" >
											<a href="<%=basePath %>" class="breadcrumbs__link">Home</a>
											<i class="fas fa-angle-double-right"></i>
										</li>
										<li class="breadcrumbs__item">
											<a href="#" class="breadcrumbs__link">Feedback page</a>
										</li>
									</ul>
							</div>
						</div>
					</div>
				</div>
                
                
			</div>

<div class="bh-position bh-position-default">
    <div class="container uk-container-center">
        <div class="row" data-uk-grid-margin data-uk-grid-match>

            <div class="col-md-8">

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
                <article class="uk-article">
                    <div class="uk-grid" data-uk-grid-margin>

                       
<div class="uk-width-medium-1-1 blog-list">
                        	<div class="blog-image">
                            <div class="title-group3">
                            	<h3>留言建议 </h3>
                            </div>
                            <div class="comment-list">
                            
                            ${html }
                                
                                
                                
                            </div>
                            <hr>
                            <div class="title-group3">
                            	<h3 id="title">在线留言 Leave a message</h3>
                            </div>
                            <form action="<%=basePath%>app/comment" method="POST">
                            <div class="row">
                            	
                            	<div class="col-sm-12">
                                	<div class="form-group">
                                    	填写内容
                                    </div>
                                </div>
                            	<div class="col-sm-12">
                                	<div class="form-group">
                                	
                                	<input name="mid" id="mid" type="hidden" value="0"/>
            <fieldset>
                                    	<textarea class="uk-width-1-1 uk-form-large form-control" name="content" placeholder="Your comment" style="width:100%;height:80px" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class=" btn btn-default btn-lg">提交留言 SUBMIT COMMENT</button>
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
	location.href="<%=basePath %>app/feedback"
}, 1500)
</c:if>
</script>	
	<script>


function show(id)
{
$("#mid").val(id);
$("#title").html("回复留言  Reply he/she");
	var el = document.getElementById("title");
	ele.scrollTop = ele.scrollHeight;
}





</script>
	
		
		