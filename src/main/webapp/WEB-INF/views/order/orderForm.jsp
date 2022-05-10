<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- <meta charset="UTF-8"> -->
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SpringDay | forward</title>
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
</head>

<body>
	<!-- 22-04-07 노채린 -->
	<!-- cart.jsp와 orderFormForward.jsp의 중간 역할. -->
	<jsp:forward page="orderFormForward.jsp">
		<jsp:param value="" name="" />
	</jsp:forward>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/"> 
							<i class="fa fa-home"></i> Home
						</a> 
						<a href="/order/cart"> 
							<spring:message code="message.cart.title" />
						</a> 
						<span> 
							<spring:message code="message.orderForm.breadcrumb.paymentInfo" />
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Faq Section Begin -->
	<div class="faq-section spad">
		<!-- 본문 상단 여백 -->
		<div class="container">
			<!-- 본문 좌측 여백 -->
			<div class="row">
				<!-- flex 설정 -->

				<div class="col-lg-12">
					<!-- 본문을 우측으로 조금 변경 -->
					<div class="faq-accordin">
						<!-- 폰트 크기, 아이콘 -->
						<!-- 22-04-06 노채린 -->
						<input type="hidden" id="totalPrice" val="">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Faq Section End -->

	<!-- Footer Section Begin -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<script type="text/javascript">
	//jsp페이지 출력과 동시에 실행 
	$(function(){
		//현재 페이지를 선택했음을 알림 4/17 박나래
		$("li#menu-mypage").css("background", "#e7ab3c");
	});
    </script>
</body>
</html>