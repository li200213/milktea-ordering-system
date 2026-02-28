<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>header</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
	    $(document).ready(function(){
	    	$("#my_series").hover(
		    	function(){
					$("#my_menu").css("display","block");
		    	},
		    	function(){
			    	$("#my_menu").css("display","none");
			    }
		    );
	    	$("#my_menu").hover(
				function(){
				    $("#my_menu").css("display","block");
				},
				function(){
				    $("#my_menu").css("display","none");
				}
			);
	    })
    </script>
</head>
<body>
	<div class="header">
		<h1>
			<a href="${pageContext.request.contextPath}/jsp/index.jsp">
				<img src="${pageContext.request.contextPath}/image/logo.jpg" style="width:80px;height:80px;">
			</a>
		</h1>
		<div class="header_right">
			<div class="login_and_register">
				<label>
					<a href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a>
					<a href="${pageContext.request.contextPath}/jsp/register.jsp" style="margin-left:20px">注册</a>
					<a href="${pageContext.request.contextPath}/getOrderListServlet" style="margin-left:20px">我的订单</a>
				</label>
			</div>
		
			<nav id="my_nav" class="navbar navbar-expand-sm justify-content-center">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/indexServlet">
							<span>First Page</span>
							<span>首页</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=">
							<span>All Products</span>
							<span>全部产品</span>
						</a>
					</li>
				
					<li class="nav-item dropdown">
				      	<a id="my_series" class="nav-link">
				       		<span>Cake Series</span>
							<span>饮品系列</span>
				      	</a>
				      	<ul id="my_menu" class="dropdown-menu">
				      		<c:forEach var="type" items="${type_list}" begin="1">
				      			<li><a href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=${type.id}">${type.name}</a></li>
				      		</c:forEach>
				      	</ul>
				    </li>
				    <li class="nav-item" style="border:none;">
						<a class="nav-link" href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=0">
							<span>Yi Ingredient</span>
							<span>益小料</span>
						</a>
					</li>
				</ul>
			</nav>
			<div class="search_and_cart">
            	<a class="cart" href="${pageContext.request.contextPath}/getCartServlet"><i class="bi bi-cart3"></i></a> 
            	<div class="search_box">
            		<form class="input-group input-group-sm mb-3" action="${pageContext.request.contextPath}/beverageSearchServlet">
            			<input class="form-control" type="text" name="keyword">
            			<button class="btn btn-default" type="submit"><i class="bi bi-search"></i></button> 
            		</form>
            	</div>
			</div>
		</div>
	</div>
</body>
</html>