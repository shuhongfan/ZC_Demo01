<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">

	<title>--</title>

	<link rel="preconnect" href="//fonts.gstatic.com/" crossorigin="">

	<!-- PICK ONE OF THE STYLES BELOW -->
	<link href="<%=basePath%>appstack/css/classic.css" rel="stylesheet">
	<!-- <link href="css/corporate.css" rel="stylesheet"> -->
	<!-- <link href="css/modern.css" rel="stylesheet"> -->

	<!-- BEGIN SETTINGS -->
	<!-- You can remove this after picking a style -->
	<style>
		body {
			opacity: 1;
		}
	</style>
	
	</head>

<body>
	<div class="wrapper">
	

		<div class="main">
			

			<main class="contvent ">
				<div class="container-fluid p-0">

					

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header1">
									
 
								</div>
								<div class="card-body">
								
								
					<div class="row">			         
<div class="col-md-2">
<form class="form-inline" method="get">
 <h4 >
<span class="badge badge-primary"> 
 项目进度：￥${geted }/${model.price }</span>
 <div style="padding:20px 0">
 <div style="" class="progress">
    <div class="progress-bar progress-bar-info" role="progressbar"
         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
         style="width: ${width};">
        <span class="">${width} 完成</span>
    </div> </div>
</div>
 
 </h4>
 <table>
 <thead>
 <tr>
 <td>投资人</td>
 <td>投资金额</td> 
 </tr> 
 </thead>
  <c:forEach items="${list}" var="item">
  <tr>
  <td>${item.buyer }</td>
  <td>￥${item.total }</td>
  </tr>
  </c:forEach>
  <tr>
  <td colspan="2">
  	汇总：${geted }
  </td>
  </tr>
 </table>
 	
 </form>
</div>
<div class="col-md-9">
	<div id="container"></div>
</div>
   </div>          
								
								
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			
		</div>
	</div>

	<script src="<%=basePath%>appstack/js\app.js"></script>
	
	<script src="<%=basePath%>scripts/window.js"></script>
   <script>
$().ready(function(){
	$(".uploadImg").click(function(){
		openWindow("<%=basePath%>upload.jsp");
	});
	$("#thumb").on("input",function(){
		$(".oldImg").attr("src","<%=basePath%>"+$("#thumb").val());
	});
});
</script>
	
<script>
		<c:if test="${not empty message}">
		toastr["success"]("${message}", "操作提醒", {
			positionClass : "toast-top-center",
			closeButton : true,
			progressBar : true,
			newestOnTop : true,
			rtl : $("body").attr("dir") === "rtl"
					|| $("html").attr("dir") === "rtl",
			timeOut : 5000
		});
		
		setTimeout(function () {
        		location.href = "<%=basePath%>morder/list";
    			},1000);
		</c:if>
	</script>
	
	
    <script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script type="text/javascript">
        $(function () {
            Highcharts.chart('container', {
                chart: {
                	  type: 'areaspline'
                },
                title: {
                    text: 'Report'
                },
                subtitle: {
                    text: '--'
                },
                xAxis: {
                    categories: [
                                 <c:forEach items="${list}" var="item">
                                 '${item.buyer}',
                                 </c:forEach>
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '数据'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: '投资',
                    data: [ <c:forEach items="${list}" var="item">
                    ${item.total},
                    </c:forEach>]

                }]
            });
        });
		</script>
</body>

</html>
