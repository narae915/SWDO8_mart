<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>SpringDay | 결제</title>

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
                        <a href="/"> 장바구니</a>
                        <span>결제</span>
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
                <div class="col-lg-6">
                    <div class="register-form">
                        <h2>결제 정보</h2>
                        <form action="/order/orderForm" method="" onsubmit="">
                        <sec:csrfInput/>
                        <c:forEach items="${userList }" var="user">
                        <input type="hidden" name="userAddress">
                        <input type="hidden" name="postcode" value="0">
                            <div class="group-input">
                                <label for="username">이름</label>
                                <input type="text" id="username" name="userName" value="${user.userName }">
                            </div>
                            <div class="group-input">
                                <label for="username">E-mail</label>
                                <input type="text" name="userMail" value="${userMail }">
                            </div>
                            <div class="group-input">
                                <label>전화번호 </label>
                                <input type="text" name="userCall" placeholder="(-)는 제외" value="${user.userCall }">
                            </div>
                            </c:forEach>
                            
                            <div class="group-input">
                                <label>우편번호</label>
                                <input type="text" id="postcode" readonly onclick="daumPostcode();">
							</div>
                            <div class="group-input">
                                <label>주소</label>
                                <input type="text" id="address" readonly onclick="daumPostcode();">
							</div>
                            <div class="group-input">
                                <label>상세주소</label>
                                <input type="text" id="detailAddress">
                                <span id="extraAddress"></span>
							</div>
                            <button type="submit" class="site-btn register-btn" style="display: inline-block;left: 48em;bottom: 28em; position: relative; width:82%; ">결제하기</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1">
                	<div class="orderForm-form">
                		<h2>주문 정보</h2>	
						<div class="group-input">
							<label>상품명&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;수량&emsp;&emsp;&emsp;가격</label>
						</div>
						<c:forEach items="${itemList }" var="item">
						<c:forEach items="${pNumArr }" var="pNum" begin="0" end="4">
							<div class="group-input">
								<label>
									${item.itemName }&emsp;&emsp;&emsp;&emsp;&emsp;
									⨉${pNum }&emsp;&emsp;&emsp;
									<fmt:formatNumber value="${item.price }" pattern='#,###원' />
								</label>
							</div>
						</c:forEach>
						</c:forEach>
						<hr>
						<div class="group-input" style="font-size: xx-large;">
							<label>합계&emsp;&emsp;<fmt:formatNumber value="${totalPrice }" pattern='#,###원' /></label>
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