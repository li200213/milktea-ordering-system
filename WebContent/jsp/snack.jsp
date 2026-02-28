<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>零食糕点</title>
	<link href="${pageContext.request.contextPath}/css/line.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(document).ready(function(){
			$("#i1").on('click',function(){
				$("#myModal").hide();
			});
			$("#back").on('click',function(){
				$("#myModal").hide();
			});
			$(".joincart").on('click',function(event){
				$.ajax({
					url: "${pageContext.request.contextPath}/addToCartServlet",
					type: "POST",
					data: {"id": $(this).attr("id")},
					dataType: "text",
					success:function(result){
						if(result=="用户未登录"){
							alert(result);
						}else if(result=="该商品库存不足"){
							alert(result);
						}else{
							$("#myModal").fadeIn();
						}
					},
					error:function(){
						console.log("请求失败！");
					}
				});
			});
			$(".tb").hover(
				function(){
					$(this).children(".info").hide();
					$(this).children(".joincart").show();
				},
				function(){
					$(this).children(".joincart").hide();
					$(this).children(".info").show();
				}
			)
		})
	</script>
</head>
<body>
	<jsp:include page="/jsp/header.jsp"></jsp:include>
	<div id="myModal" style="display: none;">
		<div class="content">
			<div class="p1"><i id="i1" class="bi bi-x-lg"></i></div>
			<div class="p2"><i id="i2" class="bi bi-check-lg"></i>添加成功</div>
		</div>
		<div class="btn_box">
			<a style="float: left;margin-left: 25px;" href="${pageContext.request.contextPath}/getCartServlet">去购物车结算</a>
			<a id="back" style="float: right;margin-right: 25px;" href="javascript:;">再逛逛</a>
		</div>
	</div>
	<div class="index_tree">
		<c:forEach var="cake" items="${pb.cake_list}" begin="0" end="2">
			<div class="jingdian">
				<div class="tu"> 
					<img src="${cake.img_path}">
				</div>
				<div class="tb"> 
					<div class="info">
						<span>${cake.name}</span>
						<b>￥${cake.price}</b> 
					</div>
					<div class="joincart" id="${cake.id}">加入购物车</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="index_tree">
		<c:forEach var="cake" items="${pb.cake_list}" begin="3" end="5"> 
			<div class="jingdian">
				<div class="tu"> 
					<img src="${cake.img_path}">
				</div>
				<div class="tb"> 
					<div class="info">
						<span>${cake.name}</span>
						<b>￥${cake.price}</b> 
					</div>
					<div class="joincart" id="${cake.id}">加入购物车</div>
				</div>
			</div>
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
                     <a class="page-link" href="${pageContext.request.contextPath}/getCakeListServlet?currentPage=${pb.currentPage - 1}&type_id=0" aria-label="Previous">&laquo;</a>
                 </li>
             </c:if>
		     <c:forEach begin="1" end="${pb.totalPage}" var="i">
                 <c:if test="${pb.currentPage == i}">
                     <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/getCakeListServlet?currentPage=${i}&type_id=0">${i}</a></li>
                 </c:if>
                 <c:if test="${pb.currentPage != i}">
                     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/getCakeListServlet?currentPage=${i}&type_id=0">${i}</a></li>
                 </c:if>
             </c:forEach>
		     <c:if test="${pb.currentPage == pb.totalPage}">
                 <li class="page-item disabled">
                     <a class="page-link" aria-label="Next">&raquo;</a>
                 </li>
             </c:if>
             <c:if test="${pb.currentPage != pb.totalPage}">
                 <li class="page-item">
                     <a class="page-link" href="${pageContext.request.contextPath}/getCakeListServlet?currentPage=${pb.currentPage + 1}&type_id=0" aria-label="Next">&raquo;</a>
                 </li>
             </c:if>
		</ul>
	</div>
	<jsp:include page="/jsp/footer.jsp"></jsp:include>
</body>
</html>