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
									<h1 class="page-header__heading">${g.product_name }</h1>
									<ul class="breadcrumbs">
										<li class="breadcrumbs__item" >
											<a href="<%=basePath %>" class="breadcrumbs__link">Home</a>
											<i class="fas fa-angle-double-right"></i>
										</li>
										<li class="breadcrumbs__item">
											<a href="#" class="breadcrumbs__link">Detail page</a>
										</li>
									</ul>
							</div>
						</div>
					</div>
				</div>
                
                
			</div>
    
		</header>
	
	<main>
		<div class="container mt-50">
			<div class="row">
				<!-- Sidebar -->
				<div class="col-12 col-lg-4 mt-60">
					<div class="sidebar">
						<div class="sidebar__widget">
							<ul class="contact-list">
								<li>
									<h4 class="decorated">发布人</h4>
									<p class="mt-20 mb-30">
									${author.username }
									</p>
								</li>
								<li class="contact-list__item">
									<div class="contact-list__header">
										<i class="fas fa-phone"></i>
										<h6>联系电话</h6>
									</div>
									<div class="contact-text">
										<span>
											 Phone <a href="#">${author.tel }</a>
										</span>
										
									</div>
								</li>
								<li class="contact-list__item">
									<div class="contact-list__header">
										<i class="fas fa-envelope-open"></i>
										<h6>邮箱</h6>
									</div>
									<p class="contact-text">
										<span>
												 <a href="#">${author.email }</a>
										</span>
										
									</p>
								</li>
								<li class="contact-list__item">
									<div class="contact-list__header">
										<i class="fas fa-map-marker-alt"></i>
										<h6>联系地址</h6>
									</div>
									<p class="contact-text">
											${author.address }
									</p>
								</li>
								
							</ul>
						</div>
					</div>
				</div> <!-- End of Sidebar -->

				<!-- Main Content -->
                <div class="col-12 col-lg-7  mt-60 c-form">
					
						<div class="heading heading-left-align heading-on-light">
							<div class="icon-with-text">
								<img src="<%=basePath %>static/ui/img/_src/icon-accent.png" alt="" class="icon">
								<span>我要投资</span>
							</div>
							<h2 class="heading-title">
								ONLINE POST
							</h2>
							<div class="separator-container mt-20">
								<div class="separator"></div>
							</div>
							<div class="heading-text">
									${g.description }
							</div>
							<div class="heading-text">
									${g.content }
							</div>
						</div>
			
					<div class=" mt-40 mb-50">
							<div class="contact-form">
                                        
								<ul class="form">
									<li class="w-50">
										<h6 class="decorated">投资金额</h6>
										<input name="total" type="number" class="contact__input" placeholder="" value="100" id="total">
									</li>
									
								</ul>
								<a href="javascript:;" onclick="submit()" class="btn send" id="send">提交投资</a>
							</div>
					</div>
                </div> <!-- End of Main Content -->

            </div>
		</div>
	</main>
	



        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");

function submit()
{
	var url = "<%=basePath %>app/submit?id=${g.id}&total="+$("#total").val();
	location.href=url
	}


$(document).ready(function(){
	

$("#addnum").click(function(){
	//alert(123);
	var cartNum = $("#cartnum").val();
	cartNum = parseInt(cartNum);
	var n = cartNum-1;
	n=n>0?n:1;
	//alert(n)
	$("#cartnum").val();


});



$("#sunum").click(function(){
	
	var cartNum = $("#cartnum").val();
	cartNum = parseInt(cartNum);
	$("#cartnum").val(cartNum+1);


});
})

</script>


<link href="<%=basePath %>static/toastr-master/toastr.min.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath %>static/toastr-master/toastr.min.js"></script>	
	<script>
<c:if test="${not empty message}">
toastr.success("${message}", "操作提醒");
setTimeout(function(){
	location.href="<%=basePath %>app/detail?id=${id}"
}, 1500)
</c:if>

<c:if test="${not empty g.status and g.status!=1}">
toastr.success("该众筹项目没有审核通过", "操作提醒");
setTimeout(function(){
	location.href="<%=basePath %>app/index"
}, 1500)
</c:if>
</script>	

<style>
@charset "utf-8";
html{background:white;color:black;}
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,hr,button,article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{margin:0;padding:0;}

input,select,textarea{font-size:100%;}
i, cite, em, var, address, dfn{font-style:normal;}
table{border-collapse:collapse;border-spacing:0;}
th{text-align:inherit;}
fieldset,img{border:none;}
iframe{display:block;}
abbr,acronym{border:none;font-variant:normal;}
del{text-decoration:line-through;}
address,caption,cite,code,dfn,em,th,var{font-style:normal;font-weight:500;}
ol,ul{list-style:none;}
caption,th{text-align:left;}
h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:500;}
q:before,q:after{content:'';}
sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline;}
sup{top:-0.5em;}
sub{ bottom:-0.25em;}
ins,a,a:hover{text-decoration:none;}
a:focus,*:focus{outline:none;}
.clearfix:before,.clearfix:after{content:""; display:table;}
.clearfix:after{clear:both;overflow:hidden;}
.clearfix{zoom:1;}
.clear{clear:both;display:block;font-size:0;height:0;line-height:0;overflow:hidden;}
.hide{ display:none;}
.block{display:block;}
.fl,.fr{ display:inline;}
.fl{float:left;}
.fr{float:right;}


/*联系框*/
.wrap-box{height:2500px;}

/* fixed-bar */
.fixed-bar .icon,.fixed-bar .consult-list .tel-icon{background:url("JS_02.png") no-repeat;}
.fixed-bar .icon{display:block;position:absolute;top:50%;left:50%;width:23px;height:12px;overflow:hidden;margin:-18px 0 0 -12px;background-position:right -220px;text-indent:-999em;}
.fixed-bar{position:fixed;right:20px;bottom:50px;z-index:50;_position:absolute;_bottom:auto;_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0))-30);}
.fixed-bar .gotop{position:relative;z-index:1;display:block;width:68px;height:36px;overflow:hidden;margin:-1px 0 0;padding:32px 0 0;border:1px solid #e6e6e6;border-top:1px dashed #eaeaea;background-color:#fff;color:#666;font:normal 14px/36px "Microsoft YaHei","\5FAE\8F6F\96C5\9ED1";text-align:center;}
.fixed-bar .share{height:68px;overflow:hidden;margin:-1px 0 0;border:1px solid #e6e6e6;}
.fixed-bar .gotop:hover{z-index:10;border-color:#2acb6b;background-color:#2acb6b;color:#fff;text-decoration:none;}
.fixed-bar .gotop:hover .icon{background-position:right -251px;}
.fixed-bar .consult-box{border:1px solid #e6e6e6;}
.fixed-bar .consult-box .consult-header{position:relative;height:36px;margin:-1px -1px 0;background:#2acb6b;}
.fixed-bar .consult-box .consult-title{color:#fff;font:normal 16px/36px "Microsoft YaHei","\5FAE\8F6F\96C5\9ED1";text-align:center;}
.fixed-bar .consult-box .icon{display:none;top:0;left:-28px;width:28px;height:36px;overflow:hidden;margin:0;background-position:-80px -530px;cursor:pointer;}
.fixed-bar .consult-box .icon:hover{background-position:-110px -530px;}
.fixed-bar .consult-list{margin:0 2px -1px;padding:9px 0;border-bottom:1px dashed #eaeaea;}
.fixed-bar .consult-list li{padding:6px 0 6px 23px;color:#666;font:normal 12px/24px "Microsoft YaHei","\5FAE\8F6F\96C5\9ED1";}
.fixed-bar .consult-list span,.fixed-bar .consult-list a{float:left;line-height:24px;}
.fixed-bar .consult-list span{padding-right:10px;}
.fixed-bar .consult-list img{vertical-align:top;}
.fixed-bar .wide-bar{width:134px;background:#fff;}
.fixed-bar .wide-bar .share .bds_more{width:148px;_width:146px;background-position:-252px -568px;}
.fixed-bar .wide-bar .share .bds_more:hover{background-position:-354px -568px;}
.fixed-bar .wide-bar .gotop{width:132px;}
.fixed-bar .consult-list .tel-icon{margin-left:-15px;padding:0 0 0 20px;background-position:-591px -264px;}
</style>

<div class="wrap-box"></div>

<div class="fixed-bar">
	<div class="wide-bar">
		<div class="consult-box">
			<div class="consult-header clearfix">
			<h3 class="consult-title">咨询发布人</h3>
			</div>
			<ul class="consult-list">
				<li class="clearfix">
					<span>${author.username }：</span>
					<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${author.qq }&site=qq&menu=yes"><img border="0" src="<%=basePath %>static/JS_qq.png" alt="QQ" title="点击开始QQ交谈/留言"></a>
				</li>
				
				<li class="clearfix"><span class="tel-icon">电话：${author.tel }</span></li> 
				<li class="clearfix"><span class="tel-icon">邮箱：${author.email }</span></li> 
				 
			</ul>
		</div>
		<a href="javascript:scrollTo(0,0)" class="gotop" title="回到顶部" style="display:none;"><i class="icon">返回顶部</i><span>返回顶部</span></a>
	</div>
</div>

<script type="text/javascript">    
$(document).scroll(function(){ 
	var  scrollTop =  $(document).scrollTop(),bodyHeight = $(window).height(); 
	if(scrollTop > bodyHeight){ 
		$('.fixed-bar .gotop').css('display','block');
	}else{
		$('.fixed-bar .gotop').css('display','none');
	} 
})
</script>