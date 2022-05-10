<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SpringDay | <spring:message code="message.cart.title"/></title>
	<!-- Css Styles -->
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
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
					<td class="si-pic"><img src="${cart.savedFilename }" alt="" style="width:80px; height: 80px;"></td>
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
					<td colspan="3">
						<p style="margin-bottom:-20px">
							<spring:message code="message.cartListAjax.conten"/>
						</p>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</body>
</html>