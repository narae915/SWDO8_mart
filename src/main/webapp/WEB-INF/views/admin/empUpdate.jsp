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
    <title>직원 정보 수정</title>

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
    <script type="text/javascript">
    function checkForm()
    {
    	var empPw = document.getElementById("empPw").value;
    	var empPwCheck = document.getElementById("empPwCheck").value;
    	var empName = document.getElementById("empName").value;
    	var position = $("#position").find("option:selected");
    	var empCall = document.getElementById("empCall").value;
    	
    	var result = false;
    	
    	if ( empPw.length == 0 )
    	{
    		alert("비밀번호를 입력해주세요.");
    		return result;
    	}
    	
    	if ( empPw != empPwCheck )
    	{
    		alert("비밀번호가 일치하지 않습니다.");
    		return result;
    	}
    	
    	if ( empName.length == 0 )
    	{
    		alert("이름을 입력해주세요.");
    		return result;
    	} 
    	
    	if ( position.val() == 0 )
    	{
    		alert("직급을 선택해주세요.")
    		return result;
    	}
    	
    	if ( empCall.length == 0 || empCall.length != 11 )
    	{
    		alert("연락처를 올바르게 입력해주세요.");
    		return result;
    	}
    	
    	if(confirm("수정을 확정하시겠습니까?") == true)
    	{
    		result = true;
    		return result;
    	}
    	else
    	{
    		return result;
    	}
    	
    	result = true;
    	
    	return result;
    }
    
     window.onload = function()
     {
    	// 직원 직급 
     	var empPosition = "${emp.position}";
     	
     	// 가져온 값을 셀렉트창에 표시
     	$("#position").val(empPosition).prop("selected", true);
     };
    </script>
    
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
                    <div class="breadcrumb-text">
                        <a href="adminMain"><i class="fa fa-home"></i> Home</a>
                        <a href="empManagement">Employee</a>
                        <span>직원 등록</span>
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
                    <div class="register-form">
                        <h2>직원 정보 수정</h2>
                        <form action="empUpdate" method="post" onsubmit="return checkForm();">
                        	
                        	<input type="hidden" name="empNum" value="${emp.empNum }">
                        
                            <div class="group-input">
                                <input type="text" id="empName" name="empName" value="${emp.empName }" readonly="readonly">
                            </div>
                            <div class="group-input">
                                <input type="text" id="empNum" value="${emp.empNum }" readonly="readonly">
                            </div>
                            <div class="group-input">
                                <input type="password" id="empPw" name="empPw" placeholder="비밀번호">
                            </div>
                            
                            <div class="group-input">
                                <input type="password" id="empPwCheck" name="empPwCheck" placeholder="비밀번호 확인">
                            </div>
                            <div class="group-input">
                               <input type="text" id="empCall" name="empCall" value="${emp.empCall }" placeholder="연락처">
                            </div>
                            <c:if test="${sessionScope.loginPosition eq '사장' || '부장'}">
                            <div class="group-input">
								<select id="position" name="position" style="width: 450px; height: 50px;">
									<option value="0" disabled="disabled" selected="selected">직급</option>
									<option value="사원">사원</option>
									<option value="주임">주임</option>
									<option value="대리">대리</option>
									<option value="과장">과장</option>
									<option value="차장">차장</option>
									<option value="부장">부장</option>
								</select>
                            </div>
                            </c:if>
                            <button type="submit" onclick="updateEmp();'" class="site-btn register-btn">수정</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
	
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
</body>

</html>