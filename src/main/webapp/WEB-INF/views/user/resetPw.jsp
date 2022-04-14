<%@page import="org.springframework.web.bind.annotation.RequestAttribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | ID/PW 찾기 결과</title>

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
    <link rel="stylesheet" href="/resources/css/userCss/resetPw.css" type="text/css">
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
                        <a href="findPw">비밀번호 찾기</a>
                        <a style="color: #b2b2b2;">01. ID 확인</a>
                        <span style="color: #e7ab3c;">02. 비밀번호 재설정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->
	
	<!-- FindView Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                       <h2>비밀번호 재설정</h2>
						<form action="/user/resetPw" method="post" onsubmit="return checkForm();">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        	
                        	<c:if test="${not empty findUserMail }">
                        		<div class="group-input">
                                	<input type="text" id="userMail" name="userMail" value="${findUserMail }" readonly="readonly">
                           		</div>
                        	</c:if>
                        	<c:if test="${not empty sessionScope.userMail }">
                        		<div class="group-input">
                                	<input type="text" id="userMail" name="userMail" value="${sessionScope.userMail }" readonly="readonly">
                           		</div>
                        	</c:if>
                            <div class="group-input">
                                <input type="password" id="userPw" name="userPw" placeholder="비밀번호">
                            </div>
                            <div class="group-input">
                                <input type="password" id="userPwCheck" name="userPwCheck" placeholder="비밀번호 확인">
                                <span id="pw_warn" style="position: absolute; left: 2.23em; bottom: 3.1em;"></span>
                            </div>
                            <button type="submit" id="sendMailBtn" class="site-btn register-btn">확인</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- FindView Section End -->
	
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
    <script src="/resources/js/userJs/resetPw.js"></script>
</body>
</html>