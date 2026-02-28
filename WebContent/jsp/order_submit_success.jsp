<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>订单提交成功</title>
<link href="${pageContext.request.contextPath}/css/order_submit_success.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	<jsp:include page="/jsp/header.jsp"></jsp:include>
    <div class="order_success">
    	<i class="bi bi-check-circle-fill"></i>
        <p><b>订单提交成功</b></p>
        <p>可以前往<a href="${pageContext.request.contextPath}/getOrderListServlet"> 我的订单 </a>查看</p>
    </div>
    <jsp:include page="/jsp/footer.jsp"></jsp:include>
</body>
</html>