<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <title>SpringDay | <spring:message code="message.signUp.title"/></title>

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
    <style type="text/css">
    	label span {
    		color: red;
    	}
    	span.signChk {
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
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span><spring:message code="message.signUp.title"/></span>
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
                        <h2><spring:message code="message.signUp.title"/></h2>
                        <form action="/user/signUp" method="post" onsubmit="return formChk();">
                        <sec:csrfInput/>
                        <input type="hidden" name="userAddress">
                        <input type="hidden" name="postcode" value="0">
                            <div class="group-input">
                                <label for="username"><spring:message code="message.signUp.form.name"/> <span>*</span></label>
                                <input type="text" id="username" name="userName">
                                <span class="signChk" id="signChk-name"></span>
                            </div>
                            <div class="group-input">
                                <label for="username"><spring:message code="message.signUp.form.email"/> <span>*</span></label>
                                <input type="email" id="userMail" name="userMail">
                                <span class="signChk" id="signChk-mail"></span>
                            </div>
                            <div class="group-input">
                                <label for="pass"><spring:message code="message.signUp.form.password"/> <span>*</span></label>
                                <input type="password" id="pass" name="userPw">
                                <span class="signChk" id="signChk-pw"></span>
                            </div>
                            <div class="group-input">
                                <label for="con-pass"><spring:message code="message.signUp.form.pwChk"/> <span>*</span></label>
                                <input type="password" id="con-pass">
                                <span class="signChk" id="signChk-pwChk"></span>
                            </div>
                            <div class="group-input">
                                <label><spring:message code="message.signUp.form.call"/> <span>*</span></label>
                                <input type="text" id="userCall" name="userCall" placeholder="<spring:message code='message.signUp.form.call.placeholder'/>">
                                <span class="signChk" id="signChk-tel"></span>
                            </div>
                            <div class="group-input">
                                <label><spring:message code="message.signUp.form.postcode"/></label>
                                <input type="text" id="postcode" readonly onclick="daumPostcode();">
							</div>
                            <div class="group-input">
                                <label><spring:message code="message.signUp.form.address"/></label>
                                <input type="text" id="address" readonly onclick="daumPostcode();">
							</div>
                            <div class="group-input">
                                <label><spring:message code="message.signUp.form.detailAddress"/></label>
                                <input type="text" id="detailAddress">
                                <span id="extraAddress"></span>
							</div>
                            <button type="submit" class="site-btn register-btn"><spring:message code="message.signUp.title"/></button>
                        </form>
                        <div class="switch-login">
                            <a href="/user/login" class="or-login"><spring:message code="message.header.login"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>

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
	<!-- 우편 번호로 주소찾기(다음 API) -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
	//jsp페이지 출력과 동시에 실행 
	$(function(){
		//현재 페이지를 선택했음을 알림 4/17 박나래
		$("li#menu-mypage").css("background", "#e7ab3c");
		
		//유저 이름 확인
		$("#username").keyup(function(){
			var userName = $(this).val();
			
			//글자수 세기
			if(userName.length == 0 || userName == "") {
				$("#signChk-name").text("<spring:message code='message.signUp.form.nameChkMessage'/>");
			} else {
				$("#signChk-name").text(" ");
			}
		});
		
		//유저 메일 확인
		$("#userMail").keyup(function(){
			var userMail = $(this).val();
			var pattern =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			if(userMail.length == 0 || userMail == "") {
				$("#signChk-mail").text("<spring:message code='message.signUp.form.mailChkMessage1'/>");
			} else if(pattern.test(userMail) == false) {
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
				$("#signChk-mail").text("<spring:message code='message.signUp.form.mailChkMessage2'/>");
			} else{
				$("#signChk-mail").text(" ");
			}
		});
		
		//유저 비밀번호 확인
		$("#pass").keyup(function(){
			var userPw = $(this).val();
			//글자수 8자 + 최소 한개의 영문자 + 최소 한개의 숫자 + 최소 한개의 특수 문자
			var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			
			if(userPw.length == 0 || userPw == "") {
				$("#signChk-pw").text("<spring:message code='message.signUp.form.pwChkMessage1'/>");
			} else if(userPw.length<8 || userPw.length>16 || (pattern.test(userPw) == false) ) {
				$("#signChk-pw").text("<spring:message code='message.signUp.form.pwChkMessage2'/>");
			} else{
				$("#signChk-pw").text(" ");
			}
		});
		
		//유저 비밀번호 확인 입력 여부
		$("#con-pass").keyup(function(){
			var passwordChk = $(this).val();
			var userPw = $("#pass").val();
			
			if(passwordChk != userPw) {
				$("#signChk-pwChk").text("<spring:message code='message.signUp.form.pwChkMessage3'/>");
			} else{
				$("#signChk-pwChk").text(" ");
			}
		});
		
		//유저 연락처 확인
		$("#userCall").keyup(function(){
			var userCall = $(this).val();
			// 하이푼 지우기
			var pattern = /^(?:(010\d{4})|(01[1|6|7|8|9]-\d{3,4}))(\d{4})$/;

			if(userCall.length == 0 || userCall == "") {
				$("#signChk-tel").text("<spring:message code='message.signUp.form.telChkMessage1'/>");
			} else if(pattern.test(userCall) == false) {
				$("#signChk-tel").text("<spring:message code='message.signUp.form.telChkMessage2'/>");
			} else {
				$("#signChk-tel").text(" ");
			}
		});
	});//윈도우 load시 실행하는 함수
	
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

	//우편 번호로 주소찾기(다음 API)
	function daumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				//팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
				
				//각 주소의 노출 규칙에 따라 주소를 조합한다.
				//내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = "";
				var extraAddr = "";
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === "R") { //사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				
				//사용자가 선택한 주소가 도로명 타입일 때 참고항목을 조합한다.
				if(data.userSelectedType === "R") {
					//법정동명이 있을 경우 추가한다.(법정리는 제외)
					//법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					//건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== "" && data.apartment === "Y") {
						extraAddr += (extraAddr !== "" ? "," + data.buildingName : data.buildingName);
					}
					//표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== "") {
						extraAddr = "(" + extraAddr + ")";
					}
					//조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").innerText = extraAddr;
				} else {
					document.getElementById("extraAddress").innerText = "";
				}
				
				//우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("postcode").value = data.zonecode;
				document.getElementById("address").value = addr;
				//커서를 상세주소 필드로 이동한다.
				$("#detailAddress").focus();
			}
		}).open();
	}

	function formChk() {
		var returnVal = false;
		
		//주소 hidden태그에 채우기
		var userAddress= $("#address").val() + "_" + $("#detailAddress").val() + " " + $("#extraAddress").text();
		$("input[name=userAddress]").attr("value", userAddress);
		
		//주소 입력했으면 우편번호를 controller에 보내기 , 그렇지 않으면 hidden의 value인 0이 가도록 설정
		var postcode = $("#postcode").val();
		if(postcode != null && postcode != "") {
			$("input[name=postcode]").attr("value", postcode);
		}
		
		var userName = $("#username").val();
		var userMail = $("#userMail").val();
		var userPw = $("#pass").val();
		var userPwChk = $("#con-pass").val();
		var userCall = $("#userCall").val();
		
		if(userName.length == 0 || userMail.length == 0 || userPw.length == 0 || userCall.length == 0) {
			$("#footer-modal-content").html("");
			$("#footer-modal-content").append("<spring:message code='message.signUp.formChk.modal.blankChk'/>");
			exitAlert();
			showModalAlert();
			return returnVal;
		}
		
		if(userPw != userPwChk) {
			$("#footer-modal-content").html("");
			$("#footer-modal-content").append("<spring:message code='message.signUp.formChk.modal.pwChk'/>");
			exitAlert();
			showModalAlert();
			return returnVal;
		}

		//이메일 정규식
		var pattern =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(pattern.test(userMail) == false) {
			$("#footer-modal-content").html("");
			$("#footer-modal-content").append("<spring:message code='message.signUp.formChk.modal.emailChk'/>");
			exitAlert();
			showModalAlert();
			return returnVal;
		}
		//비밀번호 정규식
		pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if(userPw.length<8 || userPw.length>16 || (pattern.test(userPw) == false)) {
			$("#footer-modal-content").html("");
			$("#footer-modal-content").append("<spring:message code='message.signUp.formChk.modal.pwChk'/>");
			exitAlert();
			showModalAlert();
			return returnVal;
		}
		
		//연락처 정규식
		pattern = /^(?:(010\d{4})|(01[1|6|7|8|9]-\d{3,4}))(\d{4})$/;
		if(pattern.test(userCall) == false) {
			$("#footer-modal-content").html("");
			$("#footer-modal-content").append("<spring:message code='message.signUp.formChk.modal.telChk'/>");
			exitAlert();
			showModalAlert();
			return returnVal;
		}
		
		returnVal = true;
		return returnVal;
	}
    </script>
</body>
</html>