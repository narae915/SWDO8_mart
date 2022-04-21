<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>SpringDay관리자 | Header</title>
</head>

<body>
    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container">
            <div class="inner-header">
	            <div class="logo" style="text-align:center;">
	                <a href="adminMain">
	                    <img src="/resources/img/emp_spring-day.png" alt="">
	                </a>
	            </div>
		        <div class="login-message" style="text-align:right;">
	              	<c:if test="${not empty sessionScope.loginName }">
	              		<span style="font-weight: bold;"> ${loginName } ${loginPosition }님 환영합니다.</span>
	              	</c:if>
	            </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>모든 메뉴</span>
                        <ul class="depart-hover">
                            <li><a href="itemManagement">상품 관리</a></li>
                            <li><a href="userManagement">회원 관리</a></li>
                            <li><a href="empManagement">직원 관리</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="itemManagement">상품 | Item</a>
                        	<ul class="dropdown">
                                <li><a href="itemManagement">상품 조회</a></li>
                                <li><a href="itemRegister">상품 등록</a></li>
                            </ul>
                        </li>
                        <li><a href="userManagement">회원 | User</a></li>
                        <li><a href="empManagement">직원 | Employee</a>
                       		<ul class="dropdown">
                        		<li><a href="empManagement">직원 조회</a></li>
                        	<c:if test="${sessionScope.loginPosition eq '사장' || sessionScope.loginPosition eq '부장'}">
                        		<li><a href="adminRegister">직원 등록</a>
                       		</c:if>
                            </ul>
                        </li>
                        <li><a href="empChatting">메신저 | Messenger</a></li>
                        <c:if test="${empty sessionScope.loginName }">
                        	<li class="active"><a href="adminLogin"><i class="fa fa-user"></i> Login</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.loginName }">
                        	<li class="active"><a href="adminLogout"><i class="fa fa-user"></i> Logout</a></li>
                        </c:if>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>