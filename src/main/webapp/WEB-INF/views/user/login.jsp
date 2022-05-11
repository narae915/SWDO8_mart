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
	<title>SpringDay | <spring:message code="message.header.login" /></title>
	
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
	<link rel="stylesheet" href="/resources/css/userCss/login.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
	<style type="text/css">
		label span {
			color: red;
		}
	</style>
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
							<i class="fa fa-home"></i>Home
						</a> 
						<span>
							<spring:message code="message.header.login" />
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Form Section Begin -->

	<!-- Register Section Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="login-form">
						<h2>
							<spring:message code="message.header.login" />
						</h2>
						<form action="/user/auth" method="POST" onsubmit="return formChk();">
							<div class="group-input">
								<label for="username">
									<spring:message code="message.login.form.email" /> <span>*</span>
								</label> 
								<input type="email" id="username" name="userMail">
							</div>
							<div class="group-input">
								<label for="pass">
									<spring:message code="message.signUp.form.password" /> <span>*</span>
								</label>
								<input type="password" id="pass" name="userPw">
							</div>
							<div class="group-input gi-check">
								<div class="gi-more">
									<ul class="find">
										<li>
											<a href="findPw" target='_blank' class="forget-pass">
												/&ensp;&ensp;<spring:message code="message.login.form.findPw" />
											</a>
										</li>
										<li>
											<a href="findId" target='_blank' class="forget-pass">
												<spring:message code="message.login.form.findId" />&ensp;&ensp;
											</a>
										</li>
									</ul>
								</div>
							</div>
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
							<div class="group-input">
								<button type="submit" class="site-btn login-btn">
									<spring:message code="message.header.login" />
								</button>
							</div>
						</form>
						<div class="switch-login">
							<a href="/user/signUp" class="or-login">
								<spring:message code="message.login.form.signUp" />
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Register Form Section End -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- modal -->
	<div class="modal" id="footer-modal">
		<div class="modal_content" id="footer-modal-content"></div>
	</div>

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
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script type="text/javascript">
		//jsp페이지 출력과 동시에 실행
		$(function(){
			$("li#menu-mypage").css("background", "#e7ab3c");
		});
		
		// 닫기 모달
		function exitAlert() {
			$("#footer-modal-content").append('<button name="modalClose" class="primary-btn" id="footer-modal-button" style="margin-top:30px; border-radius:5px; border:none"><spring:message code="message.footer.modal.close"/></button>');
		}
		
		// 모달 출력
		function showModalAlert() {
			$("#footer-modal").fadeIn();
	
			$("button[name=modalClose]").click(function() {
				$("#footer-modal").fadeOut();
			});
		}
		
		function formChk() {
			var userMail = $("#username").val();
			var userPw = $("#pass").val();
			var returnVal = false;
			
			//메일 길이 확인
			if(userMail.length == 0) {
				$("#footer-modal-content").html("");
				$("#footer-modal-content").append("<spring:message code='message.login.formChk.modal.idChk'/>");
				exitAlert();
				showModalAlert();
				return returnVal;
			}
			
			//비밀번호 길이 확인
			if(userPw.length == 0) {
				$("#footer-modal-content").html("");
				$("#footer-modal-content").append("<spring:message code='message.signUp.form.pwChkMessage1'/>");
				exitAlert();
				showModalAlert();
				return returnVal;
			}
			
			returnVal = true;
	
			if(returnVal) {
				var response = null;
				//ID와 비밀번호 확인
				$.ajax({
					url: "/user/userChk",
					type: "POST",
					data: {
						userId: $("#username").val(),
						userPw: $("#pass").val()
					},
					async: false,
					success: function(res) {
						if(res == "no") {
							$("#footer-modal-content").html("");
							$("#footer-modal-content").append("<spring:message code='message.login.formChk.modal.idPwChk'/>");
							exitAlert();
							$("#footer-modal").fadeIn();
						}
						response = res;
					},
					error: function(e) {
						console.log("실패");
					}
				});
				
				//ID와 비밀번호가 일치하지 않다는 모달이 뜨고, 창닫기를 누르면 새로고침 된다.
				if(response == "no") {
					$("#footer-modal-button").on("click", function() {
						location.href = "/user/login";
					});
					return false;
				}
			} //ID, PW가 일치하는지 확인
			
			return returnVal;
		}// formChk 함수 닫기
	</script>
</body>

</html>