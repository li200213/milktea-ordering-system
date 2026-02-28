<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>购物车</title>
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script >
	    var id;
		function delete_item(pid){
			id = pid;
			$("#myModal").show();
		}
		$(document).ready(function(){
			// 加载完页面时,计算总计
			account();
			$("#i1").on('click',function(){
				$("#myModal").hide();
			});
			$("#back").on('click',function(){
				$("#myModal").hide();
			});
			$("#go").on('click',function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/deleteItemServlet",
					type: "POST",
					data: {"id": id},
					success:function(){
						$("#myModal").hide();
						location.reload();
					},
					error:function(){
						console.log("请求失败");
					}
				});
			});
			$("input[name='choose_all']").on('click',function(){
				if($(this).prop("checked")==true){
					$("input[name='choose_item']").prop("checked",true);
				}else{
					$("input[name='choose_item']").prop("checked",false);
				}
				account();
			});
			$("input[name='choose_item']").on('click',function(){
				if($(this).prop("checked")==true){
					let num = 0;
					let checked_num = 0;
					$("input[name='choose_item']").each(function () {
							num += 1;
						   var isChecked = $(this).prop("checked");
						   if(isChecked == true) {
						      checked_num += 1;
						   }
					});
					if(checked_num == num){
						$("input[name='choose_all']").prop("checked",true);
					}
				}else{
					$("input[name='choose_all']").prop("checked",false);
				}
				account();
			});
			function account(){
				let total = 0;
				$("input[name='choose_item']").each(function () {
				   var isChecked = $(this).prop("checked");
				   if(isChecked == true) {
				      total += parseFloat($(this).val());
				   }
				});
				$(".total").text(total);
			};
			$(".post_btn").on('click',function(){
				let checked_pids = [];
				$("input[name='choose_item']").each(function () {
					   var isChecked = $(this).prop("checked");
					   if(isChecked == true) {
					      checked_pids.push($(this).parent().prev().text());
					   }
				});
				$.ajax({
					url: "${pageContext.request.contextPath}/goPayServlet",
					type: "POST",
					data: {
						"checked_pids": checked_pids.toString(),
						"total":$(".total").text()
					},
					success:function(){
						window.location="${pageContext.request.contextPath}/jsp/order.jsp"
					},
					error:function(){
						console.log("请求失败");
					}
				});
			})
		})
	</script>
</head>
<body>
	<jsp:include page="/jsp/header.jsp"></jsp:include>
	<div id="myModal" style="display: none;">
		<div class="content">
			<div class="p1"><i id="i1" class="bi bi-x-lg"></i></div>
			<div class="p2"><i id="i2" class="bi bi-check-lg"></i>确定从购物车删除该商品吗？</div>
		</div>
		<div class="btn_box">
			<a id="go" style="float: left;margin-left: 25px;" href="javascript:;">删除</a>
			<a id="back" style="float: right;margin-right: 25px;" href="javascript:;">取消</a>
		</div>
	</div>
	<div class="bt">
		<div style="float:left; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
		<span style="width:10%; display:inline-block; color:#909090; font-size:16px; font-weight: bold; text-align:center; padding-top:5px;	font-family: 微软雅黑;">购物车</span>
		<div style="float:right; width:45%; display:inline-block; border-top:1px dashed #d5d5d5; margin-top:14px;"></div>
	</div>
		<c:choose>
			<c:when test="${empty cart || empty cart.item_list}">
				<div class="empty_cart">您还没有购买任何商品，请 <a href='${pageContext.request.contextPath}/indexServlet'>返回首页</a> 购买。</div>
			</c:when>
			<c:otherwise>
				<div class="full_cart">
						<table class="cart">
				     			<tr class="t_head">
				     				<th class="my_th" style="width:50px;">全选<input type="checkbox" name="choose_all" checked></th>
				        			<th class="my_th" style="width:370px;">商品名称</th>
				        			<th class="my_th" style="width:200px;">规格</th>
				     				<th class="my_th" style="width:100px;">单价</th>
				     				<th class="my_th" style="width:200px;">购买数量</th>
				     				<th class="my_th" style="width:100px;">小计</th>
				     				<th class="my_th" style="width:80px;">操作</th>
				      			</tr>
				      			<tbody>
					      			<c:forEach var="item" items="${cart.item_list}">
									    <tr class="t_body">		
									    	<td style="display:none;">${item.goods_id}</td>
									    	<td style="width:50px;padding-left:20px;"><input type="checkbox" name="choose_item" checked value="${item.price*item.amount}"></td>	    	
										    <td style="width:370px;padding-left:100px;"><img src="${item.image}"><a class="pname">${item.name}</a></td>
										    <td style="width:200px;text-align:center;">${item.spec}</td>
									        <td class="my_td" style="width:100px;">￥${item.price}</td>
									        <td class="my_td" style="width:200px;">
									        	<c:choose>
									        		<c:when test="${item.amount>1}">
									        			<a class="subtract" href="${pageContext.request.contextPath}/updateItemServlet?id=${item.goods_id}&count=${item.amount-1}">-</a>
									        		</c:when>
									        		<c:otherwise>
									        			<a class="subtract">-</a>
									        		</c:otherwise>
									        	</c:choose>     
									        	<span class="count">${item.amount}</span>
									        	<a class="add" href="${pageContext.request.contextPath}/updateItemServlet?id=${item.goods_id}&count=${item.amount+1}">+</a>
									        </td>
									        <td class="sub_total my_td" style="width:100px;">￥${item.price*item.amount}</td>
									        <td class="my_td" style="width:80px;"><a class="delete" href="javascript:delete_item(${item.goods_id});">删除</a></td>
									    </tr>
								    </c:forEach>
				    		</tbody>
						</table>
						<div style="width:996px;height:20px;margin:0 auto;margin-top:10px;">
							<a style="float:left;height:20px;width:100px;text-align:left;margin-left:10px;color:#008000;font-size:13px;" href="${pageContext.request.contextPath}/deleteCartServlet">清空购物车</a>
							<a style="float:right;height:20px;width:100px;text-align:right;margin-right:10px;color:#008000;font-size:13px;" href="${pageContext.request.contextPath}/getBeverageListServlet?type_id=">继续购物</a>
						</div>
						<div class="gopay">
							<div class="show_total_box">总计：￥<span class="total"></span></div>
							<div class="post_box"><a class="post_btn" href="javascript:;">去结算</a></div>
						</div>
				</div>
			</c:otherwise>
		</c:choose>
	<jsp:include page="/jsp/footer.jsp"></jsp:include>
</body>
</html>