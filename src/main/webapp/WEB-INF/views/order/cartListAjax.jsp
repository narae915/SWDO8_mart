<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tbody id="cartHover">
			<c:if test="${cartList == null }">
				<tr>
					<td>${requestScope.emptyCart }</td>
				</tr>
			</c:if>
			<c:if test="${cartList != null}">
			<c:forEach items="${cartList }" var="cart" varStatus="status">
				<tr>
					<td class="si-pic"><img src="/resources/img/select-product-1.jpg" alt=""></td>
					<td class="si-text">
						<div class="product-selected">
							<p><fmt:formatNumber value="${cart.price }" pattern="#,###"/> x ${cart.cartAmount }</p>
							<h6>${cart.itemName }</h6>
						</div>
					</td>
					<td class="si-close">
						<i class="ti-close" onclick="deleteCart(${cart.cartNum }, ${cart.itemNum });"></i>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3" style="vertical-align : bottom;">최근에 넣은 상품 3개까지 확인가능</td>
			</tr>
			<tr>
				<td colspan="3" style="vertical-align : top;">전체 상품은 아래를 클릭해주세요</td>
			</tr>
			</c:if>
		</tbody>
	</table>
</body>
</html>