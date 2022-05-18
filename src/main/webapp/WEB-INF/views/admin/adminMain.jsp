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
    <link rel="stylesheet" href="/resources/css/adminCss/adminMain.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	
	<!-- Header -->
    <%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
    
    <br>
    
    <div class="product-tab">
	    <div class="tab-item-content">
	        <div class="tab-content">
	            <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
	                <div class="product-content">
	                    <div class="row">
	                        <div class="col-lg-7">
	                            <h3>이달의 우수사원</h3><br>
	                            <h4>성명 : 노채린</h4>
	                            <h4>소속 : 영업 1팀</h4><br>
	                            <p>봄날24식자재마트 2022년 4월 우수사원으로 선정되었습니다.<br>
	                            	매사에 근면/성실하며 타의 모범이 되어 우수사원으로 선정함</p>
	                        </div>
	                        <div>
	                            <img id="good-emp-member" src="/resources/img/product-single/tab-desc.jpg" style="width:400px; height:400px;">
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