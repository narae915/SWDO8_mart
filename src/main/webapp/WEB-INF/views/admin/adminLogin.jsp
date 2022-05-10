<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>SpringDay | 직원 로그인</title>

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
    <link rel="stylesheet" href="/resources/css/adminCss/adminLogin.css" type="text/css">
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
                        <span>Login</span>
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
                    <div class="login-form">
                        <h2>로그인</h2>
                        <form action="/admin/adminLogin" method="post" onsubmit="return checkForm();">
                           	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="group-input">
                                <input type="text"  id="empNum" name="empNum"placeholder="ID를 입력해주세요.">
                            </div>
                            <div class="group-input">
                                <input type="password"  id="empPw" name="empPw"placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="saveIdChk">
                                        ID 기억하기
                                        <input type="checkbox" id="saveIdChk">
                                        <span class="checkmark"></span>
                                    </label>
                                    <ul class="find">
                                    	<li><a href="empFindPw" target="_blank" class="forget-pass">/&ensp;&ensp;비밀번호 찾기</a></li>
                                    	<li><a href="empFindId" target="_blank" class="forget-pass">ID 찾기&ensp;&ensp;</a></li>
                                    </ul>
                                </div>
                            </div>
                            <button type="submit" class="site-btn login-btn" id="loginBtn">로그인</button>
                        </form>
                        <div class="switch-login">
                        	<c:if test="${empty errorMessage }">
                        		 <span class="or-login">관리자 페이지에 오신 것을 환영합니다.</span>
                        	</c:if>
                        	<c:if test="${not empty errorMessage }">
                        		<span class="or-login" id="login-err">${errorMessage }</span>
                        	</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    
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
    <script src="/resources/js/adminJs/adminLogin.js"></script>
</body>


</html>