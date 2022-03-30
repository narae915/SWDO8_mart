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
    <title>Fashi | Template</title>

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
	function deButton() {
		$.ajax({
			url: "/admin/itemDelete",
			data: {
				itemNum: $("#delete-button").val()
			},
			success: function(res, url) {
				if(res == "success") {
					alert("삭제되었습니다.");
					location.href = "/admin/itemManagement";
				}
			} 
		});
	}
	
	</script>
	
	<style type="text/css">
	table, th, tr, td {
		text-align: center;
		border-collapse: collapse;
		margin: auto;
	}
	
	table {
		border: 1px #E3E3E3 solid;
		height: 50%;
		width: 100%;
	}
	
	th, td {
		font-weight: normal;
    }
    	
	th {
		border: #fff 1px solid;
		background-color: black;
		color: #fff; 
	}

	.button-cell {
		border-left: 2px #D1D1D1 solid;
	}
	
	tr:not(:last-child) {
		border-bottom: 2px #D1D1D1 solid;
	}
	
	#searchWord {
		width: 25%;
		height: 45px;
		border: none;
		font-size: 16px;
		border: #E7AB3C solid 3px;
		border-radius: 5px;
		color: #000;
		padding-right: 20px;
		position:relative;
		top:47px;
	}
	
    button {
		border:none;
		position:relative;
		transition:800ms ease all;
		outline:none;
	}
	
	button:hover {
		background:#000;
		color:#E7AB3C;
	}
	
	button:before,button:after {
		content:'';
		position:absolute;
		top:0;
		right:0;
		height:2px;
		width:0;
		background: #E7AB3C;
		transition:400ms ease all;
	}
	
	button:after {
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	
	button:hover:before, button:hover:after {
		width:100%;
		transition:800ms ease all;
	}
	#search-button {
		width:5px;
		height:45.7px;
		border-radius:5px;
		top:3.3em;
		right:1.8em;
	}
	
	#insert-button {
		vertical-align:center;
		border-radius:5px;
		left: 42%;
		margin: 5px;
		bottom: 3px;
	}
	#image-not {
		 width: 50px;
		 height: 50px;
		 display:block;
		 margin:auto;
		 margin-top: 10%;
		 margin-bottom:3%;
	}
	
	.container-h5 {
			background: linear-gradient(-45deg, #f3f5f0 50%, #969696 50%);
			border-style: solid;
			border-width: 5px;
			border-color: #E3E3E3;
			border-radius: 15px;
		}
	</style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        hello.colorlib@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        +65 11.188.888
                    </div>
                </div>
                <div class="ht-right">
                    <a href="#" class="login-panel"><i class="fa fa-user"></i>Login</a>
                    <div class="lan-selector">
                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                            <option value='yt' data-image="/resources/img/flag.jpg" data-imagecss="flag yt"
                                data-title="English">English</option>
                            <option value='yu' data-image="/resources/img/flag.jpg" data-imagecss="flag yu"
                                data-title="Bangladesh">Bangla</option>
                            <option value='yt' data-image="/resources/img/flag.jpg" data-imagecss="flag yt"
                                data-title="English">English</option>
                            <option value='yu' data-image="/resources/img/flag.jpg" data-imagecss="flag yu"
                                data-title="Bangladesh">Bangla</option>
                        </select>
                    </div>
                    <div class="top-social">
                        <a href="#"><i class="ti-facebook"></i></a>
                        <a href="#"><i class="ti-twitter-alt"></i></a>
                        <a href="#"><i class="ti-linkedin"></i></a>
                        <a href="#"><i class="ti-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="./index.html">
                                <img src="/resources/img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">All Categories</button>
                            <form action="#" class="input-group">
                                <input type="text" placeholder="What do you need?">
                                <button type="button"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                            <li class="heart-icon"><a href="#">
                                    <i class="icon_heart_alt"></i>
                                    <span>1</span>
                                </a>
                            </li>
                            <li class="cart-icon"><a href="#">
                                    <i class="icon_bag_alt"></i>
                                    <span>3</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="si-pic"><img src="/resources/img/select-product-1.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="si-pic"><img src="/resources/img/select-product-2.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>total:</span>
                                        <h5>$120.00</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="#" class="primary-btn view-card">VIEW CARD</a>
                                        <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
                                    </div>
                                </div>
                            </li>
                            <li class="cart-price">$150.00</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>All departments</span>
                        <ul class="depart-hover">
                            <li class="active"><a href="#">Women’s Clothing</a></li>
                            <li><a href="#">Men’s Clothing</a></li>
                            <li><a href="#">Underwear</a></li>
                            <li><a href="#">Kid's Clothing</a></li>
                            <li><a href="#">Brand Fashion</a></li>
                            <li><a href="#">Accessories/Shoes</a></li>
                            <li><a href="#">Luxury Brands</a></li>
                            <li><a href="#">Brand Outdoor Apparel</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="./index.html">Home</a></li>
                        <li><a href="./shop.html">Shop</a></li>
                        <li><a href="#">Collection</a>
                            <ul class="dropdown">
                                <li><a href="#">Men's</a></li>
                                <li><a href="#">Women's</a></li>
                                <li><a href="#">Kid's</a></li>
                            </ul>
                        </li>
                        <li><a href="./blog.html">Blog</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="dropdown">
                                <li><a href="./blog-details.html">Blog Details</a></li>
                                <li><a href="./shopping-cart.html">Shopping Cart</a></li>
                                <li><a href="./check-out.html">Checkout</a></li>
                                <li><a href="./faq.html">Faq</a></li>
                                <li><a href="./register.html">Register</a></li>
                                <li><a href="./login.html">Login</a></li>
                            </ul>
                        </li>
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
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Employee</a>
                        <span>상품 조회</span>
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
	                    
	                    <!-- 22/03/27~22/03/28 노채린 -->
	                    <!-- 상품 검색 -->
	                    <form action="itemManagement" method="get" onsubmit="return searchChk();">
							<select name="category" style="position:relative; top:2.9em; left:0.2em; height:45px;">
								<option value="">카테고리 선택</option>
								<option value="10">육류</option>
								<option value="20">어패류</option>
								<option value="30">과일</option>
								<option value="40">채소</option>
								<option value="50">조미료</option>
								<option value="60">음료</option>
								<option value="70">그 외</option>
							</select>
	                    	<input type="text" name="searchWord" id="searchWord" placeholder="상품의 이름을 정확히 입력해주세요.">
		                    	<button type="submit" class="primary-btn" id="search-button"><i class="ti-search"></i></button>
	                    </form>
	                    
	                    <!-- 상품 추가 -->
	                    <form action="itemInsert" method="get">
		                    	<button type="submit" class="primary-btn" id="insert-button">상품 추가</button>
	                    </form>
	                    <c:if test="${not empty itemList }">
		                    <form action="itemDelete" method="get">
		                   	<!-- 상품 관리 테이블 시작 -->
		                       <table>
		                       	<thead>
		                       		<tr>
		                       			<th style="padding-top:15px; padding-bottom:15px">IMAGE</th>
		                       			<th>상품 번호</th>
		                       			<th>이름</th>
		                       			<th>가격</th>
		                       			<th>재고</th>
		                       			<th>카테고리</th>
		                       			<th class="button-cell">수정/삭제</th>
		                       		</tr>
								</thead>
		                       	<tbody>
		                       		<c:forEach var="Item" items="${itemList }">
		                       		<tr>
		                       			<td style="width:20%; height: 200px;"><img src="/resources/img/cart-page/product-1.jpg" alt="임시사진"></td>
		                       			<td style="width:10%;">${Item.itemNum }</td>
		                       			<td style="width:10%;">${Item.itemName }</td>
		                       			<td style="width:15%;">${Item.price}</td>
		                       			<td style="width:15%;">${Item.itemAmount }</td>
		                       			<td>${Item.categoryName }</td>
		                       			<td class="button-cell">
		                       				<input type="button" onclick="itemInsert" class="primary-btn" value="수정" style="height:40px; border-radius:5px;">
		                       				<input type="button" id="delete-button" name="itemNum" class="primary-btn" style="height:40px; border-radius:5px;" value="삭제" onclick ="deButton(${Item.itemNum });">
		                       			</td>
		                       		</tr>
		                       		</c:forEach>
		                       	</tbody>
		                       </table>
		                       <!--상품 관리 테이블 끝  -->
		                        <!-- 페이징 시작 -->
		                        <div style="text-align: center; margin-top: 20px;">
									<span>
										<c:if test="${navi.currentPage > 1 }">
											<a href="/admin/itemManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
												< 이전&nbsp;
		
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/admin/itemManagement?currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/admin/itemManagement?currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
		
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/admin/itemManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
												다음 >
											</a>
										</c:if>
										
									</span>
								</div>
								<!-- 페이징 끝 -->
							</form>
						</c:if>
						<c:if test="${empty itemList }">
							<div class="container-h5">
								<a href="https://www.flaticon.com/kr/free-icons/" title="금지 아이콘">
									<img src="/resources/img/not.png" alt="금지 아이콘  제작자: Freepik - Flaticon" id="image-not">
								</a>
								<h2 style="color: #3B4A3F; text-align: center;font-weight: 900; margin-bottom:25%">상품 정보가 없습니다</h2>
							</div>
						</c:if>
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
	<script src="/resources/js/orderList.js"></script>
</body>

</html>