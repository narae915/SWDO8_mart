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
	<c:forEach items="${itemList }" var="item" varStatus="status">
		<div class="col-lg-4 col-sm-6">
			<div class="product-item">
				<div class="pi-pic">
					<img src="/resources/img/products/product-${item.itemNum }.jpg" alt="">
					<ul>
						<li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
						<li class="quick-view"><a href="/item/readItem?itemNum=${item.itemNum }">+ 상세 보기</a></li>
					</ul>
				</div>
				<div class="pi-text">
					<div class="catagory-name">${item.categoryName }</div>
					<a href="#"><h5>${item.itemName }</h5></a>
					<!-- 가격사이에 ,를 찍기 위해 fmt 사용 -->
					<div class="product-price"><fmt:formatNumber value="${item.price }" pattern="#,###"/></div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>