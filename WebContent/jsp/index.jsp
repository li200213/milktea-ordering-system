<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Tea_With_Milk</title>
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet" type="text/css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
	<jsp:include page="/jsp/header.jsp"></jsp:include>
	<!-- 轮播 -->
	<div id="my_carousel" class="carousel slide" data-bs-ride="carousel">
 			<!-- 指示符 -->
  			<div class="carousel-indicators">
  				<button type="button" data-bs-target="my_carousel" data-bs-slide-to="0" class="active"></button>
  				<button type="button" data-bs-target="my_carousel" data-bs-slide-to="1"></button>
  				<button type="button" data-bs-target="my_carousel" data-bs-slide-to="2"></button>
  				<button type="button" data-bs-target="my_carousel" data-bs-slide-to="3"></button>
  			</div>
  
  			<!-- 轮播图片 -->
  			<div class="carousel-inner">
  				<c:forEach var="carousel" items="${carousel_list}">
  					<c:if test="${carousel.id==1}">
  						<div class="carousel-item active">
			  				<a href="${pageContext.request.contextPath}/getDetailServlet?id=${carousel.goods_id}">
			     				<img src="${carousel.cover}" class="d-block">
			     			</a>
		   		   		</div>
  					</c:if>
  					<c:if test="${carousel.id!=1}">
  						<div class="carousel-item">
			  				<a href="${pageContext.request.contextPath}/getDetailServlet?id=${carousel.goods_id}">
			     				<img src="${carousel.cover}" class="d-block">
			     			</a>
		   		   		</div>
  					</c:if>
				</c:forEach>
  			</div>
  
  			<!-- 左右切换按钮 -->
  			<button style="width:40px;height:40px;background:#626262;position:absolute;top:50%;margin-left:20px;" class="carousel-control-prev" type="button" data-bs-target="#my_carousel" data-bs-slide="prev">
    			<span class="carousel-control-prev-icon"></span>
  			</button>
  			<button style="width:40px;height:40px;background:#626262;position:absolute;top:50%;margin-right:20px;" class="carousel-control-next" type="button" data-bs-target="#my_carousel" data-bs-slide="next">
   				<span class="carousel-control-next-icon"></span>
  			</button>
	</div>
	<div class="index_tree">
		<div class="jingdian">
			<div class="tu"> 
				<a href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=1"> 
					<img src="${pageContext.request.contextPath}/image/草莓麻薯乌龙.jpg">
				</a> 
			</div>
			<div class="tb"> 
				<a href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=1">
					<span>新品系列</span>
					<span>NEW LINE</span>
				</a>
			</div>
		</div>
		<div class="jingdian">
			<div class="tu"> 
				<a href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=1"> 
					<img src="${pageContext.request.contextPath}/image/重磅橙霸.jpg">
				</a> 
			</div>
			<div class="tb"> 
				<a href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=1">
					<span>新品系列</span>
					<span>NEW LINE</span>
				</a>
			</div>
		</div>
		<div class="jingdian">
			<div class="tu"> 
				<a href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=1"> 
					<img src="${pageContext.request.contextPath}/image/蔓越莓麻薯.jpg">
				</a> 
			</div>
			<div class="tb"> 
				<a href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=1">
					<span>新品系列</span>
					<span>NEW LINE</span>
				</a>
			</div>
		</div>
	</div>	
	<div class="footer">版权 © liaoshuang.com</div>
</body>
</html>