<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SpringDay | <spring:message code="message.userUpadate.title" /></title>
	
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
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
	<style type="text/css">
		#userDeleteBtn 
		{
			background-color: #ebebe4;
			color: #b2b2b2;
			border-radius: 5px;
			border: 0;
			outline: 0;
		}
		
		#userDeleteBtn:hover 
		{
			background-color: #ebebe4;
			color: black;
			font-weight: bold;
			border-radius: 5px;
			border: 0;
			outline: 0;
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
							<i class="fa fa-home"></i> Home
						</a> 
						<a href="/user/mypage">
						 	<spring:message code="message.userUpadate.Breadcrumb" />
						 </a> 
						<span>
							<spring:message code="message.userUpadate.title" />
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
					<div class="register-form">
						<h2><spring:message code="message.userUpadate.title" /></h2>
						<form action="/user/userUpdate" method="post" onsubmit="return checkForm();">
							<sec:csrfInput />
							<input type="hidden" name="userAddress"> <input type="hidden" name="postcode" value="0">
							<div class="group-input">
								<label for="username">
									<spring:message code="message.signUp.form.name" /> *
								</label> 
								<input type="text" id="username" name="userName" value="${user.userName }" readonly="readonly">
							</div>
							<div class="group-input">
								<label for="username">
									<spring:message code="message.signUp.form.email" /> *
								</label> 
								<input type="text" id="userMail" name="userMail" value="${user.userMail }" readonly="readonly">
							</div>
							<div class="group-input">
								<label for="pass">
									<spring:message code="message.signUp.form.password" /> *
								</label> 
								<input type="button" id="pass" name="userPwBtn" value="<spring:message code='message.userUpadate.form.userPwResetBtn' />" onclick="resetPw();">
							</div>
							<div class="group-input">
								<label>
									<spring:message code="message.signUp.form.call" /> *
								</label> 
								<input type="text" id="userCall" name="userCall" placeholder="<spring:message code='message.signUp.form.call.placeholder' />" value="${user.userCall }">
							</div>
							<c:if test="${user.postcode == '0' }">
								<div class="group-input">
									<label>
										<spring:message code="message.signUp.form.postcode" />
									</label> 
									<input type="text" id="postcode" readonly onclick="daumPostcode();">
								</div>
							</c:if>
							<c:if test="${user.postcode != '0' }">
								<div class="group-input">
									<label>
										<spring:message code="message.signUp.form.postcode" />
									</label> 
									<input type="text" id="postcode" value="${user.postcode }" readonly onclick="daumPostcode();">
								</div>
							</c:if>
							<div class="group-input">
								<label>
									<spring:message code="message.signUp.form.address" />
								</label> 
								<input type="text" id="address" value="${user.userAddress }" readonly onclick="daumPostcode();">
							</div>
							<div class="group-input">
								<label>
									<spring:message code="message.signUp.form.detailAddress" />
								</label> 
								<input type="text" id="detailAddress" value="${user.role }"> 
								<span id="extraAddress"></span>
							</div>
							<button type="submit" class="site-btn register-btn">
								<spring:message code="message.userUpadate.form.submitBtn" />
							</button>
							<br><br>
							<input type="button" value="<spring:message code='message.userUpadate.form.userDeleteBtn' />" id="userDeleteBtn" style="float: right;"><br>
							<span style="color: red; font-size: 15px; letter-spacing: 0px;">
								<spring:message code="message.userUpadate.userDeleteWarn" />
							</span>
							<input type="hidden" value="${sessionScope.userMail }" id="loginMail">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Register Form Section End -->

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
	<script src="/resources/js/userJs/userUpdate.js"></script>
	<!-- ?????? ????????? ????????????(?????? API) -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	var blankChk = "<spring:message code='message.signUp.formChk.modal.blankChk'/>";
	var mailChkMessage = "<spring:message code='message.signUp.form.mailChkMessage2'/>";
	var telChk = "<spring:message code='message.signUp.formChk.modal.telChk'/>";
	//?????? ????????? ????????????(?????? API)
	function daumPostcode() 
	{
		new daum.Postcode
		({
			oncomplete: function(data) 
			{
				//???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????
				
				//??? ????????? ?????? ????????? ?????? ????????? ????????????.
				//???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
				var addr = "";
				var extraAddr = "";
				
				//???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
				if ( data.userSelectedType === "R" ) //???????????? ????????? ????????? ???????????? ??????
				{ 
					addr = data.roadAddress;
				} 
				else // ???????????? ?????? ????????? ???????????? ??????(J)
				{ 
					addr = data.jibunAddress;
				}
				
				//???????????? ????????? ????????? ????????? ????????? ??? ??????????????? ????????????.
				if ( data.userSelectedType === "R" ) 
				{
					//??????????????? ?????? ?????? ????????????.(???????????? ??????)
					//???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
					if ( data.bname !== "" && /[???|???|???]$/g.test(data.bname) ) 
					{
						extraAddr += data.bname;
					}
					//???????????? ??????, ??????????????? ?????? ????????????.
					if ( data.buildingName !== "" && data.apartment === "Y" ) 
					{
						extraAddr += (extraAddr !== "" ? "," + data.buildingName : data.buildingName);
					}
					//????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
					if ( extraAddr !== "" ) 
					{
						extraAddr = "(" + extraAddr + ")";
					}
					//????????? ??????????????? ?????? ????????? ?????????.
					document.getElementById("extraAddress").innerText = extraAddr;
				} 
				else 
				{
					document.getElementById("extraAddress").innerText = "";
				}
				
				//??????????????? ?????? ????????? ?????? ????????? ?????????.
				document.getElementById("postcode").value = data.zonecode;
				document.getElementById("address").value = addr;
				//????????? ???????????? ????????? ????????????.
				$("#detailAddress").focus();
			}
		}).open();
	}

	/* ???????????? ????????? */
	function resetPw() 
	{
		// ????????? ???????????? ??????
		location.href = "/user/resetPw";
	}
	
	/* ?????? ?????? */
	$('#userDeleteBtn').click(function() 
	{
		confirmModal();
		$("#footer-modal-content").html("");
		$("#footer-modal-content").append('<button class="primary-btn" id="yes-button" style="border-radius:5px; position: relative; top: 45px; right: 60px; width: 98px;"><spring:message code="message.footer.modal.yes" /></button>');
		$("#footer-modal-content").append('<button class="primary-btn" id="no-button" style="border-radius:5px; position: relative; left: 60px;"><spring:message code="message.footer.modal.no" /></button>');
		$("#footer-modal-content").prepend("<spring:message code='message.userUpadate.modal.userDelete' />");
		showModalAlert();
		
		$('#yes-button').click(function() 
		{
			$.ajax
			({
				url: "/user/userDelete",
				type: "get",
				data: 
				{
					userMail: $('#loginMail').val()
				},
				success: function() 
				{
					exitAlert();
  					$("#footer-modal-content").prepend("<spring:message code='message.userUpadate.modal.successDelete' />");
  					$("#footer-modal").fadeIn()	;
  		    		$("button[name=modalClose]").click(function() 
  		    		{
  		    			$("#footer-modal").fadeOut();
  		    			location.href="/user/logout";	
  		    		});
				}
			});
		});
		
		$('#no-button').click(function() 
		{
			$("#footer-modal").fadeOut();
			return false;
		});
	})
    </script>
</body>
</html>