<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>详情页</title>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/css/detail.css" rel="stylesheet" type="text/css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(document).ready(function(){
		$("#i1").on('click',function(){
			$("#myModal").hide();
		});
		$("input[name='ingredient']").on('click',function(){
			if($("input[name='ingredient']:checked").length>2){
				$(this).prop("checked",false);
				alert("最多只能选择两个小料");
			}
		});
		$(".add").on('click',function(){
			var count = parseInt($("input[name='count']").val());
			$("input[name='count']").val(count+1);	
		});	
		$(".subtract").on('click',function(){
			var count = parseInt($("input[name='count']").val());
			if(count!=1){
				$("input[name='count']").val(count-1);	
			}
		});	
		$(".next").on('click',function(){
			if($("input[name='sweet_degree']:checked").length<1){
				$(this).prop("checked",false);
				alert("请选择糖度");
				return;
			}
			if($("input[name='temperature']:checked").length<1){
				$(this).prop("checked",false);
				alert("请选择温度");
				return;
			}
			var ingredients = $("input[name='ingredient']:checked").val();
			$.ajax({
				url: "${pageContext.request.contextPath}/addToCartServlet",
				type: "POST",
				data: {
						"id": $("#pid").text(),
						"count":$("input[name='count']").val(),
						"ingredients":ingredients.toString(),
						"sweet_degree":$("input[name='sweet_degree']").val(),
						"temperature":$("input[name='temperature']").val()
				},
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
			<a id="back" style="float: right;margin-right: 25px;" href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=">再逛逛</a>
		</div>
	</div>
	<div class="prior_box">
		<div class="left_box" style="float:left;">
			<img src="${beverage.image}">
		</div>
		<div class="right_box" style="float:right;">
			<div class="info">
				<h2 style="font-size:20px;font-weight:bold;height:50px;line-height:50px;">
					<span style="float:left;">${beverage.name}</span>
					<span style="float:right;">${beverage.price}</span>
				</h2>
				<p style="height:50px;">${beverage.intro}</p>
			</div>
	
				<div>
					<span style="display:block;background-color:#d5d5d5;margin-bottom:10px;margin-top:20px;">小料</span>
					<c:forEach var="ingredient" items="${ingredient_list}">
						<div style="display:inline-block;width:100px;"><input type="checkbox" name="ingredient" value="${ingredient}">${ingredient}</div>
					</c:forEach>
				</div>
				<div>
					<span style="display:block;background-color:#d5d5d5;margin-bottom:10px;margin-top:10px;">糖度</span>
					<c:forEach var="sweet_degree" items="${sweet_degree_list}" >
						<div style="display:inline-block;width:100px;"><input type="radio" name="sweet_degree" value="${sweet_degree}">${sweet_degree}</div>
					</c:forEach>
				</div>
				<div>
					<span style="display:block;background-color:#d5d5d5;margin-bottom:10px;margin-top:10px;">温度</span>
					<c:forEach var="temperature" items="${temperature_list}">
						<div style="display:inline-block;width:100px;"><input type="radio" name="temperature" value="${temperature}">${temperature}</div>
					</c:forEach>
				</div>
				<div style="width:485px;margin-top:20px;">
					<a class="subtract">-</a>
					<input class="count" type="text" name="count" value="1">
					<a class="add">+</a>
				</div>
		
			<div class="choose_next">
				<span id="pid" style="display:none;">${beverage.id}</span>
				<a id="1" class="next">加入购物车</a>
				<a id="2" class="next">立即购买</a>
			</div>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp"></jsp:include>
</body>
</html>