<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>系列</title>
	<link href="${pageContext.request.contextPath}/css/line.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<jsp:include page="/jsp/header.jsp"></jsp:include>
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
                     <a class="page-link" href="${pageContext.request.contextPath}/getBeverageListServlet?currentPage=${pb.currentPage - 1}&type_id=${type_id}" aria-label="Previous">&laquo;</a>
                 </li>
             </c:if>
		     <c:forEach begin="1" end="${pb.totalPage}" var="i">
                 <c:if test="${pb.currentPage == i}">
                     <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/getBeverageListServlet?currentPage=${i}&type_id=${type_id}">${i}</a></li>
                 </c:if>
                 <c:if test="${pb.currentPage != i}">
                     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/getBeverageListServlet?currentPage=${i}&type_id=${type_id}">${i}</a></li>
                 </c:if>
             </c:forEach>
		     <c:if test="${pb.currentPage == pb.totalPage}">
                 <li class="page-item disabled">
                     <a class="page-link" aria-label="Next">&raquo;</a>
                 </li>
             </c:if>
             <c:if test="${pb.currentPage != pb.totalPage}">
                 <li class="page-item">
                     <a class="page-link" href="${pageContext.request.contextPath}/getBeverageListServlet?currentPage=${pb.currentPage + 1}&type_id=${type_id}" aria-label="Next">&raquo;</a>
                 </li>
             </c:if>
		</ul>
	</div>
	<jsp:include page="/jsp/footer.jsp"></jsp:include>
</body>
</html>