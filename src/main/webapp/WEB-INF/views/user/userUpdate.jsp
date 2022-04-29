<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | 회원 정보 수정</title>

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
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <a href="/user/mypage"> 마이 페이지</a>
                        <span>회원 정보 수정</span>
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
                        <h2>회원 정보 수정</h2>
                        <form action="/user/userUpdate" method="post" onsubmit="return checkForm();">
                        <sec:csrfInput/>
                        <input type="hidden" name="userAddress">
                        <input type="hidden" name="postcode" value="0">
                            <div class="group-input">
                                <label for="username">이름 *</label>
                                <input type="text" id="username" name="userName" value="${user.userName }" readonly="readonly">
                            </div>
                            <div class="group-input">
                                <label for="username">메일 주소 *</label>
                                <input type="text" id="userMail" name="userMail" value="${user.userMail }" readonly="readonly">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호 *</label>
                                <input type="button" id="pass" name="userPwBtn" value="재설정" onclick="resetPw();">
                            </div>
                            <div class="group-input">
                                <label>연락처 *</label>
                                <input type="text" id="userCall" name="userCall" placeholder="(-)는 제외" value="${user.userCall }">
                            </div>
                            <c:if test="${user.postcode == '0' }">
                            	<div class="group-input">
                                	<label>우편번호</label>
                                	<input type="text" id="postcode" readonly onclick="daumPostcode();">
								</div>
                            </c:if>
                            <c:if test="${user.postcode != '0' }">
                            	<div class="group-input">
                                	<label>우편번호</label>
                                	<input type="text" id="postcode" value="${user.postcode }" readonly onclick="daumPostcode();">
								</div>
                            </c:if>
                            <div class="group-input">
                                <label>주소</label>
                                <input type="text" id="address" value="${user.userAddress }" readonly onclick="daumPostcode();">
							</div>
                            <div class="group-input">
                                <label>상세주소</label>
                                <input type="text" id="detailAddress" value="${user.role }">
                                <span id="extraAddress"></span>
							</div>
                            <button type="submit" class="site-btn register-btn">수정</button>
                            <br><br><input type="button" value="회원 탈퇴" id="userDeleteBtn" style="float: right;">
                    		<input type="hidden" value="${sessionScope.userMail }" id="loginMail">
                        </form>
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
    <script src="/resources/js/userJs/userUpdate.js"></script>
	<!-- 우편 번호로 주소찾기(다음 API) -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
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

	function checkForm() {
		//주소 hidden태그에 채우기
		var userAddress= $("#address").val() + "_" + $("#detailAddress").val() + " " + $("#extraAddress").text();
		$("input[name=userAddress]").attr("value", userAddress);
		
		//주소 입력했으면 우편번호를 controller에 보내기 , 그렇지 않으면 hidden의 value인 0이 가도록 설정
		var postcode = $("#postcode").val();
		if(postcode != null) {
			$("input[name=postcode]").attr("value", postcode);
		}
		return true;
	}
	
	function resetPw() 
	{
		location.href = "/user/resetPw";
	}
	
	$('#userDeleteBtn').click(function() {
		confirmModal();	
		$("#footer-modal-content").prepend("정말 탈퇴하시겠습니까?");
		showModalAlert();
		
		$('#yes-button').click(function() {
			$.ajax({
				url: "/user/userDelete",
				type: "get",
				data: {
					userMail: $('#loginMail').val()
				},
				success: function() {
					exitAlert();
  					$("#footer-modal-content").prepend("탈퇴가 완료되었습니다.");
  					$("#footer-modal").fadeIn()	;
  		    		$("button[name=modalClose]").click(function() {
  		    			$("#footer-modal").fadeOut();
  		    			location.href="/user/logout";	
  		    		});
				}
			});
		});
		
		$('#no-button').click(function() {
			$("#footer-modal").fadeOut();
			return false;
		});
	})
    </script>
</body>
</html>