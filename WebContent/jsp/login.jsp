、<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录</title>
	<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="bt">
		<div style="float:left; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
		<span style="width:10%; display:inline-block; color:#909090; font-size:16px; font-weight: bold; text-align:center; padding-top:5px;	font-family: 微软雅黑;">用户登录</span>
		<div style="float:right; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
	</div>
	<div class="box">
		<c:if test="${!empty login_message}">
			<div class="error-info">
				<img class="error-icon" src="${pageContext.request.contextPath}/image/212e844bf3eec434bfbcd53c2139d91a1323.png">
				<div class="error-content">${login_message}</div>
			</div>
		</c:if>
		<form id="my_login" action="${pageContext.request.contextPath}/LoginServlet" method="post">
			<div class="form-field">
				<div class="bq">手机号</div>
				<div class="input">
					<input name="username" type="text" class="f-text">
				</div>
				<span class="inline-tip">${formBean.errors.username}</span>
			</div>
			<div class="form-field">
				<div class="bq">密&nbsp;&nbsp;码</div>
				<div class="input">
					<input name="password" type="password" class="f-text">
					<a href="#">忘记密码?</a>
				</div>
				<span class="inline-tip">${formBean.errors.password}</span>
			</div>
			<div class="second_box">
				<div class="login_btnBox">
					<input id="login_btn" type="submit" value="登&nbsp;&nbsp;录">
				</div>
				<a class="register_btnBox" href="${pageContext.request.contextPath}/jsp/register.jsp">免费注册</a>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>