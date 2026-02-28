<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的订单</title>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath}/css/order.css" rel="stylesheet" type="text/css">
<style>
		.empty_order{
			width:996px;
			margin:0 auto;
			height: 300px;
			margin-top: 60px;
			line-height: 300px;
			font-size: 14px;
			font-family: 微软雅黑;
			color: #626262;
			text-align: center;
		}
		.empty_order a{
			color: #626262;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="bt">
		<div style="float:left; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
		<span style="width:10%; display:inline-block; color:#909090; font-size:16px; font-weight: bold; text-align:center; padding-top:5px;	font-family: 微软雅黑;">我的订单</span>
		<div style="float:right; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
	</div>
	<c:choose>
		<c:when test="${empty order_list}">
				<div class="empty_order">未查到任何相关订单</div>
		</c:when>
		<c:otherwise>
			<div style="height:530px;margin-top:20px;overflow:auto;">
				<c:forEach var="order" items="${order_list}">
					<table class="ddxq" style="margin-top:20px;">
						<tbody>
							<tr class="t_head">
							     <th class="my_th" style="width:246px;">订单编号：${order.id}</th>
							     <th class="my_th" style="width:350px;">下单时间：${order.order_time}</th>
							     <th class="my_th" style="width:200px;">状态：${order.state}</th>
							     <th class="my_th" style="width:200px;text-align:right;padding-right:20px;">总计：<b style="font-size:16px;">￥${order.total}</b></th>
							     <th></th>
							 </tr>
							<c:forEach var="item" items="${order.item_list}">
								<tr class="t_body">			    	
									<td><img src="${item.image}"><span style="display:inline-block;margin-left:10px;font-size:14px;">${item.name}</span></td>
									<td style="padding-left:50px;">${item.spec}</td>
									<td >￥${item.price}</td>
									<td>x${item.amount}</td>
									<td style="font-size:16px;">￥${item.price*item.amount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>