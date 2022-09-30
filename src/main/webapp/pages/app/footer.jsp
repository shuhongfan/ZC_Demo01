<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

        
	<footer class="bg-img bg-y-bottom dark-bg" data-img="<%=basePath %>static/ui/img/_src/footer-bg.jpg">
		
			
        
        <div class="row">
				<div class="col-12">
					<div style="margin-top:0px" class="footer-bottom-widget__container">
						<div class="footer-bottom__copyright">
						${site.copyright }</div>
						<div class="footer-bottom__links">
							<a href="#" class="footer-bottom__link">
							${site.email }</a>
							<a href="#" class="footer-bottom__link">
							${site.tel } 	${site.address }
							</a>
						</div>
					</div>
				</div>
			</div>
        
        
	</footer>


	
	<script src="<%=basePath %>static/ui/js/scripts.js"></script>
    
    

</body>
</html>

                    