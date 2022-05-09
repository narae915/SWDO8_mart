<%@page import="org.springframework.web.bind.annotation.RequestAttribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SpringDay | <spring:message code="message.findView.title"/></title>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/userCss/findView.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
</head>

<body>
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
						<a href="../">
							<i class="fa fa-home"></i> Home
						</a> 
						<a href="findId">
							<spring:message code="message.findId.breadcrumb"/>
						</a> 
						<span>
							<spring:message code="message.findView.breadcrumb"/>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Form Section Begin -->

	<!-- FindView Section Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2><spring:message code="message.findView.breadcrumb"/></h2>
						<c:choose>
							<c:when test="${not empty sessionScope.findId }">
								<span style="font-weight: bold;">${findId }</span>
							</c:when>
							<c:otherwise>
								<h4 style="text-align: center; font-weight: bold; color: red;">
									<spring:message code="message.findView.errorMessage"/>
								</h4>
							</c:otherwise>
						</c:choose>
						<br>
						<hr>
						<div style="float: right;">
							<a href="login" class="loginLink"><spring:message code="message.header.login"/></a> 
							<a style="color: #b2b2b2;">&ensp;&ensp;|&ensp;&ensp;</a> 
							<a href="findPw" class="findPwLink"><spring:message code="message.login.form.findPw"/></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FindView Section End -->

	<!-- Footer -->
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
</body>
</html>