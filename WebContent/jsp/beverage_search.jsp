<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>关键字查询</title>
	<link href="${pageContext.request.contextPath}/css/line.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<style>
		.empty_pb{
			width:996px;
			margin:0 auto;
			height: 300px;
			margin-top: 120px;
			line-height: 300px;
			font-size: 14px;
			font-family: 微软雅黑;
			color: #626262;
			text-align: center;
		}
	</style>
</head>
<body>
	<jsp:include page="/jsp/header.jsp"></jsp:include>
	<c:choose>
		<c:when test="${empty pb}">
				<div class="empty_pb">未查到任何相关商品</div>
		</c:when>
		<c:otherwise>
			<div class="index_tree">
		<c:forEach var="beverage" items="${pb.beverage_list}" begin="0" end="2">
			<a class="jingdian" href="${pageContext.request.contextPath}/getDetailServlet?id=${beverage.id}">
				<div class="tu"> 
					<img src="${beverage.image}">
				</div>
				<div class="tb"> 
					<span>${beverage.name}</span>
					<b>￥${beverage.price}</b> 
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="index_tree">
		<c:forEach var="beverage" items="${pb.beverage_list}" begin="3" end="5">
			<a class="jingdian" href="${pageContext.request.contextPath}/getDetailServlet?id=${beverage.id}">
				<div class="tu"> 
					<img src="${beverage.image}">
				</div>
				<div class="tb"> 
					<span>${beverage.name}</span>
					<b>￥${beverage.price}</b> 
				</div>
			</a>
		</c:forEach>
	</div>

			<div class="page_div">
				<ul class="pagination pagination-sm justify-content-center">
					<c:if test="${pb.currentPage == 1}">
						<li class="page-item disabled">
							<a class="page-link" aria-label="Previous">&laquo;</a>
						</li>
					</c:if>
				 	<c:if test="${pb.currentPage != 1}">
		                 <li class="page-item">
		                     <a class="page-link" href="${pageContext.request.contextPath}/cakeSearchServlet?currentPage=${pb.currentPage - 1}" aria-label="Previous">&laquo;</a>
		                 </li>
		             </c:if>
				     <c:forEach begin="1" end="${pb.totalPage}" var="i">
		                 <c:if test="${pb.currentPage == i}">
		                     <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/cakeSearchServlet?currentPage=${i}">${i}</a></li>
		                 </c:if>
		                 <c:if test="${pb.currentPage != i}">
		                     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/cakeSearchServlet?currentPage=${i}">${i}</a></li>
		                 </c:if>
		             </c:forEach>
				     <c:if test="${pb.currentPage == pb.totalPage}">
		                 <li class="page-item disabled">
		                     <a class="page-link" aria-label="Next">&raquo;</a>
		                 </li>
		             </c:if>
		             <c:if test="${pb.currentPage != pb.totalPage}">
		                 <li class="page-item">
		                     <a class="page-link" href="${pageContext.request.contextPath}/cakeSearchServlet?currentPage=${pb.currentPage + 1}" aria-label="Next">&raquo;</a>
		                 </li>
		             </c:if>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/jsp/footer.jsp"></jsp:include>
</body>
</html>