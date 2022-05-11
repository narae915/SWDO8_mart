<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SpringDay | <spring:message code="message.findIdPw.title"/></title>

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
	<link rel="stylesheet" href="/resources/css/userCss/findPw.css" type="text/css">
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
						<a href="/">
							<i class="fa fa-home"></i> Home
						</a> 
						<a href="findPw" style="color: #b2b2b2;">
							<spring:message code="message.findPw.breadcrumb1"/>
						</a> 
						<a style="color: #e7ab3c;">
							01.	<spring:message code="message.findPw.breadcrumb2"/>
						</a> 
						<span>
							02. <spring:message code="message.findPw.breadcrumb3"/>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Form Section Begin -->

	<!-- Find PW Section Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>
							<spring:message code="message.findPw.breadcrumb1"/>
						</h2>
						<form action="/user/findPw" method="post" onsubmit="return checkForm();">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="group-input">
								<input type="text" id="userMail" name="userMail" placeholder="<spring:message code='message.findPw.form.userMail'/>">
							</div>
							<div class="group-input" id="pinNumChk_false">
								<input type="text" id="pinNumChk" name="pinNumChk" placeholder="<spring:message code='message.findPw.form.pinNumChk'/>" disabled="disabled"> 
								<input type="button" id="pinNumChk_Btn" value="<spring:message code='message.findPw.form.pinNumChkBtn'/>" disabled="disabled" style="position: absolute; left: 23.2em; bottom: 4.82em;">
								<span id="pinNumChk_warn" style="position: absolute; right: 15px; bottom: 3.1em;"></span>
							</div>
							<div class="group-input">
								<input type="button" id="sendMailBtn" value="<spring:message code='message.findPw.form.sendMailBtn'/>" style="background-color: #434445; position: absolute; width: 30%; height: 50px; border-radius: 5px; left: 23.2em; bottom: 9.5em; color: white;">
							</div>
							<span id="errorMessage" style="position: absolute; right: 15px; bottom: 7.95em; color: red;"></span>
							<button type="submit" id="sendMailBtn" class="site-btn register-btn">
								<spring:message code="message.findId.form.nextBtn"/>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Find PW Form Section End -->

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
	<script src="/resources/js/userJs/findPw.js"></script>
	<script type="text/javascript">
		/* messageSource 다국어 페이지 적용 텍스트를 변수에 저장 */
		var emailChk = "<spring:message code='message.findPw.checkForm.modal.email'/>";
		var pinNumChk = "<spring:message code='message.findPw.checkForm.modal.pinNumChk'/>";
		var inputPinNum = "<spring:message code='message.findPw.checkForm.modal.inputPinNum'/>";
		var emailPinNum = "<spring:message code='message.findPw.checkForm.modal.pinNum'/>";
		var errorMessage = "<spring:message code='message.findPw.checkForm.errorMessage'/>";
		var reSendMailBtn = "<spring:message code='message.findPw.checkForm.reSendMailBtn'/>";
		var checkPinNum1 = "<spring:message code='message.findPw.checkForm.checkPinNum1'/>";
		var checkPinNum2 = "<spring:message code='message.findPw.checkForm.checkPinNum2'/>";
		var sendSuccess = "<spring:message code='message.findPw.checkForm.modal.sendSuccess'/>";
	</script>
</body>

</html>