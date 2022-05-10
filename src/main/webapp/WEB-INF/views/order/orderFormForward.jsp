<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<title>SpringDay | <spring:message code="message.orderFormForward.title" /></title>
	
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
						<a href="/order/cart"> 
							<spring:message code="message.cart.title" />
						</a>
						<span>
							<spring:message code="message.orderFormForward.breacrumb" />
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Form Section Begin -->

	<!-- Register Section Begin -->
	<form action="/order/orderForm" id="orderForm" method="post" onsubmit="return false">
		<div class="register-login-section spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="register-form">
							<h2>
								<spring:message code="message.orderFormForward.formTitle" />
							</h2>
							<sec:csrfInput />
							<c:forEach items="${userList }" var="user">
								<input type="hidden" name="userAddress">
								<input type="hidden" name="postcode" value="0">
								<div class="group-input">
									<label for="username">
										<spring:message code="message.signUp.form.name" />
									</label> 
									<input type="text" id="username" name="userName" value="${user.userName }" readonly style="background-color: #E6E6E6">
								</div>
								<div class="group-input">
									<label for="username">E-mail</label> 
									<input type="text" name="userMail" id="userMail" value="${userMail }">
								</div>
								<div class="group-input">
									<label>
										<spring:message code="message.signUp.form.call" />
									</label> 
									<input type="text" name="userCall" id="userCall" placeholder="(-)는 제외" value="${user.userCall }">
								</div>
							</c:forEach>
							<div class="group-input">
								<label>
									<spring:message code="message.signUp.form.postcode" />
								</label> 
								<input type="text" id="postcode" readonly onclick="daumPostcode();">
							</div>
							<div class="group-input">
								<label>
									<spring:message code="message.signUp.form.address" />
								</label>
								<input type="text" id="address" readonly onclick="daumPostcode();">
							</div>
							<div class="group-input">
								<label>
									<spring:message code="message.signUp.form.detailAddress" />
								</label> 
								<input type="text" id="detailAddress"> 
								<span id="extraAddress"></span>
							</div>
						</div>
					</div>
					<div class="col-lg-5 offset-lg-1">
						<div class="register-form">
							<h2>
								<spring:message code="message.orderFormForward.formTitle2" />
							</h2>
							<c:forEach items="${pNumArr }" var="pNum" begin="0" end="4">
								<c:if test="${pNum ne 0 }">
									<c:forEach items="${itemList }" var="item">
										<div class="group-input">
											<label> 
												${item.itemName }&emsp;&emsp;&emsp; ⨉${pNum }&emsp;&emsp;&emsp;&emsp;
												<fmt:formatNumber value="${item.price }" pattern='#,###원' />
											</label>
										</div>
									</c:forEach>
								</c:if>
							</c:forEach>
							<input type="hidden" id="amount" value="${amount }"> 
							<input type="hidden" id="cartNum" value="${cartNum }">
							<hr>
							<div style="font-size: xx-large;">
								<label> 
									<spring:message code="message.cart.form.head6" />&emsp;&emsp;&emsp;
									<fmt:formatNumber value="${totalPrice }" pattern='#,###원' />
								</label>
							</div>
							<input type="button" value="<spring:message code='message.orderFormForward.form.payBtn'/>" class="site-btn register-btn" id="buyButton" style="border-radius: 5px; font-size: 20px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
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

	<!-- 결제 api -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
	    $('#buyButton').click(function () {
	    	// 유효성 검사: 전화번호
			var call = $("#userCall").val();
			var callChk = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
			var email = $("#userMail").val(); 
			var emailChk =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			
			var address = $("#address").val();
			
			if(!callChk.test(call)){
				exitAlert();
			    $("#footer-modal-content").prepend("<spring:message code='message.signUp.form.telChkMessage2'/>");
			    showModalAlert();
			    return false;
			}
			// 유효성 검사: 이메일
			if(!emailChk.test(email)) {
				exitAlert();
			    $("#footer-modal-content").prepend("<spring:message code='message.signUp.form.mailChkMessage2'/>");
			    showModalAlert();
			    return false;
			}
			// 유효성 검사: 주소
			if(address == "") {
				exitAlert();
			    $("#footer-modal-content").prepend("<spring:message code='message.orderFormForward.formChk.addressChk'/>");
			    showModalAlert();
			    return false;
			}
	    	// 결제 api 창 
	    	// 테스트 수단: 카카오페이
			var IMP = window.IMP;
			IMP.init("imp52598827"); // "iamport" 대신 발급받은 "가맹점 식별코드"를 사용합니다
			 
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '봄날 식자재마트',
				amount : '${totalPrice}' ,//판매 가격
				buyer_email : $("#userMail").val(),
				buyer_name : '${user.userName}',
				buyer_tel : '${user.userCall}'
				
			}, function(rsp) {
				if ( rsp.success ) {
					var msg = '<spring:message code="message.orderFormForward.formChk.paySuccess"/>';
					/* 
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					*/
					// 데이터 전송 ajax
					$.ajax({
						url: "/order/orderForm",
						type: "post",
						data: {
							cartNum: $("#cartNum").val(),
							amount: $("#amount").val(),
							orderMail: $("#userMail").val(),
							orderCall: $("#userCall").val(),
							address: $("#address").val(),
							detailAddress: $("#detailAddress").val()
						}, 
						success: function(res, url) {
							if(res == 'success') {
								location.href= "/order/orderList";
							}
						}
					});
				} else {
					var msg = '<spring:message code="message.orderFormForward.formChk.payfail"/>';
					msg += '<spring:message code="message.orderFormForward.formChk.errorMsg"/>' + rsp.error_msg;
				}
				alert(msg);
			}); 
			
	    });
	</script>

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
	
		function formChk() {
			//주소 hidden태그에 채우기
			var userAddress= $("#address").val() + $("#detailAddress").val() + " " + $("#extraAddress").text();
			$("input[name=userAddress]").attr("value", userAddress);
			
			//주소 입력했으면 우편번호를 controller에 보내기 , 그렇지 않으면 hidden의 value인 0이 가도록 설정
			var postcode = $("#postcode").val();
			if(postcode != null) {
				$("input[name=postcode]").attr("value", postcode);
			}
			return true;
		}
    </script>
</body>
</html>