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
    <title>SpringDay | 직원 ID 찾기</title>

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
    <link rel="stylesheet" href="/resources/css/adminCss/empFindId.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<!-- Header -->
    <%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="adminMain"><i class="fa fa-home"></i> Home</a>
                        <span>ID 찾기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->
	
	<!-- Find ID Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>ID 찾기</h2>
                        <form action="empFindId" method="post" onsubmit="return checkForm();">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        	<div class="group-input">
                                <input type="text" id="empName" name="empName" placeholder="이름을 입력해주세요.">
                            </div>
                        	<div class="group-input">
                                <input type="text" id="empMail" name="empMail" placeholder="메일을 입력해주세요.">
                            </div>
                            <div class="group-input" id="pinNumChk_false">
                               <input type="text" id="pinNumChk" name="pinNumChk" placeholder="인증번호" disabled="disabled">
                               <input type="button" id="pinNumChk_Btn" value="확인" disabled="disabled" style="position: absolute; left: 370px; bottom: 70px;">
							   <span id="pinNumChk_warn" style="position: absolute; left: 2.23em; bottom: 44px;"></span>
                            </div>
                            <div class="group-input">
								<input type="button" id="sendMailBtn" value="인증번호 전송" style="position: absolute; left: 370px; bottom: 145px;">
                            </div>
                            <c:if test="${not empty errorMessageId }">
                            	<span style="position: absolute; left: 2.23em; bottom: 7.95em; color: red;">${errorMessageId }</span>
                            </c:if>
                            <button type="submit" class="site-btn register-btn">다음</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Find ID Form Section End -->
	
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
    <script src="/resources/js/adminJs/empFindId.js"></script>
</body>
</html>