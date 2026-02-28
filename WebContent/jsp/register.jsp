<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册</title>
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="bt">
		<div style="float:left; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
		<span style="width:10%; display:inline-block; color:#909090; font-size:16px; font-weight: bold; text-align:center; padding-top:5px;	font-family: 微软雅黑;">用户注册</span>
		<div style="float:right; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
	</div>
	<div class="box">
		<c:if test="${!empty register_message}">
			<div class="error-info">
				<img class="error-icon" src="${pageContext.request.contextPath}/image/212e844bf3eec434bfbcd53c2139d91a1323.png">
				<div class="error-content">${register_message}</div>
			</div>
		</c:if>
		<form id="my_register" action="${pageContext.request.contextPath}/RegisterServlet" method="post">
			<div class="form-field form-field--username">
				<div class="bq">手机号</div>
				<div class="input">
					<input type="text" name="username" class="f-text f-text--username">
				</div>
				<span class="inline-tip">${formBean.errors.username}</span>
			</div>
			<div class="form-field form-field--pwd">
				<div class="bq">密&nbsp;&nbsp;码</div>
				<div class="input">
					<input type="password" name="password" class="f-text f-text--pwd">
				</div>
				<span class="inline-tip inline-tip--pwd">${formBean.errors.password}</span>
			</div>
			<div class="form-field form-field--pwd2">
				<div class="bq">确认密码</div>
				<div class="input">
					<input type="password" name="password2" class="f-text f-text--pwd2">
				</div>
				<span class="inline-tip inline-tip--pwd2">${formBean.errors.password2}</span>
			</div>
			<div class="form-field">
				<input id="register_btn" type="submit"  value="注&nbsp;&nbsp;册">
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>