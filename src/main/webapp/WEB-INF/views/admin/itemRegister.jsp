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
    <title>상품 추가</title>

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

	<style type="text/css">
	table, th, tr, td {
		text-align: center;
		border-collapse: collapse;
		margin: auto;
	}
	
	table {
		border: 1px #E3E3E3 solid;
		height: 50%;
		width: 75%;
	}
	
	th, td {
		font-weight: normal;
    }
    	
	th {
		font-weight: 800;
		border: #fff 1px solid;
		background-color: black;
		color: #fff; 
	}

	tr:not(:last-child) {
		border-bottom: 2px #D1D1D1 solid;
	}
	
	.text-type {
		width:150px;
	}
	
		
    input[type="submit"] {
		border:none;
		position:relative;
		transition:800ms ease all;
		outline:none;
	}
	
	input[type="submit"]:hover {
		background:#000;
		color:#E7AB3C;
	}
	
	input[type="submit"]:before,input[type="submit"]:after {
		content:'';
		position:absolute;
		top:0;
		right:0;
		height:2px;
		width:0;
		background: #E7AB3C;
		transition:400ms ease all;
	}
	
	input[type="submit"]:after {
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	
	input[type="submit"]:hover:before, input[type="submit"]:hover:after {
		width:100%;
		transition:800ms ease all;
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
                        <a href="/admin/adminMain">Employee</a>
                        <a href="/admin/itemManagement">상품 조회</a>
                        <span>상품 추가</span>
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
                <div class="col-lg-12"> <!-- 본문을 우측으로 조금 변경 -->
                    <div class="faq-accordin"> <!-- 폰트 크기, 아이콘 -->
                    
                    <!-- 22/03/30, 04/16 노채린 -->
                    <!-- 상품 신규 등록 -->
                    <form action="itemRegisterForward" method="POST">
                       <table>
                       		<tr>
                       			<th style="padding-top:15px; padding-bottom:15px">IMAGE</th>
                       			<td style="width:20%; height: 200px;"><img src="/resources/img/cart-page/product-1.jpg" alt="임시사진"></td>
                       			<th>카테고리</th>
                       			<td>
                       				<select name="category" id="category">
	                       				<option value="">카테고리 선택</option>
	                       				<option value="10">육류</option>
	                       				<option value="20">어패류</option>
	                       				<option value="30">과일</option>
	                       				<option value="40">채소</option>
	                       				<option value="50">조미료</option>
	                       				<option value="60">음료</option>
	                       				<option value="70">그 외</option>
	                       			</select>
	                       		</td>
                       		</tr>
                       		<tr>
                       			<th style="height:80px; width:20%">상품 이름</th>
                       			<td>
                       				<input type="text" name="itemName" class="text-type" id="itemName">
                       			</td>
                       			<th style="width:18%">가격</th>
                       			<td>
                       				<input type="text" name="price" class="text-type" id="price">
                       			</td>
                       		</tr>
                       		<tr>
                       			<th style="height:80px;">재고</th>
                       			<td style="width:40%">
                       				<input type="text" name="itemAmount" class="text-type" id="itemAmount">
                       			</td>
                       			<th></th>
                       			<td style="width:50%">
                       				<input type="submit" class="primary-btn" value="완료" style="height:40px; border-radius:5px;">
                       			</td>
                       		</tr>
                       </table>
                       
                       <!-- 수정 시 수정값 -->
                       <input type="hidden" name="updateNum" value="updateNum">
                       
                       <!--상품 관리 테이블 끝  -->
					</form>
                    </div>
                </div>
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