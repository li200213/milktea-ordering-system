<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>支付</title>
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link href="${pageContext.request.contextPath}/css/order.css" rel="stylesheet" type="text/css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="bt">
		<div style="float:left; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
		<span style="width:10%; display:inline-block; color:#909090; font-size:16px; font-weight: bold; text-align:center; padding-top:5px;	font-family: 微软雅黑;">结算</span>
		<div style="float:right; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
	</div>
	<form id="my_order" action="${pageContext.request.contextPath}/submitOrderServlet" method="post">
		<p class="head" style="margin-top:30px;">
			<span class="ship_title">支付方式</span>
		</p>
		<div class="pay-box">
			<div class="form-check" style="margin-right:150px;">
				<input type="radio" class="form-check-input"  name="pay_way" value="WeChat Pay">
				<span>微信支付</span>
			</div>
			<div class="form-check">
				 <input type="radio" class="form-check-input" name="pay_way" value="Alipay">
				<span>支付宝支付</span>
			</div>
			<span class="inline-tip">${error_info}</span>
		</div>
		<p class="head" style="margin-top:20px;">
			<span class="ship_title">订单详情</span>
		</p>
		<table class="ddxq">
			<tbody>
				<tr class="t_head">
				     <th class="my_th" style="width:250px;">名称</th>
				     <th class="my_th" style="width:200px;">规格</th>
				     <th class="my_th" style="width:100px;">单价</th>
				     <th class="my_th" style="width:100px;">数量</th>
				     <th class="my_th" style="width:110px;">小计</th>
				 </tr>
				<c:forEach var="item" items="${checked_list}">
					<tr class="t_body">			    	
						<td><img src="${item.image}"><span style="display:inline-block;margin-left:10px;font-size:14px;">${item.name}</span></td>
						<td>${item.spec}</td>
						<td style="padding-left:20px;">${item.price}</td>
						<td style="padding-left:30px;">${item.amount}</td>
						<td style="padding-left:20px;font-size:16px;">${item.price*item.amount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="showtotal">
			<span>商品金额总计:￥${total}</span>
			<label>需付:<b style="font-size:20px;color:#008000;">￥${total}</b></label>
		</div>
		<div class="bak_div">
			<textarea name="note" class="bak" placeholder="备注:(100字以内)" maxlength="100"></textarea>
		</div>
		<div class="submit_div">
			<div class="order_btn">
				<input type="submit"  value="确认并提交订单">
			</div>
		</div>
	</form>
	<div class="footer">版权 © liaoshuang.com</div>
</body>
</html>