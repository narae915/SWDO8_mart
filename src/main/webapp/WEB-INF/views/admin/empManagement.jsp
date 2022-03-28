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
    <title>직원 조회</title>

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
	<link rel="stylesheet" href="/resources/css/adminCss/empManagement.css" type="text/css">
	
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<!-- Header Section Begin -->
    <header class="header-section">
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="adminMain">
                                <img src="/resources/img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">All Categories</button>
                            <div class="input-group">
                                <input type="text" placeholder="What do you need?">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>Quick Memu</span>
                        <ul class="depart-hover">
                            <li><a href="itemManagement">상품 관리</a></li>
                            <li><a href="userManagement">회원 관리</a></li>
                            <li><a href="empManagement">직원 관리</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="itemManagement">Item</a>
                        	<ul class="dropdown">
                                <li><a href="itemManagement">상품 조회</a></li>
                                <li><a href="#">상품 등록</a></li>
                            </ul>
                        </li>
                        <li><a href="userManagement">User</a></li>
                        <li><a href="empManagement">Employee</a>
                       		<ul class="dropdown">
                        		<li><a href="empManagement">직원 조회</a></li>
                        	<c:if test="${sessionScope.loginPosition eq '사장' || '부장'}">
                        		<li><a href="adminRegister">직원 등록</a>
                       		</c:if>
                            </ul>
                        </li>
                        <!-- <li><a href="messenger">Messenger</a></li> -->
                        <c:if test="${empty sessionScope.loginName }">
                        	<li class="active"><a href="adminLogin"><i class="fa fa-user"></i> Login</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.loginName }">
                        	<li class="active"><a> ${loginName } ${loginPosition }님 환영합니다.</a></li>
                        	<li class="active"><a href="adminLogout"><i class="fa fa-user"></i> Logout</a></li>
                        </c:if>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="adminMain"><i class="fa fa-home"></i> Home</a>
                        <a href="empManagement">Employee</a>
                        <span>직원 조회</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- EmpManagement Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
					<div class="cart-table">
                        <table>
                            <thead>
                                <tr style="background-color: #252525;">
                                    <th style="color: white;">Image</th>
                                    <th style="color: white;">사원 번호</th>
                                    <th style="color: white;">이름</th>
                                    <th style="color: white;">직급</th>
                                    <th style="color: white;">연락처</th>
                                    <th style="color: white;">수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
									<c:when test="${empty empList }">
										<tr>
											<td colspan="6">직원이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${empList }" var="emp">
											<tr>
												<td class="cart-pic first-row"><img src="/resources/img/cart-page/product-1.jpg" alt=""></td>
												<td><h5>${emp.empNum }</h5></td>
												<td>${emp.empName }</td>
												<td>${emp.position }</td>
												<td>${fn:substring(emp.empCall,0,3) }&nbsp;-&nbsp;${fn:substring(emp.empCall,3,7) }&nbsp;-&nbsp;${fn:substring(emp.empCall,7,11) }</td>
												<td>
												<c:choose>
													<c:when test="${sessionScope.loginPosition eq '사장' || '부장' || sessionScope.loginId == emp.empNum }">
														<input type="button" value="수정" onclick="empUpdate(${emp.empNum });">
														<input type="button" value="삭제" onclick="empDelete(${emp.empNum});">
													</c:when>
													<c:when test="${ !(sessionScope.loginPosition eq '사장' || '부장') || !(sessionScope.loginId == emp.empNum) }">
														<input type="button" value="수정" disabled>
														<input type="button" value="삭제" disabled>
													</c:when>
												</c:choose>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
                            </tbody>
                        </table>
                        
                        <!-- Paging Begin -->
						<div style="text-align: center; margin-top: 20px;">
							<!-- 현재 페이지가 첫 페이지가 아니라면, 이전 그룹/페이지로 이동 -->
							<c:if test="${navi.currentPage > 1 }">
								<!-- 이전 그룹으로 이동 -->
								<a href="/admin/empManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
									< 이전&nbsp;
								</a>
							</c:if>
							
							<!-- 반복문을 통해 현재 그룹 내 모든 페이지를 하나씩 출력 -->
							<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="pageNum">
								<!-- 출력하고자 하는 페이지 번호가 현재 접속한 페이지와 같은 경우 강조 표시 -->
								<c:if test="${pageNum == navi.currentPage }">
									<a href="/admin/empManagement?currentPage=${pageNum }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
										<span style="color: #E7AB3C; border: 1px solid;">
											&nbsp;${pageNum }
										</span>
									</a>&nbsp;
								</c:if>
								<!-- 강조하지 않는 표시 -->
								<c:if test="${pageNum != navi.currentPage }">
									<a href="/admin/empManagement?currentPage=${pageNum }" style="color: #252525; text-decoration: none; font-size: 1.5em; text-align: center;">
										${pageNum }&nbsp;
									</a>
								</c:if>
							</c:forEach>
							
							<!-- 현재 페이지가 마지막 페이지가 아니라면, 다음 페이지/그룹으로 이동 -->
							<c:if test="${navi.currentPage < navi.totalPageCount }">
								<!-- 다음 그룹으로 이동 -->
								<a href="/admin/empManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
									다음 >
								</a>
							</c:if>
						</div>
						<!-- Paging End -->
						<hr>
						<!-- Emp Search Begin -->
						<form action="empManagement" method="get" onsubmit="return searchEmp();">
							<select id="searchType" name="searchType" style="width: 15%; height: 45px; position:relative; left: 20em; bottom:-1em; border: none; font-size: 16px; border: #e7ab3c solid 3px; border-radius: 5px; color: #000; padding-right: 20px;"">
								<option value="searchEmpName">이름</option>
								<option value="searchEmpNum">사원 번호</option>
								<option value="searchPosition">직급</option>
							</select>
							<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요." style="width: 25%; height: 45px; position:relative; left: 20em; bottom:-1em; border: none; font-size: 16px; border: #e7ab3c solid 3px; border-radius: 5px; color: #000; padding-right: 20px;">
							<button type="submit" class="primary-btn" style="width:5px; height:45px; border-radius:5px; left: 20em; bottom:-1.09em"><i class="ti-search"></i></button>
						</form>
						<!-- Emp Search End -->
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- EmpManagement Section End -->

 	<!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="#"><img src="/resources/img/footer-logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello.colorlib@gmail.com</li>
                        </ul>
                        <div class="footer-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Information</h5>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Checkout</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Serivius</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>My Account</h5>
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Shopping Cart</a></li>
                            <li><a href="#">Shop</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="newslatter-item">
                        <h5>Join Our Newsletter Now</h5>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Enter Your Mail">
                            <button type="button">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="payment-pic">
                            <img src="/resources/img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

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
    <script src="/resources/js/adminJs/empManagement.js"></script>

</html>