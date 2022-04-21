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
    <title>SpringDay | 직원용 Home</title>

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
    <%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
    
 <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div>
                        <h2>로그인완료</h2>
                        <span>상단 바에서 접속하고자 하는 메뉴를 선택해주세요</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    <hr>
    
    <div class="product-tab">
	    <div class="tab-item-content">
	        <div class="tab-content">
	            <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
	                <div class="product-content">
	                    <div class="row" style="justify-content: center;">
	                        <div class="col-lg-7">
	                            <h4>이달의 우수사원</h4>
	                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
	                                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
	                                ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
	                                aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
	                            <h5>Features</h5>
	                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
	                                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
	                                ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
	                                aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
	                        </div>
	                        <div>
	                            <img src="/resources/img/product-single/tab-desc.jpg" alt="">
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- Product Shop Section End -->
    
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/admin/adminFooter.jsp" %>

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