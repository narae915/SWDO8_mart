<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay * 결제 정보 입력</title>

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
	<script src="https://kit.fontawesome.com/af95d2c333.js" crossorigin="anonymous"></script>
	
	<style>
		table, th, tr, td {
			border: 1px solid #000
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
                        <a href="/order/cart">장바구니</a>
                        <span>결제 정보 입력</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
	
    <!-- Faq Section Begin -->
    <div class="faq-section spad"> <!-- 본문 상단 여백 -->
        <div class="container"> <!-- 본문 좌측 여백 -->
            <div class="row"> <!-- flex 설정 -->
				<!-- 22-04-06 ~ 22-04-08 노채린 -->
				<div class="col-md-10" style="float:right">
					<c:forEach var="User" items="${userList }">
						<h2>받는사람 정보</h2>
						<table>
							<tr>
							
								<th colspan="2">이름</th>
								<td><input type="text" value="${User.userName }"></td>
							</tr>
							<tr>
								<th colspan="2">전화번호</th>
								<td><input type="text" value="${User.userCall }"></td>
							</tr>
							<tr>
								<th rowspan="2" style="width: 90px; height: 160px;">주소</th>
								<td style="width: 90px; height: 80px;">
									기존 주소
								</td>
								<td>
									<label>
										<input type="radio" name = "formAddress" value="preAddress" checked>
										<input type="text" value="${User.userAddress }" readonly style="width: 430px">
									</label>
								</td>
							</tr>
							<tr>
								<td>
									신규 주소
								</td>
								<td>
									<label>
										<input type="radio" name = "formAddress" value="newAddress" style="position:relative; top:1em">
										<input type="hidden" id = "formAddress">	<!-- 주소+상세 주소를 붙여서 밸류에 넣을 용도 -->
									</label>
									<input type="text" placeholder="신규 주소" style="width: 430px;">
									<input type="button" value="우편번호 찾기">
									<input type="text" placeholder="신규 상세주소" style="width: 430px; position:relative; left:16px;">
								</td>
							<tr>	
								<th colspan="2">이메일</th>
								<td><input type="text" value="${userMail }"></td>
							</tr>
						</table>
					</c:forEach>
				</div>
				
				<div class="col-md-12" style="float:right; margin-top: 3em;">
					<h2>주문 목록</h2>
					<table style="border:1px solid #000;">
						<tr>
							<th>상품명</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
						<tr>
							<td>상품이름값1</td>
							<td>수량값1</td>
							<td>금액값1</td>
						</tr>
						<tr>
							<th>합계</th>
							<td>
							<%=request.getAttribute("total3") %>
							</td>
						</tr>
					</table>
				</div>			
				
				 <%-- <table border="1">
			        <tr>
			        	<td>합계</td>
			        	<!-- cart.jsp에서 가져온 총 계 -->
			        	<td><%=request.getParameter("totalPrice") %></td>
			        	<td>체크박스</td>
			    		<td><%= request.getParameter("cartItemNum0") %></td>
			        	<td>체크박스</td>
			    		<td><%= request.getParameter("cartItemNum1") %></td>
			        	<td>체크박스</td>
			    		<td><%= request.getParameter("cartItemNum2") %></td>
			        	<td>체크박스</td>
			    		<td><%= request.getParameter("cartItemNum3") %></td>
			        	<td>체크박스</td>
			    		<td><%= request.getParameter("cartItemNum4") %></td>
			        	<td>수량</td>
			    		<td><%= request.getParameter("cartItemAmount0") %></td>
			        	<td>수량</td>
			    		<td><%= request.getParameter("cartItemAmount1") %></td>
			        	<td>수량</td>
			    		<td><%= request.getParameter("cartItemAmount2") %></td>
			        	<td>수량</td>
			    		<td><%= request.getParameter("cartItemAmount3") %></td>
			        	<td>수량</td>
			    		<td><%= request.getParameter("cartItemAmount4") %></td>
			        </tr>
			    </table> --%>
			    
                  </div>
              </div>
          </div>
    <!-- Faq Section End -->
    
    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->

    <!-- Footer Section Begin -->
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
</body>

</html>